
*import training data for SalePrice analysis;
proc import datafile="/home/bcoari0/sasuser.v94/train.csv" 
out=train dbms=csv replace; 
getnames=yes;
run;

*Creating Dummy Variables and performing log transforms, adding 1 to the base before the log transform to account for 0 values if necessary;
Data train_dummy;
set train;
LogSalePrice = Log(SalePrice);
IntLotFrontage = int(LotFrontage);
LogMasVnrArea = Log(MasVnrArea+1);
LogBsmtFinSF1 = Log(BsmtFinSF1+1);
Log1stFlrSF = Log('1stFlrSF'n);
LogPoolArea = Log(PoolArea+1);
LogMiscVal = Log(MiscVal+1);
LogWoodDeckSF = Log(WoodDeckSF+1);
LogEnclosedPorch = Log(EnclosedPorch+1);
Log3SsnPorch = Log('3SsnPorch'n+1);
LogScreenPorch = Log(ScreenPorch+1);

CubeBsmtFinSF1 =  BsmtFinSF1**3;
Cube2ndFlrSF = '2ndFlrSF'n**3;
CubeYearRemodAdd = YearRemodAdd**3;
CubeLotFrontage = IntLotFrontage**3;
LogOpenPorchSF = Log(OpenPorchSF+1);
LogGarageArea = Log(GarageArea);
LogLotArea = Log(LotArea);
LogKitchenAbvGr = Log(KitchenAbvGr);
LogYearBuilt = Log(YearBuilt);
LogBsmtFullBath = Log(BsmtFullBath);
LogHalfBath = Log(HalfBath);
SqrtFullBath = sqrt(FullBath);
SqrtEnclosedPorch = sqrt(EnclosedPorch);
SqrtTotRmsAbvGrd = sqrt(TotRmsAbvGrd);
SqrtFireplaces = sqrt(Fireplaces);
SqrtBsmtUnfSF = sqrt(BsmtUnfSF);
SqrtWoodDeckSF = sqrt(WoodDeckSF);
SqrtBedroomAbvGr = sqrt(BedroomAbvGr);
Sqrt1stFlrSF = sqrt('1stFlrSF'n);
SqrGarageYrBlt = GarageYrBlt**2;
SqrMasVnrArea = MasVnrArea**2;

Alley_dum0 = 0;
Alley_dum1 = 0;
LotShape_dum0 = 0;
LotShape_dum1 = 0;
LotShape_dum2 = 0;
LandContour_dum0 = 0;
LandContour_dum1 = 0;
LandContour_dum2 = 0;
Utilities_dum0 = 0;
LotConfig_dum0 = 0;
LotConfig_dum1 = 0;
LotConfig_dum2 = 0;
LotConfig_dum3 = 0;
LandSlope_dum0 = 0;
LandSlope_dum1 = 0;
Neighborhood_dum0 = 0;
Neighborhood_dum1 = 0;
Neighborhood_dum2 = 0;
Neighborhood_dum3 = 0;
Neighborhood_dum4 = 0;
Neighborhood_dum5 = 0;
Neighborhood_dum6 = 0;
Neighborhood_dum7 = 0;
Neighborhood_dum8 = 0;
Neighborhood_dum9 = 0;
Neighborhood_dum10 = 0;
Neighborhood_dum11 = 0;
Neighborhood_dum12 = 0;
Neighborhood_dum13 = 0;
Neighborhood_dum14 = 0;
Neighborhood_dum15 = 0;
Neighborhood_dum16 = 0;
Neighborhood_dum17 = 0;
Neighborhood_dum18 = 0;
Neighborhood_dum19 = 0;
Neighborhood_dum20 = 0;
Neighborhood_dum21 = 0;
Neighborhood_dum22 = 0;
Neighborhood_dum23 = 0;
Condition1_dum0 = 0;
Condition1_dum1 = 0;
Condition1_dum2 = 0;
Condition1_dum3 = 0;
Condition1_dum4 = 0;
Condition1_dum5 = 0;
Condition1_dum6 = 0;
Condition1_dum7 = 0;
Condition2_dum0 = 0;
Condition2_dum1 = 0;
Condition2_dum2 = 0;
Condition2_dum3 = 0;
Condition2_dum4 = 0;
Condition2_dum5 = 0;
Condition2_dum6 = 0;
BldgType_dum0 = 0;
BldgType_dum1 = 0;
BldgType_dum2 = 0;
BldgType_dum3 = 0;
HouseStyle_dum0 = 0;
HouseStyle_dum1 = 0;
HouseStyle_dum2 = 0;
HouseStyle_dum3 = 0;
HouseStyle_dum4 = 0;
HouseStyle_dum5 = 0;
HouseStyle_dum6 = 0;
RoofStyle_dum0 = 0;
RoofStyle_dum1 = 0;
RoofStyle_dum2 = 0;
RoofStyle_dum3 = 0;
RoofStyle_dum4 = 0;
RoofMatl_dum0 = 0;
RoofMatl_dum1 = 0;
RoofMatl_dum2 = 0;
RoofMatl_dum3 = 0;
RoofMatl_dum4 = 0;
RoofMatl_dum5 = 0;
RoofMatl_dum6 = 0;
Exterior1st_dum0 = 0;
Exterior1st_dum1 = 0;
Exterior1st_dum2 = 0;
Exterior1st_dum3 = 0;
Exterior1st_dum4 = 0;
Exterior1st_dum5 = 0;
Exterior1st_dum6 = 0;
Exterior1st_dum7 = 0;
Exterior1st_dum8 = 0;
Exterior1st_dum9 = 0;
Exterior1st_dum10 = 0;
Exterior1st_dum11 = 0;
Exterior1st_dum12 = 0;
Exterior2nd_dum0 = 0;
Exterior2nd_dum1 = 0;
Exterior2nd_dum2 = 0;
Exterior2nd_dum3 = 0;
Exterior2nd_dum4 = 0;
Exterior2nd_dum5 = 0;
Exterior2nd_dum6 = 0;
Exterior2nd_dum7 = 0;
Exterior2nd_dum8 = 0;
Exterior2nd_dum9 = 0;
Exterior2nd_dum10 = 0;
Exterior2nd_dum11 = 0;
Exterior2nd_dum12 = 0;
Exterior2nd_dum13 = 0;
MasVnrType_dum0 = 0;
MasVnrType_dum1 = 0;
MasVnrType_dum2 = 0;
ExterQual_dum0 = 0;
ExterQual_dum1 = 0;
ExterQual_dum2 = 0;
ExterCond_dum0 = 0;
ExterCond_dum1 = 0;
ExterCond_dum2 = 0;
Foundation_dum0 = 0;
Foundation_dum1 = 0;
Foundation_dum2 = 0;
Foundation_dum3 = 0;
Foundation_dum4 = 0;
BsmtQual_dum0 = 0;
BsmtQual_dum1 = 0;
BsmtQual_dum2 = 0;
BsmtQual_dum3 = 0;
BsmtCond_dum0 = 0;
BsmtCond_dum1 = 0;
BsmtCond_dum2 = 0;
BsmtExposure_dum0 = 0;
BsmtExposure_dum1 = 0;
BsmtExposure_dum2 = 0;
BsmtExposure_dum3 = 0;
BsmtFinType1_dum0 = 0;
BsmtFinType1_dum1 = 0;
BsmtFinType1_dum2 = 0;
BsmtFinType1_dum3 = 0;
BsmtFinType1_dum4 = 0;
BsmtFinType1_dum5 = 0;
BsmtFinType2_dum0 = 0;
BsmtFinType2_dum1 = 0;
BsmtFinType2_dum2 = 0;
BsmtFinType2_dum3 = 0;
BsmtFinType2_dum4 = 0;
Heating_dum0 = 0;
Heating_dum1 = 0;
Heating_dum2 = 0;
Heating_dum3 = 0;
Heating_dum4 = 0;
HeatingQC_dum0 = 0;
HeatingQC_dum1 = 0;
HeatingQC_dum2 = 0;
HeatingQC_dum3 = 0;
CentralAir_dum0 = 0;
Electrical_dum0 = 0;
Electrical_dum1 = 0;
Electrical_dum2 = 0;
Electrical_dum3 = 0;
KitchenQual_dum0 = 0;
KitchenQual_dum1 = 0;
KitchenQual_dum2 = 0;
Functional_dum0 = 0;
Functional_dum1 = 0;
Functional_dum2 = 0;
Functional_dum3 = 0;
Functional_dum4 = 0;
Functional_dum5 = 0;
FireplaceQu_dum0 = 0;
FireplaceQu_dum1 = 0;
FireplaceQu_dum2 = 0;
FireplaceQu_dum3 = 0;
FireplaceQu_dum4 = 0;
GarageType_dum0 = 0;
GarageType_dum1 = 0;
GarageType_dum2 = 0;
GarageType_dum3 = 0;
GarageType_dum4 = 0;
GarageFinish_dum0 = 0;
GarageFinish_dum1 = 0;
GarageQual_dum0 = 0;
GarageQual_dum1 = 0;
GarageQual_dum2 = 0;
GarageQual_dum3 = 0;
GarageCond_dum0 = 0;
GarageCond_dum1 = 0;
GarageCond_dum2 = 0;
GarageCond_dum3 = 0;
PavedDrive_dum0 = 0;
PavedDrive_dum1 = 0;
PoolQC_dum0 = 0;
PoolQC_dum1 = 0;
PoolQC_dum2 = 0;
Fence_dum0 = 0;
Fence_dum1 = 0;
Fence_dum2 = 0;
Fence_dum3 = 0;
MiscFeature_dum0 = 0;
MiscFeature_dum1 = 0;
MiscFeature_dum2 = 0;
MiscFeature_dum3 = 0;
SaleType_dum0 = 0;
SaleType_dum1 = 0;
SaleType_dum2 = 0;
SaleType_dum3 = 0;
SaleType_dum4 = 0;
if MSZoning = 'C' then MSZoning_dum0 = 1;
if MSZoning = 'FV' then MSZoning_dum1 = 1;
if MSZoning = 'RH' then MSZoning_dum2 = 1;
if MSZoning = 'RL' then MSZoning_dum3 = 1;
if Street = 'Grvl' then Street_dum0 = 1;
if Alley = 'Gr' then Alley_dum0 = 1;
if Alley = 'NA' then Alley_dum1 = 1;
if LotShape = 'IR1' then LotShape_dum0 = 1;
if LotShape = 'IR2' then LotShape_dum1 = 1;
if LotShape = 'IR3' then LotShape_dum2 = 1;
if LandContour = 'Bnk' then LandContour_dum0 = 1;
if LandContour = 'HLS' then LandContour_dum1 = 1;
if LandContour = 'Low' then LandContour_dum2 = 1;
if Utilities = 'AllPub' then Utilities_dum0 = 1;
if LotConfig = 'Corner' then LotConfig_dum0 = 1;
if LotConfig = 'CulDSac' then LotConfig_dum1 = 1;
if LotConfig = 'FR2' then LotConfig_dum2 = 1;
if LotConfig = 'FR3' then LotConfig_dum3 = 1;
if LandSlope = 'Gtl' then LandSlope_dum0 = 1;
if LandSlope = 'Mod' then LandSlope_dum1 = 1;
if Neighborhood = 'Blmngtn' then Neighborhood_dum0 = 1;
if Neighborhood = 'Blueste' then Neighborhood_dum1 = 1;
if Neighborhood = 'BrDale' then Neighborhood_dum2 = 1;
if Neighborhood = 'BrkSide' then Neighborhood_dum3 = 1;
if Neighborhood = 'ClearCr' then Neighborhood_dum4 = 1;
if Neighborhood = 'CollgCr' then Neighborhood_dum5 = 1;
if Neighborhood = 'Crawfor' then Neighborhood_dum6 = 1;
if Neighborhood = 'Edwards' then Neighborhood_dum7 = 1;
if Neighborhood = 'Gilbert' then Neighborhood_dum8 = 1;
if Neighborhood = 'IDOTRR' then Neighborhood_dum9 = 1;
if Neighborhood = 'MeadowV' then Neighborhood_dum10 = 1;
if Neighborhood = 'Mitchel' then Neighborhood_dum11 = 1;
if Neighborhood = 'NAmes' then Neighborhood_dum12 = 1;
if Neighborhood = 'NPkVill' then Neighborhood_dum13 = 1;
if Neighborhood = 'NWAmes' then Neighborhood_dum14 = 1;
if Neighborhood = 'NoRidge' then Neighborhood_dum15 = 1;
if Neighborhood = 'NridgHt' then Neighborhood_dum16 = 1;
if Neighborhood = 'OldTown' then Neighborhood_dum17 = 1;
if Neighborhood = 'SWISU' then Neighborhood_dum18 = 1;
if Neighborhood = 'Sawyer' then Neighborhood_dum19 = 1;
if Neighborhood = 'SawyerW' then Neighborhood_dum20 = 1;
if Neighborhood = 'Somerst' then Neighborhood_dum21 = 1;
if Neighborhood = 'StoneBr' then Neighborhood_dum22 = 1;
if Neighborhood = 'Timber' then Neighborhood_dum23 = 1;
if Condition1 = 'Artery' then Condition1_dum0 = 1;
if Condition1 = 'Feedr' then Condition1_dum1 = 1;
if Condition1 = 'Norm' then Condition1_dum2 = 1;
if Condition1 = 'PosA' then Condition1_dum3 = 1;
if Condition1 = 'PosN' then Condition1_dum4 = 1;
if Condition1 = 'RRAe' then Condition1_dum5 = 1;
if Condition1 = 'RRAn' then Condition1_dum6 = 1;
if Condition1 = 'RRNe' then Condition1_dum7 = 1;
if Condition2 = 'Artery' then Condition2_dum0 = 1;
if Condition2 = 'Feedr' then Condition2_dum1 = 1;
if Condition2 = 'Norm' then Condition2_dum2 = 1;
if Condition2 = 'PosA' then Condition2_dum3 = 1;
if Condition2 = 'PosN' then Condition2_dum4 = 1;
if Condition2 = 'RRAe' then Condition2_dum5 = 1;
if Condition2 = 'RRAn' then Condition2_dum6 = 1;
if BldgType = '1Fam' then BldgType_dum0 = 1;
if BldgType = '2fmCon' then BldgType_dum1 = 1;
if BldgType = 'Duplex' then BldgType_dum2 = 1;
if BldgType = 'Twnhs' then BldgType_dum3 = 1;
if HouseStyle = '1.5Fin' then HouseStyle_dum0 = 1;
if HouseStyle = '1.5Unf' then HouseStyle_dum1 = 1;
if HouseStyle = '1Story' then HouseStyle_dum2 = 1;
if HouseStyle = '2.5Fin' then HouseStyle_dum3 = 1;
if HouseStyle = '2.5Unf' then HouseStyle_dum4 = 1;
if HouseStyle = '2Story' then HouseStyle_dum5 = 1;
if HouseStyle = 'SFoyer' then HouseStyle_dum6 = 1;
if RoofStyle = 'Flat' then RoofStyle_dum0 = 1;
if RoofStyle = 'Gable' then RoofStyle_dum1 = 1;
if RoofStyle = 'Gambr' then RoofStyle_dum2 = 1;
if RoofStyle = 'Hip' then RoofStyle_dum3 = 1;
if RoofStyle = 'Mansard' then RoofStyle_dum4 = 1;
if RoofMatl = 'ClyTile' then RoofMatl_dum0 = 1;
if RoofMatl = 'CompShg' then RoofMatl_dum1 = 1;
if RoofMatl = 'Membran' then RoofMatl_dum2 = 1;
if RoofMatl = 'Metal' then RoofMatl_dum3 = 1;
if RoofMatl = 'Roll' then RoofMatl_dum4 = 1;
if RoofMatl = 'Tar&Grv' then RoofMatl_dum5 = 1;
if RoofMatl = 'WdShake' then RoofMatl_dum6 = 1;
if Exterior1st = 'AsbShng' then Exterior1st_dum0 = 1;
if Exterior1st = 'BrkComm' then Exterior1st_dum1 = 1;
if Exterior1st = 'BrkFace' then Exterior1st_dum2 = 1;
if Exterior1st = 'CBlock' then Exterior1st_dum3 = 1;
if Exterior1st = 'CemntBd' then Exterior1st_dum4 = 1;
if Exterior1st = 'HdBoard' then Exterior1st_dum5 = 1;
if Exterior1st = 'ImStucc' then Exterior1st_dum6 = 1;
if Exterior1st = 'MetalSd' then Exterior1st_dum7 = 1;
if Exterior1st = 'Plywood' then Exterior1st_dum8 = 1;
if Exterior1st = 'Stone' then Exterior1st_dum9 = 1;
if Exterior1st = 'Stucco' then Exterior1st_dum10 = 1;
if Exterior1st = 'VinylSd' then Exterior1st_dum11 = 1;
if Exterior1st = 'Wd Sdng' then Exterior1st_dum12 = 1;
if Exterior2nd = 'AsbShng' then Exterior2nd_dum0 = 1;
if Exterior2nd = 'AsphShn' then Exterior2nd_dum1 = 1;
if Exterior2nd = 'Brk Cmn' then Exterior2nd_dum2 = 1;
if Exterior2nd = 'BrkFace' then Exterior2nd_dum3 = 1;
if Exterior2nd = 'CmentBd' then Exterior2nd_dum5 = 1;
if Exterior2nd = 'HdBoard' then Exterior2nd_dum6 = 1;
if Exterior2nd = 'ImStucc' then Exterior2nd_dum7 = 1;
if Exterior2nd = 'MetalSd' then Exterior2nd_dum8 = 1;
if Exterior2nd = 'Other' then Exterior2nd_dum9 = 1;
if Exterior2nd = 'Plywood' then Exterior2nd_dum10 = 1;
if Exterior2nd = 'Stone' then Exterior2nd_dum11 = 1;
if Exterior2nd = 'Stucco' then Exterior2nd_dum12 = 1;
if Exterior2nd = 'VinylSd' then Exterior2nd_dum13 = 1;
if Exterior2nd = 'Wd Sdng' then Exterior2nd_dum4 = 1;
if MasVnrType = 'BrkCmn' then MasVnrType_dum0 = 1;
if MasVnrType = 'BrkFace' then MasVnrType_dum1 = 1;
if MasVnrType = 'None' then MasVnrType_dum2 = 1;
if ExterQual = 'Ex' then ExterQual_dum0 = 1;
if ExterQual = 'Fa' then ExterQual_dum1 = 1;
if ExterQual = 'Gd' then ExterQual_dum2 = 1;
if ExterCond = 'Ex' then ExterCond_dum0 = 1;
if ExterCond = 'Fa' then ExterCond_dum1 = 1;
if ExterCond = 'Gd' then ExterCond_dum2 = 1;
if Foundation = 'BrkTil' then Foundation_dum0 = 1;
if Foundation = 'CBlock' then Foundation_dum1 = 1;
if Foundation = 'PConc' then Foundation_dum2 = 1;
if Foundation = 'Slab' then Foundation_dum3 = 1;
if Foundation = 'Stone' then Foundation_dum4 = 1;
if BsmtQual = 'Ex' then BsmtQual_dum0 = 1;
if BsmtQual = 'Fa' then BsmtQual_dum1 = 1;
if BsmtQual = 'Gd' then BsmtQual_dum2 = 1;
if BsmtQual = 'NA' then BsmtQual_dum3 = 1;
if BsmtCond = 'Fa' then BsmtCond_dum0 = 1;
if BsmtCond = 'Gd' then BsmtCond_dum1 = 1;
if BsmtCond = 'Po' then BsmtCond_dum2 = 1;
if BsmtExposure = 'Av' then BsmtExposure_dum0 = 1;
if BsmtExposure = 'Gd' then BsmtExposure_dum1 = 1;
if BsmtExposure = 'Mn' then BsmtExposure_dum2 = 1;
if BsmtExposure = 'NA' then BsmtExposure_dum3 = 1;
if BsmtFinType1 = 'ALQ' then BsmtFinType1_dum0 = 1;
if BsmtFinType1 = 'BLQ' then BsmtFinType1_dum1 = 1;
if BsmtFinType1 = 'GLQ' then BsmtFinType1_dum2 = 1;
if BsmtFinType1 = 'LwQ' then BsmtFinType1_dum3 = 1;
if BsmtFinType1 = 'Rec' then BsmtFinType1_dum4 = 1;
if BsmtFinType1 = 'NA' then BsmtFinType1_dum5 = 1;
if BsmtFinType2 = 'ALQ' then BsmtFinType2_dum0 = 1;
if BsmtFinType2 = 'BLQ' then BsmtFinType2_dum1 = 1;
if BsmtFinType2 = 'GLQ' then BsmtFinType2_dum2 = 1;
if BsmtFinType2 = 'LwQ' then BsmtFinType2_dum3 = 1;
if BsmtFinType2 = 'Rec' then BsmtFinType2_dum4 = 1;
if Heating = 'Floor' then Heating_dum0 = 1;
if Heating = 'GasA' then Heating_dum1 = 1;
if Heating = 'GasW' then Heating_dum2 = 1;
if Heating = 'Grav' then Heating_dum3 = 1;
if Heating = 'OthW' then Heating_dum4 = 1;
if HeatingQC = 'Ex' then HeatingQC_dum0 = 1;
if HeatingQC = 'Fa' then HeatingQC_dum1 = 1;
if HeatingQC = 'Gd' then HeatingQC_dum2 = 1;
if HeatingQC = 'Po' then HeatingQC_dum3 = 1;
if CentralAir = 'N' then CentralAir_dum0 = 1;
if Electrical = 'FuseA' then Electrical_dum0 = 1;
if Electrical = 'FuseF' then Electrical_dum1 = 1;
if Electrical = 'FuseP' then Electrical_dum2 = 1;
if Electrical = 'NA' then Electrical_dum3 = 1;
if KitchenQual = 'Ex' then KitchenQual_dum0 = 1;
if KitchenQual = 'Fa' then KitchenQual_dum1 = 1;
if KitchenQual = 'Gd' then KitchenQual_dum2 = 1;
if Functional = 'Maj1' then Functional_dum0 = 1;
if Functional = 'Maj2' then Functional_dum1 = 1;
if Functional = 'Min1' then Functional_dum2 = 1;
if Functional = 'Min2' then Functional_dum3 = 1;
if Functional = 'Mod' then Functional_dum4 = 1;
if Functional = 'Sev' then Functional_dum5 = 1;
if FireplaceQu = 'Ex' then FireplaceQu_dum0 = 1;
if FireplaceQu = 'Fa' then FireplaceQu_dum1 = 1;
if FireplaceQu = 'Gd' then FireplaceQu_dum2 = 1;
if FireplaceQu = 'NA' then FireplaceQu_dum3 = 1;
if FireplaceQu = 'Po' then FireplaceQu_dum4 = 1;
if GarageType = '2Types' then GarageType_dum0 = 1;
if GarageType = 'Attchd' then GarageType_dum1 = 1;
if GarageType = 'Basment' then GarageType_dum2 = 1;
if GarageType = 'BuiltIn' then GarageType_dum3 = 1;
if GarageType = 'CarPort' then GarageType_dum4 = 1;
if GarageFinish = 'Fin' then GarageFinish_dum0 = 1;
if GarageFinish = 'RFn' then GarageFinish_dum1 = 1;
if GarageQual = 'Ex' then GarageQual_dum0 = 1;
if GarageQual = 'Fa' then GarageQual_dum1 = 1;
if GarageQual = 'Gd' then GarageQual_dum2 = 1;
if GarageQual = 'Po' then GarageQual_dum3 = 1;
if GarageCond = 'Ex' then GarageCond_dum0 = 1;
if GarageCond = 'Fa' then GarageCond_dum1 = 1;
if GarageCond = 'Gd' then GarageCond_dum2 = 1;
if GarageCond = 'Po' then GarageCond_dum3 = 1;
if PavedDrive = 'N' then PavedDrive_dum0 = 1;
if PavedDrive = 'P' then PavedDrive_dum1 = 1;
if PoolQC = 'Ex' then PoolQC_dum0 = 1;
if PoolQC = 'Fa' then PoolQC_dum1 = 1;
if PoolQC = 'Gd' then PoolQC_dum2 = 1;
if Fence = 'GdPrv' then Fence_dum0 = 1;
if Fence = 'GdWo' then Fence_dum1 = 1;
if Fence = 'MnPrv' then Fence_dum2 = 1;
if Fence = 'MnWw' then Fence_dum3 = 1;
if MiscFeature = 'Gar2' then MiscFeature_dum0 = 1;
if MiscFeature = 'NA' then MiscFeature_dum1 = 1;
if MiscFeature = 'Othr' then MiscFeature_dum2 = 1;
if MiscFeature = 'Shed' then MiscFeature_dum3 = 1;
if SaleType = 'COD' then SaleType_dum0 = 1;
if SaleType = 'CWD' then SaleType_dum1 = 1;
if SaleType = 'Con' then SaleType_dum2 = 1;
if SaleType = 'New' then SaleType_dum3 = 1;
if SaleType = 'Oth' then SaleType_dum4 = 1;
run;



*GLM model to generate r-squared;
*This is the plot after the log transforms were completed and erroneous variables were removed;
*results and justifications for all adjustments are documented in the paper;
Proc glm data = train_dummy;
class 
Alley
BldgType
BsmtCond
BsmtExposure
BsmtFinType1
BsmtQual
CentralAir
Electrical
ExterCond
ExterQual
Exterior1st
Exterior2nd
Fence
FireplaceQu
Foundation
GarageCond
GarageFinish
GarageQual
GarageType
HeatingQC
KitchenQual
LotConfig
LotShape
MSSubClass
MSZoning
MasVnrType
Neighborhood
PavedDrive
PoolQC
RoofMatl
RoofStyle
SaleCondition
SaleType;
model SalePrice = 
CubeBsmtFinSF1
Cube2ndFlrSF
CubeYearRemodAdd
CubeLotFrontage
LogOpenPorchSF
LogGarageArea
LogLotArea
LogKitchenAbvGr
LogYearBuilt
LogBsmtFullBath
LogHalfBath
SqrtFullBath
SqrtEnclosedPorch
SqrtTotRmsAbvGrd
SqrtFireplaces
SqrtBsmtUnfSF
SqrtWoodDeckSF
SqrtBedroomAbvGr
Sqrt1stFlrSF
SqrGarageYrBlt
SqrMasVnrArea;
Run;

/*


*Forward Selection method using variables obtained through the proc reg cleanup;
*(stop=CV) cvmethod=random(5) used to get CVPress Score per the Unit Learning presentations;
Proc glmselect data=train_dummy;
class MSZoning
Street
Alley
LotShape
LandContour
Utilities
LotConfig
LandSlope
Neighborhood
Condition1
Condition2
BldgType
HouseStyle
RoofStyle
RoofMatl
Exterior1st
Exterior2nd
MasVnrType
ExterQual
ExterCond
Foundation
BsmtQual
BsmtCond
BsmtExposure
BsmtFinType1
BsmtFinType2
Heating
HeatingQC
CentralAir
Electrical
KitchenQual
Functional
FireplaceQu
GarageType
GarageFinish
GarageQual
GarageCond
PavedDrive
PoolQC
Fence
MiscFeature
SaleType
SaleCondition;
model SalePrice = 
CubeBsmtFinSF1
Cube2ndFlrSF
CubeYearRemodAdd
CubeLotFrontage
LogOpenPorchSF
LogGarageArea
LogLotArea
LogKitchenAbvGr
LogYearBuilt
LogBsmtFullBath
LogHalfBath
SqrtFullBath
SqrtEnclosedPorch
SqrtTotRmsAbvGrd
SqrtFireplaces
SqrtBsmtUnfSF
SqrtWoodDeckSF
SqrtBedroomAbvGr
Sqrt1stFlrSF
SqrGarageYrBlt
SqrMasVnrArea
/selection=Forward(stop=CV) cvmethod=random(5) stats =adjrsq;
Run;


*Backward Selection method using variables obtained through the proc reg cleanup;
*(stop=CV) cvmethod=random(5) used to get CVPress Score per the Unit Learning presentations;
Proc glmselect data=train_dummy;
class MSZoning
Street
Alley
LotShape
LandContour
Utilities
LotConfig
LandSlope
Neighborhood
Condition1
Condition2
BldgType
HouseStyle
RoofStyle
RoofMatl
Exterior1st
Exterior2nd
MasVnrType
ExterQual
ExterCond
Foundation
BsmtQual
BsmtCond
BsmtExposure
BsmtFinType1
BsmtFinType2
Heating
HeatingQC
CentralAir
Electrical
KitchenQual
Functional
FireplaceQu
GarageType
GarageFinish
GarageQual
GarageCond
PavedDrive
PoolQC
Fence
MiscFeature
SaleType
SaleCondition;
model SalePrice = 
CubeBsmtFinSF1
Cube2ndFlrSF
CubeYearRemodAdd
CubeLotFrontage
LogOpenPorchSF
LogGarageArea
LogLotArea
LogKitchenAbvGr
LogYearBuilt
LogBsmtFullBath
LogHalfBath
SqrtFullBath
SqrtEnclosedPorch
SqrtTotRmsAbvGrd
SqrtFireplaces
SqrtBsmtUnfSF
SqrtWoodDeckSF
SqrtBedroomAbvGr
Sqrt1stFlrSF
SqrGarageYrBlt
SqrMasVnrArea
/selection=Backward(stop=CV) cvmethod=random(5) stats =adjrsq;
Run;

*Stepwise Selection method using variables obtained through the proc reg cleanup;
*(stop=CV) cvmethod=random(5) used to get CVPress Score per the Unit Learning presentations;
Proc glmselect data=train_dummy;
class MSZoning
Street
Alley
LotShape
LandContour
Utilities
LotConfig
LandSlope
Neighborhood
Condition1
Condition2
BldgType
HouseStyle
RoofStyle
RoofMatl
Exterior1st
Exterior2nd
MasVnrType
ExterQual
ExterCond
Foundation
BsmtQual
BsmtCond
BsmtExposure
BsmtFinType1
BsmtFinType2
Heating
HeatingQC
CentralAir
Electrical
KitchenQual
Functional
FireplaceQu
GarageType
GarageFinish
GarageQual
GarageCond
PavedDrive
PoolQC
Fence
MiscFeature
SaleType
SaleCondition;
model SalePrice = 
CubeBsmtFinSF1
Cube2ndFlrSF
CubeYearRemodAdd
CubeLotFrontage
LogOpenPorchSF
LogGarageArea
LogLotArea
LogKitchenAbvGr
LogYearBuilt
LogBsmtFullBath
LogHalfBath
SqrtFullBath
SqrtEnclosedPorch
SqrtTotRmsAbvGrd
SqrtFireplaces
SqrtBsmtUnfSF
SqrtWoodDeckSF
SqrtBedroomAbvGr
Sqrt1stFlrSF
SqrGarageYrBlt
SqrMasVnrArea
/selection=Stepwise(stop=CV) cvmethod=random(5) stats =adjrsq;
Run;


