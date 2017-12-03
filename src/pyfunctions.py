import numpy as np
import pandas as pd
import scipy.stats as scs

def create_dummy_vars(df, delim='#', null_fill=-1):
    '''
    Generate dummy variables from catagorical variables in the dataframe (df)
    --------
    PARAMETERS
    df: pd.DataFrame
        -   Contains data to model.
    delim: str (default='#')
        -   character to use when spliting original cat column name from value
            and null value from null_indicator
    null_fill: int (default=-1)
        -   value to use to replace all null values.  This value should be out of the range
            of the given dataset.
    --------
    RETURNS
    dfdummy: pd.DataFrame
        -   Original dataframe with catagorical values replaced by null
    '''
    dtypes = pd.Series([df[x].dtype for x in df.columns])
    is_numeric = dtypes.apply(lambda x: True if x == int or x == float else False)
    num_cols = df.columns[is_numeric]
    cat_cols = df.columns[~is_numeric]
    dfdummy = df.copy()
    for col in cat_cols:
        for value in df[col].unique():
            dfdummy['{}{}{}'.format(col, delim, value)] \
                                    = dfdummy[col] == value
        dfdummy.drop(col, axis=1, inplace=True)
    for col in num_cols:
        dfdummy["{}{}is_null".format(col, delim)] = dfdummy[col].isnull()
        dfdummy[col].fillna(null_fill, inplace=True)
    return dfdummy

def reduce_variables(df, y_col, min_r2, max_cov_r2):
    '''
    Reduces the number of variables in a dataframe by eliminating all variables with an r2 below a given threshold and eliminating half of the variables with too high of a covariance.
    --------
    PARAMETERS
    --------
    RETURNS
    
    '''
    y = df[y_col]
    score = {}
    for col in df.columns:
        X = df[col]
        score[col] = scs.linregress(y, X).rvalue
    score = pd.Series(score)
    abs_score = np.abs(score)
    ## ignore plot
    #plt.scatter(np.arange(abs_score.size), abs_score.sort_values())
    keep_cols = abs_score[abs_score > min_r2]
    cov_score = pd.Series()
    for col1, rval1 in keep_cols.iteritems():
        y = df[col1]
        for col2, rval2 in keep_cols.iteritems():
            if col1 == col2:
                continue
            X = df[col2]
            cov_score['{}%{}'.format(col1,col2)] = scs.linregress(y, X).rvalue
    abs_cov_score = np.abs(cov_score)
    ## ignore plot
    #plt.scatter(np.arange(abs_cov_score.size), abs_cov_score.sort_values())
    now_drop = abs_cov_score[(abs_cov_score > max_cov_r2) & (abs_cov_score != 1)]
    ## drop every other value (because they will be in pairs)
    drops = now_drop.sort_values(ascending=False).index[::2]
    drops = pd.Series(drops).apply(lambda x: x.split('%')[0])
    new_keep_cols = list(keep_cols.drop(list(drops)).index)
    new_keep_cols.append(y_col)
    return df[new_keep_cols]