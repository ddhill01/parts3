# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_08_152327) do
  create_table "Align_Check", primary_key: "AlignmentCheckID", id: :integer, force: :cascade do |t|
    t.integer "AssetMotorID"
    t.datetime "AlignmentCheckDate", precision: nil
    t.integer "CheckedBy"
    t.integer "AsFoundVertAng"
    t.integer "AsFoundHorizAng"
    t.integer "AsFoundVertOffset"
    t.integer "AsFoundHorizOffset"
    t.boolean "IsRepairRequired", null: false
  end

  create_table "Align_Repair", primary_key: "AlignRepairID", id: :integer, force: :cascade do |t|
    t.integer "AlignCheckID"
    t.datetime "AlignmentDate", precision: nil
    t.integer "AlignedBy"
    t.integer "AsLeftVertAng"
    t.integer "AsLeftHorizAng"
    t.integer "AsLeftVertOffset"
    t.integer "AsLeftHorizOffset"
    t.varchar_max "RepairComments"
  end

  create_table "Alignment_Inspection", primary_key: "AlignmentInspectionID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "RouteInspectionID"
    t.integer "AssetMotorID"
    t.integer "AssetCouplingID"
    t.datetime "AlignmentDate", precision: nil
    t.integer "CheckedBy"
    t.integer "AsFoundVertAng"
    t.integer "AsFoundHorizAng"
    t.integer "AsFoundVertOffset"
    t.integer "AsFoundHorizOffset"
    t.integer "AsLeftVertAng"
    t.integer "AsLeftHorizAng"
    t.integer "AsLeftVertOffset"
    t.integer "AsLeftHorizOffset"
    t.varchar_max "AlignmentNotes"
  end

  create_table "Asset", primary_key: "AssetID", id: :integer, force: :cascade do |t|
    t.integer "SiteRoomID"
    t.integer "AssetCategoryID"
    t.integer "AssetStatusID", default: 1
    t.integer "MaximoAssetID"
    t.integer "InspectionFrequencyID", default: 2
    t.string "AssetCommonName", limit: 255
    t.string "Description", limit: 255
    t.integer "AssetRouteSequence"
    t.integer "AssetNoteGroupID"
    t.integer "AssetNoteSectionID"
    t.boolean "IsVibrationAnalyzed", default: false, null: false
    t.boolean "IsAlignmentInspected", default: false, null: false
    t.boolean "IsThermographyInspected", default: false, null: false
    t.boolean "IsMAInspected", default: false, null: false
    t.boolean "IsUSInspected", default: false, null: false
    t.boolean "IsUAVInspected", default: false, null: false
    t.boolean "IsROVInspected", default: false, null: false
    t.integer "PdMCriticality", default: 3
    t.integer "MaximumMaximoCriticality"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
  end

  create_table "Asset_Arc_Flash", primary_key: ["AssetArcFlashID", "AssetID"], force: :cascade do |t|
    t.integer "AssetArcFlashID", null: false
    t.integer "AssetID", null: false
    t.integer "ArcFlashRating"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
  end

  create_table "Asset_Backup", primary_key: "AssetID", id: :integer, force: :cascade do |t|
    t.integer "SiteRoomID"
    t.integer "AssetCategoryID"
    t.integer "AssetStatusID"
    t.integer "MaximoAssetID"
    t.integer "InspectionFrequencyID"
    t.string "AssetCommonName", limit: 255
    t.string "Description", limit: 255
    t.integer "AssetRouteSequence"
    t.integer "AssetNoteGroupID"
    t.integer "AssetNoteSectionID"
    t.boolean "IsVibrationAnalyzed", null: false
    t.boolean "IsAlignmentInspected", null: false
    t.boolean "IsThermographyInspected", null: false
    t.boolean "IsMAInspected", null: false
    t.boolean "IsUSInspected", null: false
    t.boolean "IsUAVInspected", null: false
    t.boolean "IsROVInspected", null: false
    t.integer "PdMCriticality"
    t.datetime "ModifiedDate", precision: nil
  end

  create_table "Asset_Belt", primary_key: "AssetBeltID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "DriveSheaveDiameter"
    t.integer "DrivenSheaveDiameter"
    t.integer "C2CDistance"
    t.integer "BeltLength"
    t.char "BeltType", limit: 10
    t.integer "BeltCount"
  end

  create_table "Asset_Bucket", primary_key: "AssetBucketID", id: :integer, force: :cascade do |t|
    t.integer "LocalAssetBucketID"
    t.integer "AssetID"
    t.integer "AssetStatusID", default: 1
    t.string "BucketColumnRow", limit: 5
    t.string "BucketTextDescription", limit: 100
    t.float "BucketRouteSequence"
    t.integer "IRAssetID"
    t.integer "MaximoAssetID"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
  end

  create_table "Asset_Bucket_Backup", primary_key: "AssetBucketID", id: :integer, force: :cascade do |t|
    t.integer "LocalAssetBucketID"
    t.integer "AssetID"
    t.integer "AssetStatusID"
    t.string "BucketColumnRow", limit: 5
    t.string "BucketTextDescription", limit: 100
    t.float "BucketRouteSequence"
    t.integer "IRAssetID"
    t.integer "MaximoAssetID"
    t.datetime "ModifiedDate", precision: nil
  end

  create_table "Asset_Bucket_Default_Collection", primary_key: "AssetBucketDefaultCollectionID", id: :integer, force: :cascade do |t|
    t.integer "AssetBucketID"
    t.integer "RouteCollectionStatusID"
    t.integer "ReasonNotCheckedID"
    t.string "Description", limit: 100
  end

  create_table "Asset_Category", primary_key: "AssetCategoryID", id: :integer, force: :cascade do |t|
    t.string "EquipmentType", limit: 50
    t.integer "AssetDesignationID"
    t.boolean "IsThermographyInspected", default: false, null: false
    t.boolean "IsUAVInspected", default: false, null: false
    t.boolean "IsMAInspected", default: false, null: false
    t.boolean "IsVibrationAnalyzed", default: false, null: false
    t.boolean "IsUltrasoundInspected", default: false, null: false
    t.boolean "IsMotorTestingDone", default: false, null: false
    t.boolean "IsROVInspected", default: false, null: false
    t.boolean "IsAlignmentInspected", default: false, null: false
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
  end

  create_table "Asset_Coupling", primary_key: "CouplingID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "CouplingTypeID"
    t.string "CouplingWrenchSize", limit: 6
  end

  create_table "Asset_Default_Collection", primary_key: "AssetDefaultCollectionID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "TechnologyID"
    t.integer "RouteCollectionStatusID"
    t.integer "ReasonNotCheckedID"
    t.string "Description", limit: 100
  end

  create_table "Asset_Designation", primary_key: "AssetDesignationID", id: :integer, force: :cascade do |t|
    t.string "EquipmentDesignation", limit: 20
  end

  create_table "Asset_Driven", primary_key: "AssetDrivenID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "AssetStatusID"
    t.integer "AssetRotatingTypeID"
    t.integer "ManufactID"
    t.integer "MaximoAssetID"
    t.string "DrivenDescription", limit: 255
    t.string "SerialNumber", limit: 255
    t.string "ModelNumber", limit: 255
    t.string "Size", limit: 25
    t.integer "MaxRPM"
    t.string "MaxFlowrate", limit: 25
    t.string "TDH", limit: 25
    t.integer "ImpellerDiameter"
    t.integer "VaneBladeCount"
    t.string "DetailText", limit: 255
    t.integer "SealTypeID"
    t.string "EndBearingLubeType", limit: 20
    t.string "ShaftBearingLubeType", limit: 20
    t.string "EndLubeQty", limit: 10
    t.string "ShaftLubeQty", limit: 10
    t.string "ShaftBearing", limit: 25
    t.integer "ShaftBearingID"
    t.string "EndBearing", limit: 25
    t.integer "EndBearingID"
    t.integer "AssetOrientationID"
    t.text "DrivenNotes"
    t.nchar "RotationDirection", limit: 20
    t.string "Material", limit: 50
    t.string "Date", limit: 20
    t.string "UnitNumber", limit: 35
    t.integer "PumpCurveRatedFlow"
    t.integer "PumpCurveRatedHead"
    t.integer "PumpCurvePercentEff"
    t.integer "InstalledDrawdownTestFlow"
    t.integer "InstalledTDH"
    t.integer "InstalledPercentEff"
  end

  create_table "Asset_Gearbox", primary_key: "AssetGearboxID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "AssetStatusID"
    t.string "GearboxCommonName", limit: 255
    t.integer "ManufactID"
    t.string "SerialNumber", limit: 255
    t.integer "NumberOfStages"
    t.string "GearType", limit: 25
    t.string "FinalRatio", limit: 25
    t.string "PrimaryGearMeshFreq", limit: 25
    t.string "SecondaryGearMeshFreq", limit: 25
    t.string "LubricantType", limit: 25
    t.string "LubricantQuantity", limit: 25
    t.string "MaxTorqueRating", limit: 25
    t.nchar "MaxAmbientTemp", limit: 10
    t.text "GearboxNotes"
    t.integer "MaximoAssetID"
  end

  create_table "Asset_Geolocation", primary_key: "AssetGeolocationID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.text "AssetLocationImageLink"
  end

  create_table "Asset_Location", primary_key: "AssetLocationID", id: :integer, force: :cascade do |t|
    t.string "AssetCommonLocation", limit: 50
  end

  create_table "Asset_Lubrication_Type", primary_key: "AssetLubricationTypeID", id: :integer, force: :cascade do |t|
    t.nchar "LubeType", limit: 10
  end

  create_table "Asset_Motor", primary_key: "AssetMotorID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "AssetStatusID", default: 1
    t.string "MotorDescription", limit: 255
    t.integer "MaximoAssetID"
    t.integer "MotorTypeID"
    t.boolean "IsVFDPresent", default: false, null: false
    t.boolean "IsSoftStartPresent", default: false, null: false
    t.integer "MotorVoltageID"
    t.integer "RatedRPM"
    t.integer "Horsepower"
    t.string "EndBearing", limit: 15
    t.integer "EndBearingID"
    t.string "ShaftBearing", limit: 15
    t.integer "ShaftBearingID"
    t.integer "MotorFrameID"
    t.integer "MotorEnclosureID"
    t.integer "Amps"
    t.integer "MotorServiceFactorID"
    t.integer "MotorPowerFactorID"
    t.integer "MotorInsulationClassID"
    t.integer "MotorDutyID"
    t.integer "MotorPhaseID"
    t.integer "Weight"
    t.integer "ManufacturerID"
    t.string "SerialNum", limit: 100
    t.string "CatNum", limit: 100
    t.integer "CoolingFanBladeCount"
    t.integer "MotorPoleCount"
    t.integer "RotorBarCount"
    t.integer "StatorSlotCount"
    t.string "EndBearingLubeType", limit: 10
    t.string "ShaftBearingLubeType", limit: 10
    t.string "EndLubeQty", limit: 10
    t.string "ShaftLubeQty", limit: 10
    t.integer "NEMAnomEff"
    t.integer "SFAmps"
    t.string "Code", limit: 1
    t.string "TagType", limit: 10
    t.integer "Balance"
    t.integer "InverterDutyTorque"
    t.string "InverterHzRange", limit: 25
    t.string "InverterRPMRange", limit: 25
    t.string "KVACode", limit: 25
    t.string "NEMAminEff", limit: 25
    t.string "FormFactor", limit: 25
    t.integer "MaxAllowPeakAmps"
    t.integer "MaxCorrKVAR"
    t.string "CC", limit: 25
    t.string "TempRise", limit: 25
    t.integer "TempAtLoad"
    t.text "OMManualLink"
    t.integer "FileID"
    t.text "MotorNotes"
    t.integer "AssetOrientationID"
    t.string "AmbientTemp", limit: 3
    t.string "MaxSafeSpeed", limit: 5
  end

  create_table "Asset_Motor_Foot", primary_key: "AssetMotorFootID", id: :integer, force: :cascade do |t|
    t.integer "AssetMotorID"
    t.string "FootDescription", limit: 25
    t.integer "AngularUpperRight"
    t.integer "AngularUpperLeft"
    t.integer "AngularLowerRight"
    t.integer "AngularLowerLeft"
    t.integer "SoftFootAmountMils"
    t.string "FootBoltWrenchSize", limit: 15
    t.string "ShimType", limit: 2
    t.text "FootComments"
    t.boolean "IsFootBoltBound", default: false, null: false
    t.boolean "IsFootBaseBound", default: false, null: false
    t.boolean "DoesSoftFootExist", default: false, null: false
    t.boolean "IsSoftFootAngular", default: false, null: false
  end

  create_table "Asset_Note_Group", primary_key: "AssetNoteGroupID", id: :integer, force: :cascade do |t|
    t.string "GroupDescription", limit: 100
    t.text "GroupNoteText"
  end

  create_table "Asset_Note_Individual", primary_key: "AssetNoteIndividualID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.text "AssetFacts"
    t.text "AssetOpinions"
    t.text "AssetNotes"
  end

  create_table "Asset_Note_Section", primary_key: "AssetNoteSectionID", id: :integer, force: :cascade do |t|
    t.string "SectionDescription", limit: 100
    t.text "SectionNoteText"
  end

  create_table "Asset_Orientation", primary_key: "AssetOrientationID", id: :integer, force: :cascade do |t|
    t.string "AssetOrientation", limit: 10
  end

  create_table "Asset_Repair", primary_key: "AssetRepairID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.boolean "AssetRepaired", default: false, null: false
    t.text "AssetRepairNotes"
    t.string "AssetRepairDate", limit: 11
    t.integer "MaximoWorkOrderID"
  end

  create_table "Asset_Repair_FollowUp", primary_key: "AssetRepairFollowUpID", id: :integer, force: :cascade do |t|
    t.integer "ReportID"
    t.integer "WorkOrderID"
    t.datetime "FollowUpRequestDate", precision: nil
    t.boolean "FollowupRequiredYN", default: false, null: false
    t.datetime "FollowUpByDate", precision: nil
    t.boolean "FollowupCompleteYN", default: false, null: false
    t.text "FollowupNote"
    t.datetime "FollowupCompleteDate", precision: nil
    t.string "FollowUpOutcome", limit: 75
  end

  create_table "Asset_Status", primary_key: "AssetStatusID", id: :integer, force: :cascade do |t|
    t.string "AssetStatus", limit: 15
  end

  create_table "Asset_Structure", primary_key: "AssetStructureID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.string "Description", limit: 200
    t.text "Comments"
    t.text "StructureLocationLink"
    t.boolean "RoofPresentYN", default: false, null: false
    t.boolean "GuttersPresentYN", default: false, null: false
    t.boolean "LightningProtectionPresentYN", default: false, null: false
    t.boolean "PipeBootsPresentYN", default: false, null: false
    t.boolean "LouveredVentsPresentYN", default: false, null: false
    t.nchar "Exterior", limit: 10
  end

  create_table "Asset_Tank", primary_key: "AssetTankID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.string "TankCapacity", limit: 20
    t.string "TankDimensions", limit: 20
    t.string "TankBuildDate", limit: 8
    t.string "TankManuf", limit: 20
    t.boolean "RoofCoatingPresent", default: false, null: false
    t.boolean "RailingsPresent", default: false, null: false
    t.boolean "VandalGuardPresent", default: false, null: false
    t.boolean "WallCoatingPresent", default: false, null: false
    t.boolean "ExteriorLadderPresent", default: false, null: false
    t.boolean "LadderSafetyCagePresent", default: false, null: false
    t.boolean "WallFloorJointPresent", default: false, null: false
    t.boolean "PerimeterFootingsPresent", default: false, null: false
    t.boolean "LightningProtectionPresent", default: false, null: false
    t.boolean "RoofSafetyTieOffsPresent", default: false, null: false
    t.integer "SecurityDetailRank"
    t.boolean "ConduitPresent", default: false, null: false
    t.boolean "PerimeterVentsPresent", default: false, null: false
    t.boolean "TopVentsPresent", default: false, null: false
    t.boolean "TopAccessHatchPresent", default: false, null: false
    t.integer "TopTankAccessHatchTypeID"
    t.boolean "SideHatchPresent", default: false, null: false
    t.integer "SideTankAccessHatchTypeID"
    t.integer "SideTankAccessHatchCount"
    t.boolean "RoofPresent", default: false, null: false
    t.boolean "RoofWallJointPresent", default: false, null: false
    t.integer "PerimeterVentCount"
    t.boolean "RainIncursionIsViolation", default: false, null: false
    t.integer "TankUseTypeID"
    t.integer "TankConstructionTypeID"
    t.text "TankLocationLink"
    t.integer "OldTankID"
    t.boolean "OverFlowVisible", default: false, null: false
  end

  create_table "Asset_Tank_Link", primary_key: "AssetTankLinkID", id: :integer, force: :cascade do |t|
    t.integer "AssetTankID"
    t.text "InspectionReportFolder"
    t.text "MostRecentReportLink"
    t.text "TankLocationLink"
  end

  create_table "Asset_Type_Electrical", primary_key: "AssetTypeElectricalID", id: :integer, force: :cascade do |t|
    t.integer "AssetCategoryID"
    t.integer "AssetDesignationID"
  end

  create_table "Asset_Type_Rotating", primary_key: "AssetTypeRotatingID", id: :integer, force: :cascade do |t|
    t.string "AssetRotatingType", limit: 25
    t.integer "AssetCategoryID"
    t.integer "AssetDesignationID"
    t.integer "Sequence"
  end

  create_table "Bearing", primary_key: "BearingID", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 25, null: false
    t.string "Manufacturer", limit: 50, null: false
    t.float "BPFO", null: false
    t.float "BPFI", null: false
    t.float "BSF", null: false
    t.float "FTF", null: false
  end

  create_table "Building_Component", primary_key: "BuildingComponentID", id: :integer, force: :cascade do |t|
    t.string "Component", limit: 255
    t.string "ComponentDescription", limit: 255
    t.text "ComponentExample"
  end

  create_table "Coupling_Type", primary_key: "CouplingTypeID", id: :integer, force: :cascade do |t|
    t.string "CouplingType", limit: 100
  end

  create_table "Cycle_Month", primary_key: "CycleMonthID", id: :integer, force: :cascade do |t|
    t.string "CycleMonth", limit: 3
    t.string "CycleLongMonth", limit: 10
    t.nchar "CycleMonthNumber", limit: 2
  end

  create_table "Cycle_Quarter", primary_key: "CycleQuarterID", id: :integer, force: :cascade do |t|
    t.string "Quarter", limit: 3
    t.string "QuarterDescription", limit: 12
  end

  create_table "Cycle_Year", primary_key: "CycleYearID", id: :integer, force: :cascade do |t|
    t.string "CycleYear", limit: 12
    t.nchar "CycleShortYear", limit: 2
  end

  create_table "DB_Config", primary_key: "DBConfigID", id: :integer, force: :cascade do |t|
    t.string "SettingName", limit: 50
    t.text "SettingDescription"
    t.string "Value", limit: 255
  end

  create_table "DB_Install_Status", id: false, force: :cascade do |t|
    t.boolean "Installed", null: false
  end

  create_table "DB_User", primary_key: "DBUserID", id: :integer, force: :cascade do |t|
    t.string "UserName", limit: 50
    t.string "UserLogin", limit: 50
    t.integer "UserType"
    t.string "UserPassword", limit: 25
    t.boolean "UserActiveYN", default: true
    t.boolean "AllTechnologiesYN", default: false
    t.boolean "IROnlyYN", default: false
  end

  create_table "DB_User_Log", primary_key: "DBUserLogID", id: :integer, force: :cascade do |t|
    t.string "Event", limit: 80
    t.string "EVTime", limit: 25
    t.string "EvUser", limit: 50
    t.string "EvComputerName", limit: 125
  end

  create_table "DB_Version_BE_Master", primary_key: "fe_version_number", id: :float, force: :cascade do |t|
  end

  create_table "DB_Version_BE_Master_Routes", primary_key: "fe_version_number", id: :float, force: :cascade do |t|
  end

  create_table "DB_Version_Master_Location", primary_key: "DBVersionMasterLocationID", id: :integer, force: :cascade do |t|
    t.text "s_masterlocation"
  end

  create_table "Email", primary_key: "EmailBodyID", id: :integer, force: :cascade do |t|
    t.string "EmailSubject", limit: 50
    t.text "EmailBody"
  end

  create_table "Email_Address", primary_key: "EmailAddressID", id: :integer, force: :cascade do |t|
    t.string "RecipientName", limit: 255
    t.string "Title", limit: 255
    t.string "RecipientEmail", limit: 255
    t.boolean "IsSentToYN", default: false, null: false
    t.boolean "IsSentCCYN", default: false, null: false
    t.boolean "LFP", default: false, null: false
    t.boolean "SCFP", default: false, null: false
    t.boolean "BS", default: false, null: false
    t.boolean "PS", default: false, null: false
    t.boolean "FWH", default: false, null: false
    t.boolean "YR", default: false, null: false
    t.boolean "CC", default: false, null: false
    t.boolean "Vibration", default: false, null: false
    t.boolean "Thermography", default: false, null: false
    t.boolean "UAV", default: false, null: false
    t.boolean "Alignment", default: false, null: false
    t.boolean "Motion", default: false, null: false
    t.boolean "SendFromSupervisor", default: false, null: false
    t.boolean "SendFromPdM", default: false, null: false
    t.integer "dbUserID"
  end

  create_table "Email_Text", primary_key: "EmailTextID", id: :integer, force: :cascade do |t|
    t.integer "TechnologyID"
    t.integer "ReportTypeID"
    t.text "EmailText"
    t.boolean "IsTextHTML", default: false, null: false
    t.text "Description"
  end

  create_table "Email_Type", primary_key: "EmailTypeID", id: :integer, force: :cascade do |t|
    t.string "EmailToField", limit: 50
  end

  create_table "Error_Log", primary_key: "ErrorLogID", id: :integer, force: :cascade do |t|
    t.integer "LocalErrorLogID"
    t.decimal "ErrNumber", precision: 18
    t.string "ErrDescription", limit: 255
    t.datetime "ErrDate", precision: nil
    t.string "CallingMod", limit: 255
    t.string "CallingProc", limit: 255
    t.integer "DBUserID"
    t.string "ComputerName", limit: 75
    t.string "Application", limit: 10
    t.string "Technology", limit: 50
    t.string "Process", limit: 50
    t.string "LastAssetNumber", limit: 50
    t.string "LastAnalysisNumber", limit: 50
  end

  create_table "File", primary_key: "FileID", id: :integer, force: :cascade do |t|
    t.integer "ForeignKeyID"
    t.integer "TableNameID"
    t.string "FileName", limit: 255
    t.text "FileHyperlink"
    t.text "FileClickLInk"
    t.text "FileDescription"
    t.datetime "FileDate", precision: nil
    t.integer "FileTypeID"
    t.string "FileThumbnailLink", limit: 255
    t.integer "FileImportMethodID"
    t.integer "AssetID"
    t.boolean "IsAssetAttachment", default: false, null: false
  end

  create_table "File_Filter", primary_key: "FileFilterID", id: :integer, force: :cascade do |t|
    t.string "FileFilterText", limit: 25
    t.string "FileFilterExt", limit: 50
    t.integer "TechnologyID"
  end

  create_table "File_Import_Method", primary_key: "FileImportMethodID", id: :integer, force: :cascade do |t|
    t.string "FileImportType", limit: 20
  end

  create_table "File_Type", primary_key: "FileTypeID", id: :integer, force: :cascade do |t|
    t.string "FileType", limit: 25
    t.string "FileExtension", limit: 5
  end

  create_table "Folder", primary_key: "FolderID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "AssetBucketID"
    t.text "VibrationFolderRoot"
    t.text "IRFolderRoot"
    t.text "AssetPhotoLink"
    t.text "OldVibrationFolderRoot"
  end

  create_table "IR_Analysis", primary_key: "IRAnalysisID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "AssetBucketID"
    t.integer "IRFaultID"
    t.integer "dbUserID"
    t.integer "IRRepairDescriptionID"
    t.integer "IRDefectDecriptionID"
    t.datetime "DateTested", precision: nil
    t.datetime "DateAnalyzed", precision: nil
    t.text "AnalysisComments"
    t.text "InternalComments"
    t.boolean "IsFlaggedForReview", default: false, null: false
    t.integer "IRComponentID"
    t.integer "IRFaultLocationID"
    t.integer "IRPhaseWireID"
    t.float "DeltaTinC"
    t.float "APhaseAmps"
    t.float "BPhaseAmps"
    t.float "CPhaseAmps"
    t.string "Loading", limit: 10
    t.boolean "WasFaultCorrectedByPdM", default: false, null: false
    t.boolean "WORequired", default: false, null: false
    t.boolean "WOComplete", default: false, null: false
    t.boolean "WOCreated", default: false, null: false
    t.string "WONumber", limit: 50
    t.integer "WOPriority"
    t.float "VoltageL12"
    t.float "VoltageL23"
    t.float "VoltageL31"
    t.float "VoltageL1G"
    t.float "VoltageL2G"
    t.float "VoltageL3G"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.boolean "EmailedToPlants", default: false, null: false
    t.boolean "EmailedToPdM", default: false, null: false
    t.float "DeltaTinF"
    t.boolean "ReportForReferenceOnly", default: false, null: false
  end

  create_table "IR_Asset_Addition", primary_key: "IRAssetAdditionID", id: :integer, force: :cascade do |t|
    t.integer "IRAssetAdditionRemotePK"
    t.integer "SiteID"
    t.integer "SiteAreaID"
    t.integer "SiteRoomID"
    t.integer "AssetCategoryID"
    t.string "AssetCommonName", limit: 255
    t.string "Description", limit: 255
    t.integer "AssetRouteSequence"
    t.string "BucketColumnRow", limit: 5
    t.string "BucketTextDescription", limit: 100
    t.float "BucketRouteSequence"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
  end

  create_table "IR_Component", primary_key: "IRComponentID", id: :integer, force: :cascade do |t|
    t.string "Component", limit: 50
    t.integer "AssetDesignationID"
  end

  create_table "IR_Defect_Category", primary_key: "IRDefectCategoryID", id: :integer, force: :cascade do |t|
    t.string "IRDefectCategory", limit: 20
  end

  create_table "IR_Defect_Descrip", primary_key: "IRDefectDescriptID", id: :integer, force: :cascade do |t|
    t.integer "IRRepairDescriptionID"
    t.integer "FileLinkID"
    t.integer "CategoryID"
    t.string "RecommendedRepair", limit: 255
    t.string "RecommendNote", limit: 175
    t.text "RecommendComments"
  end

  create_table "IR_Fault", primary_key: "IRFaultID", id: :integer, force: :cascade do |t|
    t.integer "localIRFaultID"
    t.integer "TableNameID"
    t.integer "ForeignKeyID"
    t.integer "RouteInspectionID"
    t.integer "IRComponentID"
    t.integer "IRPhaseWireID"
    t.integer "FaultLocationID"
    t.text "FaultComments"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.float "VoltageL12"
    t.float "VoltageL23"
    t.float "VoltageL31"
    t.float "VoltageL1G"
    t.float "VoltageL2G"
    t.float "VoltageL3G"
    t.float "APhaseAmps"
    t.float "BPhaseAmps"
    t.float "CPhaseAmps"
    t.boolean "ReportCreated", default: false, null: false
    t.float "Loading"
    t.float "DeltaT"
    t.boolean "SyncToRoutes", default: false, null: false
    t.index ["IRFaultID"], name: "IX_IR_Fault", unique: true
  end

  create_table "IR_Fault_Location", primary_key: "IRFaultLocationID", id: :integer, force: :cascade do |t|
    t.string "IRFaultLocation", limit: 25
    t.integer "AssetDesignationID"
  end

  create_table "IR_Image", primary_key: "IRImageID", id: :integer, force: :cascade do |t|
    t.integer "IRAnalysisID"
    t.integer "FileID"
    t.boolean "ExceptionFound", default: false, null: false
    t.boolean "FollowUp", default: false, null: false
    t.boolean "RepairConfirmed", default: false, null: false
    t.string "ImageImportType", limit: 50
  end

  create_table "IR_Inspection", primary_key: "IRInspectionID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.datetime "InspectionDate", precision: nil
    t.integer "InspectionStatus"
    t.integer "InspectionCycle"
    t.integer "RouteReasonNotChecked"
  end

  create_table "IR_Phase_Wire", primary_key: "IRPhaseWireID", id: :integer, force: :cascade do |t|
    t.string "IRPhaseWire", limit: 20
  end

  create_table "IR_RAW_File", primary_key: "IRRawFileID", id: :integer, force: :cascade do |t|
    t.integer "IRAnalysisID", null: false
    t.text "IRRawFileLink"
    t.datetime "IRRawFileDate", precision: nil
    t.text "IRRawFileClickLink"
    t.string "IRRawFileDescription", limit: 255
  end

  create_table "IR_Repair_Description", primary_key: "IRRepairDescriptionID", id: :integer, force: :cascade do |t|
    t.string "IRRepairDescription", limit: 75
    t.string "IRRepairRecommendation", limit: 255
  end

  create_table "Inspection_Frequency", primary_key: "InspectionFrequencyID", id: :integer, force: :cascade do |t|
    t.string "InspectionFrequencyName", limit: 25
    t.boolean "IsActiveYN", default: false, null: false
    t.string "InspectionFrequencyDescription", limit: 75
    t.boolean "AppliesToVibrationYN", default: false, null: false
    t.boolean "AppliesToThermographyYN", default: false, null: false
    t.boolean "AppliesToUAVYN", default: false, null: false
    t.boolean "AppliesToAlignmentYN", default: false, null: false
    t.boolean "AppliesToMotionYN", default: false, null: false
    t.boolean "AppliesToMotorTestYN", default: false, null: false
    t.boolean "AppliesToROVYN", default: false, null: false
    t.boolean "IsMonthlyYN", default: false, null: false
    t.boolean "IsQuarterlyYN", default: false, null: false
    t.boolean "IsAnnuallyYN", default: false, null: false
    t.decimal "AnnualInspectionRate", precision: 5, scale: 2
    t.boolean "Jan", default: false, null: false
    t.boolean "Feb", default: false, null: false
    t.boolean "Mar", default: false, null: false
    t.boolean "Apr", default: false, null: false
    t.boolean "May", default: false, null: false
    t.boolean "Jun", default: false, null: false
    t.boolean "Jul", default: false, null: false
    t.boolean "Aug", default: false, null: false
    t.boolean "Sep", default: false, null: false
    t.boolean "Oct", default: false, null: false
    t.boolean "Nov", default: false, null: false
    t.boolean "Dec", default: false, null: false
  end

  create_table "MA_Analysis", primary_key: "MotionID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "MotionVideoID"
    t.integer "MotionCollectionIssueID"
    t.text "RecommendationID"
    t.text "AnalysisResultID"
    t.string "AnalystName", limit: 255
    t.string "CollectorName", limit: 255
    t.datetime "TestDate", precision: nil
    t.datetime "AnalysisDate", precision: nil
    t.string "CollectionCycle", limit: 25
    t.string "CollectionYear", limit: 25
    t.text "AnalysisComments"
    t.boolean "NewFaultIdentified", default: false, null: false
    t.boolean "PreviousFaultRepaired", default: false, null: false
    t.integer "SeverityNumber"
    t.string "SeverityDescription", limit: 25
    t.text "MotionReportLink"
    t.string "AssociatedVibeReportLink", limit: 255
    t.string "InspectionRequestedBy", limit: 255
    t.text "InspectionRequestedNotes"
    t.string "FaultLocation", limit: 255
    t.string "FaultDescription", limit: 255
    t.integer "VibeAnalysisID"
    t.integer "ReportID"
  end

  create_table "MA_Recommendation", primary_key: "MARecommendationID", id: :integer, force: :cascade do |t|
    t.string "RecommendationDescription", limit: 255
    t.text "RecommendationText"
    t.string "Other1", limit: 255
    t.string "Other2", limit: 255
    t.string "Other3", limit: 255
    t.string "Other4", limit: 255
    t.string "Other5", limit: 255
    t.string "Other6", limit: 255
  end

  create_table "MA_Result", primary_key: "MAAnalysisResultID", id: :integer, force: :cascade do |t|
    t.string "ResultDescription", limit: 255
    t.text "ResultText"
    t.string "Other1", limit: 255
    t.string "Other2", limit: 255
    t.string "Other3", limit: 255
    t.string "Other4", limit: 255
  end

  create_table "Manufacturer", primary_key: "ManufacturerID", id: :integer, force: :cascade do |t|
    t.string "ManufacturerName", limit: 255
  end

  create_table "Maximo_Asset", primary_key: "MaximoAssetID", id: :integer, force: :cascade do |t|
    t.string "MaximoAssetNumber", limit: 80
    t.string "MaximoAssetDescription", limit: 255
    t.string "MaximoAssetTag", limit: 255
    t.string "MaximoLocation", limit: 255
    t.string "MaximoAssetType", limit: 255
    t.string "MaximoSiteID", limit: 5
    t.integer "SiteID"
    t.integer "AssetDesignationID"
    t.string "MaximoParent", limit: 50
    t.datetime "MaximoChangeDate", precision: nil
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.string "MaximoSerialnumber", limit: 255
    t.integer "MaximoCriticality"
  end

  create_table "Maximo_Asset_Type_PdM", primary_key: "MaximoAssetTypePdMID", id: :integer, force: :cascade do |t|
    t.string "MaximoAssetType", limit: 25
    t.integer "AssetDesignationID"
    t.integer "AssetTypeRotatingID"
    t.integer "AssetTypeElectricalID"
  end

  create_table "Maximo_Recommendation", primary_key: "MaximoRecommendID", id: :integer, force: :cascade do |t|
    t.integer "RecommendCode"
    t.string "RecommendDescription", limit: 255
    t.string "RecommendShortInstruct", limit: 255
    t.text "RecommendLongInstruct"
    t.string "MaximoAttachmentInstruct", limit: 255
    t.integer "Display Sequence"
  end

  create_table "Motion_Inspection", primary_key: "MotionInspectionID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "RouteInspectionID"
    t.integer "AssetMotorID"
    t.integer "AssetCouplingID"
    t.datetime "MotionInspectionDate", precision: nil
    t.integer "dbUserID"
    t.varchar_max "MotionNotes"
  end

  create_table "Motor_Duty", primary_key: "MotorDutyID", id: :integer, force: :cascade do |t|
    t.string "DutyName", limit: 10
    t.string "DutyAbbreviation", limit: 3
    t.text "DutyDescription"
  end

  create_table "Motor_Enclosure", primary_key: "MotorEnclosureID", id: :integer, force: :cascade do |t|
    t.string "MotorEnclosure", limit: 25
    t.text "MotorEnclosureDescription"
    t.integer "FileID"
  end

  create_table "Motor_Frame", primary_key: "MotorFrameID", id: :integer, force: :cascade do |t|
    t.string "Frame", limit: 255
  end

  create_table "Motor_Insulation_Class", primary_key: "MotorInsulationClassID", id: :integer, force: :cascade do |t|
    t.string "InsulationClass", limit: 1
    t.integer "MaxOperTempC"
    t.integer "MaxOperTempF"
    t.integer "AllowableTempRise1SFC"
    t.integer "AllowableTempRise115SFC"
  end

  create_table "Motor_NEMA_Frame", primary_key: "MotorNEMAFrameID", id: { type: :string, limit: 20 }, force: :cascade do |t|
    t.string "D", limit: 10
    t.string "E", limit: 10
    t.string "2E", limit: 10
    t.string "F", limit: 10
    t.string "2F", limit: 10
    t.string "H", limit: 15
    t.string "N", limit: 10
    t.string "U", limit: 8
    t.string "O", limit: 10
    t.string "P", limit: 10
    t.string "AA", limit: 10
    t.string "AB", limit: 10
    t.string "AH", limit: 10
    t.string "AJ", limit: 10
    t.string "AK", limit: 10
    t.string "BA", limit: 8
    t.string "N-W", limit: 8
    t.string "V", limit: 10
    t.string "R", limit: 8
    t.string "S", limit: 8
    t.string "C", limit: 8
    t.string "BB", limit: 10
    t.string "BD", limit: 10
    t.string "XO", limit: 10
    t.string "TAP", limit: 10
    t.string "BF", limit: 10
    t.string "K", limit: 10
    t.string "W", limit: 10
    t.string "BE", limit: 10
    t.string "XP", limit: 10
    t.string "Key", limit: 10
    t.string "G", limit: 10
    t.string "I", limit: 10
    t.string "ES", limit: 10
    t.string "Description", limit: 255
    t.string "Notes", limit: 255
  end

  create_table "Motor_Phase", primary_key: "MotorPhaseID", id: :integer, force: :cascade do |t|
    t.string "Phase", limit: 6
  end

  create_table "Motor_Power_Factor", primary_key: "MotorPowerFactorID", id: :integer, force: :cascade do |t|
    t.integer "PowerFactor"
    t.string "Description", limit: 255
  end

  create_table "Motor_Service_Factor", primary_key: "MotorServiceFactorID", id: :integer, force: :cascade do |t|
    t.decimal "ServiceFactor", precision: 4, scale: 2
  end

  create_table "Motor_Type", primary_key: "MotorTypeID", id: :integer, force: :cascade do |t|
    t.string "MotorType", limit: 2
  end

  create_table "Motor_Voltage", primary_key: "MotorVoltageID", id: :integer, force: :cascade do |t|
    t.integer "Voltage"
  end

  create_table "OLD_Vibration_Analysis_Backup", primary_key: "VibrationAnalysisID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "DBUserID"
    t.integer "CycleMonthID"
    t.integer "CycleYearID"
    t.datetime "TestDate", precision: nil
    t.datetime "AnalysisDate", precision: nil
    t.integer "VibrationAnalysisResultID"
    t.text "ReportComments"
    t.text "InternalComments"
    t.integer "SeverityID"
    t.integer "VibrationAnalysisRecommendationID"
    t.integer "VibrationAnalysisRecommendationID2"
    t.boolean "FlagForAnalystReview", null: false
    t.boolean "IsNonRouteAnalysis", null: false
  end

  create_table "OLD_Vibration_Analysis_Comment", primary_key: "VibrationAnalysisCommentID", id: :integer, force: :cascade do |t|
    t.integer "Arrangement"
    t.string "Title", limit: 100
    t.text "Comment"
    t.integer "VibrationAnalysisCommentGroupID"
  end

  create_table "OLD_Vibration_Analysis_Comment_Group", primary_key: "VibrationAnalysisCommentGroupID", id: :integer, force: :cascade do |t|
    t.string "VibrationAnalysisCommentGroupDescription", limit: 50
  end

  create_table "OLD_Vibration_Analysis_Recommendation", primary_key: "VibrationAnalysisRecommendationID", id: :integer, force: :cascade do |t|
    t.integer "VibrationAnalysisRecommendationGroupID"
    t.integer "VibrationAnalysisRecommendationTextID"
    t.integer "VibrationAnalysisRecommendationRankID"
    t.integer "VIbrationAnalysisCommentGroupID"
    t.integer "VibrationAnalysisResultID"
  end

  create_table "OLD_Vibration_Analysis_Recommendation_Group", primary_key: "VibrationAnalysisRecommendationGroupID", id: :integer, force: :cascade do |t|
    t.string "RecommendationGroupDescription", limit: 50
  end

  create_table "OLD_Vibration_Analysis_Recommendation_Rank", primary_key: "VibrationAnalysisRecommendationRankID", id: :integer, force: :cascade do |t|
    t.string "VibrationAnalysisRecommendationRankDescription", limit: 50
  end

  create_table "OLD_Vibration_Analysis_Recommendation_Text", primary_key: "VibrationAnalysisRecommendationTextID", id: :integer, force: :cascade do |t|
    t.string "VIbrationAnalysisRecomendationText", limit: 50
  end

  create_table "OLD_Vibration_Analysis_Result", primary_key: "VibrationAnalysisResultID", id: :integer, force: :cascade do |t|
    t.string "VibrationAnalysisResult", limit: 75
    t.integer "VibrationAnalysisResultRankID"
    t.integer "Sequence"
  end

  create_table "OLD_Vibration_Analysis_Result_Rank", primary_key: "VibrationAnalysisResultRankID", id: :integer, force: :cascade do |t|
    t.string "VibrationAnalysisResultRank", limit: 50
  end

  create_table "PdM_Success_Failure", primary_key: "PdMSuccessFailureID", id: :integer, force: :cascade do |t|
    t.integer "AnalysisID"
    t.integer "TableNameID"
    t.boolean "SuccessYN", default: false, null: false
    t.boolean "FailureYN", default: false, null: false
    t.text "Description"
    t.decimal "Costs", precision: 18, scale: 2
    t.string "WorkOrderID", limit: 50
  end

  create_table "Pump_Seal_Type", primary_key: "PumpSealTypeID", id: :integer, force: :cascade do |t|
    t.string "SealType", limit: 25
    t.string "Description", limit: 255
    t.integer "FileID"
  end

  create_table "Pump_Station", primary_key: "PumpStationID", id: :integer, force: :cascade do |t|
    t.integer "SiteAreaID", null: false
    t.integer "PumpStationTypeID"
    t.string "StationNumber", limit: 255
    t.string "StationShortName", limit: 6
    t.string "Service", limit: 255
    t.float "Route"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.string "StreetAddress", limit: 255
    t.integer "PumpCount"
    t.string "InstallYear", limit: 4
    t.integer "PumpStationSuctionTypeID"
    t.float "WetWellDiameter"
    t.text "Notes"
  end

  create_table "Pump_Station_Pump", primary_key: "PumpStationPumpID", id: :integer, force: :cascade do |t|
    t.integer "PumpStationId"
    t.integer "AssetMotorID"
    t.integer "AssetDrivenID"
    t.integer "PumpNumber"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.integer "PumpVoltage"
    t.integer "PumpRPM"
  end

  create_table "Pump_Station_Suction_Type", primary_key: "PumpStationSuctionTypeID", id: :integer, force: :cascade do |t|
    t.string "SuctionType", limit: 50
  end

  create_table "Pump_Station_Type", primary_key: "PumpStationTypeID", id: :integer, force: :cascade do |t|
    t.string "PumpStationType", limit: 25
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
  end

  create_table "Report_Type", primary_key: "ReportTypeID", id: :integer, force: :cascade do |t|
    t.string "ReportType", limit: 75
  end

  create_table "Route_Collection_Audit", primary_key: "RouteCollectionAuditID", id: :integer, force: :cascade do |t|
    t.integer "RouteInspectionID"
    t.integer "AnalysisID"
    t.boolean "CollectionIssuePresent", default: false, null: false
    t.string "ErrorDescription", limit: 50
    t.integer "TechnologyID"
    t.text "CollectionIssueComments"
    t.integer "RouteCollectorID"
    t.integer "RouteCollectionIssueTypeID"
  end

  create_table "Route_Collection_Issue_Type", primary_key: "RouteCollectionIssueTypeID", id: :integer, force: :cascade do |t|
    t.string "RouteCollectionIssueType", limit: 100
  end

  create_table "Route_Collection_Status", primary_key: "RouteCollectionStatusID", id: :integer, force: :cascade do |t|
    t.string "RouteCollectionStatus", limit: 30
    t.boolean "AppliesToVibration", default: false, null: false
    t.boolean "AppliesToIR", default: false, null: false
    t.boolean "AppliesToUAV", default: false, null: false
    t.boolean "AppliesToAlignment", default: false, null: false
    t.boolean "AppliesToIRSearch", default: false, null: false
    t.boolean "AppliesToVibeSearch", default: false, null: false
    t.boolean "AppliesToAlignSearch", default: false, null: false
    t.boolean "AppliesToUAVSearch", default: false, null: false
    t.boolean "IsFault", default: false, null: false
  end

  create_table "Route_Collector", primary_key: "RouteCollectorID", id: :integer, force: :cascade do |t|
    t.string "RouteCollector", limit: 50
  end

  create_table "Route_IR_Status", primary_key: "RouteIRStatusID", id: :integer, force: :cascade do |t|
    t.string "RouteStatus", limit: 12
  end

  create_table "Route_Inspection", primary_key: "RouteInspectionID", id: :integer, force: :cascade do |t|
    t.integer "TableNameID"
    t.integer "TechnologyID"
    t.integer "ForeignKeyID", null: false
    t.integer "RouteInspectionPriorityID"
    t.integer "RouteCollectionStatusID"
    t.integer "ReasonNotCheckedID"
    t.date "InspectionDate"
    t.text "RouteComments"
    t.integer "CycleMonthID"
    t.integer "CycleQuarterID"
    t.integer "CycleYearID"
    t.integer "DBUserID"
    t.integer "VibeAssetID"
    t.boolean "RouteActive", default: false, null: false
    t.datetime "LastModifiedOn", precision: nil
    t.integer "AnalysisID"
    t.boolean "IsOneOffInspection", default: false, null: false
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.boolean "SyncToRoutes", default: false, null: false
    t.index ["RouteInspectionID"], name: "IX_Route_Inspection"
  end

  create_table "Route_Note", primary_key: "RouteNoteID", id: :integer, force: :cascade do |t|
    t.integer "RouteInspectionID"
    t.text "RouteNote"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.boolean "AttachmentExists", default: false, null: false
  end

  create_table "Route_Priority", primary_key: "RoutePriorityID", id: :integer, force: :cascade do |t|
    t.string "RoutePriorityDescription", limit: 100
    t.string "RoutePriorityColor", limit: 10
    t.string "RoutPriorityColorCode", limit: 18
  end

  create_table "Route_ReasonNotChecked", primary_key: "RouteReasonNotCheckedID", id: :integer, force: :cascade do |t|
    t.string "Reason", limit: 50
    t.boolean "Active", default: false, null: false
    t.boolean "AppliesToIR", default: false, null: false
    t.boolean "AppliesToVibration", default: false, null: false
    t.boolean "AppliesToAlignment", default: false, null: false
    t.boolean "AppliesToUAV", default: false, null: false
    t.boolean "AppliesToROV", default: false, null: false
    t.boolean "AppliesToMotion", default: false, null: false
    t.datetime "ModifiedDate", precision: nil
  end

  create_table "SKF_Stat", primary_key: "SKFStatID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.boolean "IsSKFModificationNeeded", default: false, null: false
    t.integer "MeasurementCount"
    t.integer "CollectionPointCount"
    t.text "PointModificationNote"
  end

  create_table "Severity", primary_key: "SeverityID", id: :integer, force: :cascade do |t|
    t.string "SeverityDescription", limit: 100
    t.string "SeverityColor", limit: 10
    t.string "SeverityColorCode", limit: 18
  end

  create_table "Site", primary_key: "SiteID", id: :integer, force: :cascade do |t|
    t.integer "ServiceTypeID"
    t.string "SiteLongName", limit: 30
    t.string "SiteShortName", limit: 4
    t.string "MaximoSite", limit: 5
    t.integer "SiteRouteSequence"
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.boolean "SiteActive", default: true, null: false
  end

  create_table "Site_Area", primary_key: "SiteAreaID", id: :integer, force: :cascade do |t|
    t.integer "SiteID"
    t.integer "MaximoAssetNumberID"
    t.string "AreaCommonName", limit: 100
    t.string "AreaDescription", limit: 100
    t.integer "AreaRouteSequence"
    t.integer "AreaCriticalityRank"
    t.boolean "RotatingAssetsPresent", default: false, null: false
    t.boolean "ElectricalAssetsPresent", default: false, null: false
    t.boolean "StructuralAssetsPresent", default: false, null: false
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.boolean "AreaActive", default: true, null: false
    t.boolean "TankAssetsPresent", default: false, null: false
  end

  create_table "Site_Room", primary_key: "SiteRoomID", id: :integer, force: :cascade do |t|
    t.integer "SiteAreaID"
    t.string "RoomCommonName", limit: 100
    t.string "RoomDescription", limit: 100
    t.integer "RoomRouteSequence"
    t.boolean "RotatingAssetsPresent", default: false, null: false
    t.boolean "ElectricalAssetsPresent", default: false, null: false
    t.boolean "StructuralAssetsPresent", default: false, null: false
    t.boolean "TankAssetsPresent", default: false, null: false
    t.datetime "ModifiedDate", precision: nil, default: -> { "getdate()" }
    t.boolean "RoomActive", default: true, null: false
  end

  create_table "Site_Service_Type", primary_key: "SiteServiceTypeID", id: :integer, force: :cascade do |t|
    t.string "SiteServiceType", limit: 25
  end

  create_table "Table_Last_Modified", primary_key: "TableLastModifiedID", id: :integer, force: :cascade do |t|
    t.datetime "dbo_Asset_Modified", precision: 0
    t.datetime "dbo_Asset_Arc_Flash_Modified", precision: 0
    t.datetime "dbo_Asset_Bucket_Modified", precision: 0
    t.datetime "dbo_Asset_Category_Modified", precision: 0
    t.datetime "dbo_IR_Fault_Modified", precision: 0
    t.datetime "dbo_Pump_Station_Modified", precision: 0
    t.datetime "dbo_Pump_Station_Type_Modified", precision: 0
    t.datetime "dbo_Route_Inspection_Modified", precision: 0
    t.datetime "dbo_Route_Note_Modified", precision: 0
    t.datetime "dbo_Site_Modified", precision: 0
    t.datetime "dbo_Site_Area_Modified", precision: 0
    t.datetime "dbo_Site_Room_Modified", precision: 0
    t.datetime "dbo_Route_ReasonNotChecked_Modified", precision: 0
    t.datetime "ModifiedDate", precision: 7
  end

  create_table "Table_Name", primary_key: "TableNameID", id: :integer, force: :cascade do |t|
    t.integer "TechnologyID"
    t.string "TableName", limit: 255
    t.string "PrimaryKeyName", limit: 50
    t.string "AssetDetailFormName", limit: 75
  end

  create_table "Tank_Component", primary_key: "TankComponentID", id: :integer, force: :cascade do |t|
    t.string "Component", limit: 255
    t.string "ComponentDescription", limit: 255
    t.text "ComponentExampleLink"
  end

  create_table "Tank_Construction_Type", primary_key: "TankConstructionTypeID", id: :integer, force: :cascade do |t|
    t.string "TankConstruction", limit: 35
  end

  create_table "Tank_Defect", primary_key: "TankDefectID", id: :integer, force: :cascade do |t|
    t.string "TankDefect", limit: 255
    t.string "TankDefectDescription", limit: 255
    t.text "TankDefectExample"
  end

  create_table "Tank_Use_Type", primary_key: "TankUseTypeID", id: :integer, force: :cascade do |t|
    t.string "TankUse", limit: 35
  end

  create_table "Technology", primary_key: "TechnologyID", id: :integer, force: :cascade do |t|
    t.string "Technology", limit: 25
  end

  create_table "UAV_Analysis", primary_key: "UAVAnalysisID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "RouteInspectionID"
    t.integer "CycleYearID"
    t.date "InspectionDate"
    t.date "ReportDate"
    t.integer "ReportedByDBUserID"
    t.integer "InspectedByDBUserID"
    t.boolean "FaultFound", default: false, null: false
    t.text "ReportComments"
    t.text "InternalComments"
    t.boolean "EmailedToSite", default: false, null: false
    t.boolean "EmailedToPdM", default: false, null: false
    t.boolean "ReportCreated", default: false, null: false
    t.integer "UAVInspectionTypeID"
  end

  create_table "UAV_Analysis_Attachment_Comment", primary_key: "UAVAnalysisAttachmentCommentID", id: :integer, force: :cascade do |t|
    t.string "Title", limit: 25
    t.string "Comment", limit: 150
    t.integer "Sequence"
    t.integer "AssetCategoryID"
  end

  create_table "UAV_Building_Analysis", primary_key: "UAVBuildingAnalysisID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.string "InspectionCycle", limit: 10
    t.datetime "InspectionDate", precision: nil
    t.string "InspectionYear", limit: 19
    t.string "ReportedBy", limit: 35
    t.string "InspectedBy", limit: 35
    t.datetime "ReportDate", precision: nil
    t.text "FaultDescription"
    t.text "ReportLink"
  end

  create_table "UAV_Descript", primary_key: "UAVDescriptID", id: :integer, force: :cascade do |t|
    t.string "Category", limit: 10
    t.string "Component", limit: 100
    t.string "ComponentDescription", limit: 255
    t.text "RecommendedExample"
    t.text "RecommendComments"
  end

  create_table "UAV_Tank_Access_Hatch_Detail", primary_key: "UAVTankAccessHatchDetailID", id: :integer, force: :cascade do |t|
    t.string "AccessHatchDetail", limit: 150
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Analysis", primary_key: "UAVTankAnalysisID", id: :integer, force: :cascade do |t|
    t.integer "UAVInspectionTypeID"
    t.integer "CycleQuarterID"
    t.integer "CycleYearID"
    t.integer "RouteInspectionID"
    t.integer "AssetID"
    t.date "InspectionDate"
    t.integer "ReportedByDBUserID"
    t.integer "InspectedByDBUserID"
    t.integer "PerimeterVentRouteCollectionStatusID"
    t.integer "UAVTankPerimeterVentDetailID"
    t.integer "TopVentRouteCollectionStatusID"
    t.integer "UAVTankTopVentDetailID"
    t.integer "AccessHatchRouteCollectionStatusID"
    t.integer "UAVTankAccessHatchDetailID"
    t.integer "OverflowRouteCollectionStatusID"
    t.integer "UAVTankOverflowDetailID"
    t.integer "RoofStructureRouteCollectionStatusID"
    t.integer "UAVTankRoofStructureDetailID"
    t.integer "ConduitPipeBulkHeadRouteCollectionStatusID"
    t.integer "UAVTankConduitPipeBulkHeadDetailID"
    t.integer "AnimalEvidenceRouteCollectionStatusID"
    t.integer "UAVTankAnimalEvidenceDetailID"
    t.integer "RainIncursionRouteCollectionStatusID"
    t.integer "UAVTankRainIncursionDetailID"
    t.integer "ExternalLadderRouteCollectionStatusID"
    t.integer "UAVTankExternalLadderDetailID"
    t.integer "LadderSafetyCageRouteCollectionStatusID"
    t.integer "UAVTankLadderSafetyCageDetailID"
    t.integer "LadderVandalGuardRouteCollectionStatusID"
    t.integer "UAVTankLadderVandalGuardDetailID"
    t.integer "ExternalRailingRouteCollectionStatusID"
    t.integer "UAVTankExternalRailingDetailID"
    t.integer "GroundLevelManwayRouteCollectionStatusID"
    t.integer "UAVTankGroundLevelManwayDetailID"
    t.integer "RoofSafetyTieOffRouteCollectionStatusID"
    t.integer "UAVTankRoofSafetyTieOffDetailID"
    t.integer "SecurityDetailRouteCollectionStatusID"
    t.integer "UAVTankSecurityDetailID"
    t.integer "RoofCoatingRouteCollectionStatusID"
    t.integer "UAVTankRoofCoatingDetailID"
    t.integer "WalltoRoofJointRouteCollectionStatusID"
    t.integer "UAVTankWalltoRoofJointDetailID"
    t.integer "ExteriorWallCoatingRouteCollectionStatusID"
    t.integer "UAVTankExteriorWallCoatingDetailID"
    t.integer "ExteriorWallStructureRouteCollectionStatusID"
    t.integer "UAVTankExteriorWallStructureDetailID"
    t.integer "WallFloorJointRouteCollectionStatusID"
    t.integer "UAVTankWallFloorJointDetailID"
    t.integer "PerimeterFootingRouteCollectionStatusID"
    t.integer "UAVTankPerimeterFootingDetailID"
    t.integer "ErosionRouteCollectionStatusID"
    t.integer "UAVTankErosionDetailID"
    t.integer "VegetationRouteCollectionStatusID"
    t.integer "UAVTankVegetationDetailID"
    t.integer "LightningProtectionRouteCollectionStatusID"
    t.integer "UAVTankLightningProtectionDetailID"
    t.text "InspectionNotes"
    t.boolean "ReportCreated", default: false, null: false
    t.boolean "FaultIdentified", default: false, null: false
    t.text "InternalNotes"
    t.boolean "EmailedToPdM", default: false, null: false
    t.boolean "EmailedToSite", default: false, null: false
  end

  create_table "UAV_Tank_Animal_Evidence_Detail", primary_key: "UAVTankAnimalEvidenceDetailID", id: :integer, force: :cascade do |t|
    t.string "AnimalEvidenceDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Conduit_Pipe_Bulkhead_Detail", primary_key: "UAVTankConduitPipeBulkHeadDetailID", id: :integer, force: :cascade do |t|
    t.string "ConduitPipeBulkHeadDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Erosion_Detail", primary_key: "UAVTankErosionDetailID", id: :integer, force: :cascade do |t|
    t.string "ErosionDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Exterior_Wall_Coating_Detail", primary_key: "UAVTankExteriorWallCoatingDetailID", id: :integer, force: :cascade do |t|
    t.string "ExteriorWallCoatingDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Exterior_Wall_Structure_Detail", primary_key: "UAVTankExteriorWallStructureDetailID", id: :integer, force: :cascade do |t|
    t.string "WallStructureDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_External_Ladder_Detail", primary_key: "UAVTankExternalLadderDetailID", id: :integer, force: :cascade do |t|
    t.string "ExternalLadderDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_External_Railing_Detail", primary_key: "UAVTankExternalRailingDetailID", id: :integer, force: :cascade do |t|
    t.string "ExternalRailingDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Ground_Level_Manway_Detail", primary_key: "UAVTankGroundLevelManwayDetailID", id: :integer, force: :cascade do |t|
    t.string "GroundLevelManwayDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Ladder_Safety_Cage_Detail", primary_key: "UAVTankLadderSafetyCageDetailID", id: :integer, force: :cascade do |t|
    t.string "LadderSafetyCageDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Ladder_Vandal_Guard", primary_key: "UAVTankLadderVandalGuardDetailID", id: :integer, force: :cascade do |t|
    t.string "LadderVandalGuardDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Lightning_Protection_Detail", primary_key: "UAVTankLightningProtectionDetailID", id: :integer, force: :cascade do |t|
    t.string "LightningProtectionDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Overflow_Detail", primary_key: "UAVTankOverFlowDetailID", id: :integer, force: :cascade do |t|
    t.string "OverFlowDetail", limit: 150
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Perimeter_Footing_Detail", primary_key: "UAVTankPerimeterFootingDetailID", id: :integer, force: :cascade do |t|
    t.string "PerimeterFootingDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Perimeter_Vent_Detail", primary_key: "UAVTankPerimeterVentDetailID", id: :integer, force: :cascade do |t|
    t.string "PerimeterVentDetail", limit: 150
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Rain_Incursion_Detail", primary_key: "UAVTankRainIncursionDetailID", id: :integer, force: :cascade do |t|
    t.string "RainIncursionDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Roof_Coating_Detail", primary_key: "UAVTankRoofCoatingDetailID", id: :integer, force: :cascade do |t|
    t.string "RoofCoatingDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Roof_Safety_Tie_Off_Detail", primary_key: "UAVTankRoofSafetyTieOffDetailID", id: :integer, force: :cascade do |t|
    t.string "RoofSafetyTieOffDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Roof_Structure_Detail", primary_key: "UAVTankRoofStructureDetailID", id: :integer, force: :cascade do |t|
    t.string "RoofStructureDetail", limit: 150
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Security_Detail", primary_key: "UAVTankSecurityDetailID", id: :integer, force: :cascade do |t|
    t.string "SecurityDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Top_Vent_Detail", primary_key: "UAVTankTopVentDetailID", id: :integer, force: :cascade do |t|
    t.string "TopVentDetail", limit: 150
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Vegetation_Detail", primary_key: "UAVTankVegetationDetailID", id: :integer, force: :cascade do |t|
    t.string "VegetationDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Wall_Floor_Joint_Detail", primary_key: "UAVTankWallFloorJointDetailID", id: :integer, force: :cascade do |t|
    t.string "WallFloorJointDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "UAV_Tank_Wall_to_Roof_Joint_Detail", primary_key: "UAVTankWalltoRoofJointDetailID", id: :integer, force: :cascade do |t|
    t.string "WalltoRoofJointDetail", limit: 125
    t.boolean "IsFault", default: false, null: false
  end

  create_table "Vibration_Analysis", primary_key: "VibrationAnalysisID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "DBUserID"
    t.integer "CycleMonthID"
    t.integer "CycleYearID"
    t.datetime "TestDate", precision: nil
    t.datetime "AnalysisDate", precision: nil
    t.integer "VibrationAnalysisResultID"
    t.text "ReportComments"
    t.text "InternalComments"
    t.integer "SeverityID"
    t.integer "VibrationAnalysisRecommendationID"
    t.integer "VibrationAnalysisRecommendationID2"
    t.boolean "FlagForAnalystReview", default: false, null: false
    t.boolean "IsNonRouteAnalysis", default: false, null: false
  end

  create_table "Vibration_Analysis_Asset_Type", primary_key: "VibrationAnalysisAssetTypeID", id: :integer, force: :cascade do |t|
    t.string "VibrationAnalysisAssetTypeDescription", limit: 30
  end

  create_table "Vibration_Analysis_Calculation", primary_key: "VibrationAnalysisCalculationID", id: :integer, force: :cascade do |t|
    t.integer "VibrationAnalysisID"
    t.string "Asset1CursorColor", limit: 10
    t.string "Asset2CursorColor", limit: 10
    t.string "Asset3CursorColor", limit: 10
    t.string "Asset4CursorColor", limit: 10
    t.string "Asset1RPM", limit: 5
    t.string "Asset2RPM", limit: 5
    t.string "Asset3RPM", limit: 5
    t.string "Asset4RPM", limit: 5
    t.text "Asset1Notes"
    t.text "Asset2Notes"
    t.text "Asset3Notes"
    t.text "Asset4Notes"
    t.string "Asset1Name", limit: 50
    t.string "Asset2Name", limit: 50
    t.string "Asset3Name", limit: 50
    t.string "Asset4Name", limit: 50
    t.integer "RatedRPM"
    t.integer "ActualRPM"
    t.integer "1x"
    t.integer "2x"
    t.integer "3x"
    t.integer "LineFreq"
    t.integer "2xLineFreq"
    t.integer "PolePassFreq"
    t.integer "SlipFreq"
    t.integer "VFDRatedRPM"
    t.integer "VFDhz"
    t.integer "VFDRPM"
    t.integer "ConvertThis"
    t.string "ConvertFromUnits", limit: 10
    t.string "ConvertToUnits", limit: 10
    t.integer "ConvertResult"
    t.binary_basic "SSMA_TimeStamp", limit: 8, null: false
  end

  create_table "Vibration_Analysis_Comment", primary_key: "VibrationAnalysisCommentID", id: :integer, force: :cascade do |t|
    t.integer "Sequence"
    t.string "Title", limit: 45
    t.text "Comment"
    t.integer "VibrationAnalysisFaultGroupID"
    t.integer "VibrationAssetTypeID"
    t.integer "DefaultSeverityID"
    t.integer "OldVibrationAnalysisID"
    t.boolean "RecommendsRepair", default: false, null: false
  end

  create_table "Vibration_Analysis_Definition", primary_key: "VibrationAnalysisDefinitionID", id: :integer, force: :cascade do |t|
    t.string "Term", limit: 255
    t.text "Definition"
  end

  create_table "Vibration_Analysis_Fault_Group", primary_key: "VibrationAnalysisFaultGroupID", id: :integer, force: :cascade do |t|
    t.string "FaultGroupDescription", limit: 40
  end

  create_table "Vibration_Analysis_Recommendation", primary_key: "VibrationAnalysisRecommendationID", id: :integer, force: :cascade do |t|
    t.string "VibrationAnalysisRecommendationText", limit: 65
    t.integer "VibrationAnalysisFaultGroupID"
    t.integer "VibrationAnalysisAssetTypeID"
    t.integer "VibrationAnalysisRecommendationRankID"
    t.integer "OldVibrationAnalysisRecommendationID"
    t.boolean "Active", default: false, null: false
  end

  create_table "Vibration_Analysis_Result", primary_key: "VibrationAnalysisResultID", id: :integer, force: :cascade do |t|
    t.integer "Sequence"
    t.string "VibrationAnalysisResult", limit: 45
    t.integer "VibrationFaultGroupID"
    t.integer "VibrationAssetTypeID"
    t.integer "OldVibrationAnalysisResultID"
    t.boolean "Active", default: false, null: false
    t.boolean "IsFault", default: false, null: false
  end

  create_table "Vibration_Analysis_Screenshot_Comment", primary_key: "VibrationAnalysisScreenshotCommentID", id: :integer, force: :cascade do |t|
    t.string "Title", limit: 50
    t.string "Comment", limit: 255
    t.integer "Sequence"
  end

  create_table "Vibration_Analysis_Terminology", primary_key: "VibrationAnalysisTermID", id: :integer, force: :cascade do |t|
    t.string "Term", limit: 255
    t.text "Definition"
  end

  create_table "Vibration_Collection_Issue", primary_key: "VibrationCollectionIssueID", id: :integer, force: :cascade do |t|
    t.string "CollectionIssue", limit: 50
  end

  create_table "Vibration_Collection_Point", primary_key: "VibrationCollectionPointID", id: :integer, force: :cascade do |t|
    t.string "PointName", limit: 25
    t.string "PointDescription", limit: 65
    t.string "Units", limit: 15
    t.string "Orientation", limit: 12
    t.string "Location", limit: 10
    t.string "FullScale", limit: 2
    t.string "Detection", limit: 15
    t.string "LOR", limit: 6
    t.string "StartingFreq", limit: 4
    t.string "EndFreq", limit: 4
    t.string "LowFreqCutoff", limit: 4
    t.string "Averages", limit: 1
    t.string "Averaging", limit: 20
    t.string "Window", limit: 10
    t.string "OverallAlarmName", limit: 75
    t.integer "OverallAlarmID"
    t.integer "FrequencyID"
  end

  create_table "Vibration_Cycle_Summary_Email_Status", primary_key: "VibrationCycleSummaryEmailStatusID", id: :integer, force: :cascade do |t|
    t.integer "SiteID"
    t.integer "CycleMonthID"
    t.integer "CycleYearID"
    t.boolean "AnalysisCompleteYN", default: false, null: false
    t.boolean "EmailedToPlantsYN", default: false, null: false
    t.datetime "EmailDate", precision: nil
    t.integer "EmailedBy"
  end

  create_table "Vibration_Diagnostic_Defect_by_Fault", primary_key: "VibrationDefectByFaultID", id: :integer, force: :cascade do |t|
    t.integer "VibrationFaultCategoryID"
    t.string "Faults", limit: 255
  end

  create_table "Vibration_Diagnostic_Defect_by_Symptom", primary_key: "VibrationDefectBySymptomID", id: :integer, force: :cascade do |t|
    t.integer "SortOrder"
    t.string "PrimarySymptoms", limit: 60
    t.string "SecondarySymptoms", limit: 60
    t.string "ThirdSymptoms", limit: 60
    t.string "ProbableFault", limit: 60
  end

  create_table "Vibration_Fault", primary_key: "VibrationFaultID", id: :integer, force: :cascade do |t|
    t.integer "VibrationAnalysisID"
    t.boolean "IsThisANewFault", default: false, null: false
    t.boolean "HasTheFaultBeenResolved", default: false, null: false
    t.boolean "IsThisARepeatFault", default: false, null: false
    t.integer "FaultSeverity"
    t.integer "VibrationFaultLocationID"
    t.integer "VibrationFaultCategoryID"
    t.integer "VibrationFaultComponentID"
    t.text "VibrationFaultComments"
    t.date "FaultReportedDate"
    t.date "FaultResolvedDate"
    t.text "FaultResolvedComments"
  end

  create_table "Vibration_Fault_Category", primary_key: "VibrationFaultCategoryID", id: :integer, force: :cascade do |t|
    t.string "FaultCategory", limit: 25
  end

  create_table "Vibration_Fault_Component", primary_key: "VibrationFaultComponentID", id: :integer, force: :cascade do |t|
    t.string "Component", limit: 50
  end

  create_table "Vibration_Fault_Location", primary_key: "VibrationFaultLocationID", id: :integer, force: :cascade do |t|
    t.string "FaultLocation", limit: 100
  end

  create_table "Vibration_Recommendation_Rank", primary_key: "VibrationRecommendationRankID", id: :integer, force: :cascade do |t|
    t.string "Description", limit: 35
  end

  create_table "Vibration_Severity_Change", primary_key: "VibrationSeverityChangeID", id: :integer, force: :cascade do |t|
    t.integer "AssetID"
    t.integer "AnalysisID"
    t.integer "PreviousSeverityID"
    t.integer "CurrentSeverityID"
  end

  create_table "Vibration_Validation", primary_key: "VibrationValidationID", id: :integer, force: :cascade do |t|
    t.integer "VibrationAnalysisResultID"
    t.string "ReportCommentContains", limit: 50
    t.text "ValidationFailedMessage"
    t.boolean "IsValidationCheckActiveYN", default: false, null: false
  end

  create_table "Work_Order", primary_key: "WorkOrderID", id: :integer, force: :cascade do |t|
    t.integer "AnalysisID"
    t.integer "TechnologyID"
    t.integer "AssetCategoryID"
    t.string "MaximoWorkOrderNumber", limit: 60
    t.integer "FileID"
    t.string "WorkOrderTrigger", limit: 255
  end

  create_table "site_areas", force: :cascade do |t|
    t.string "AreaCommonName"
    t.integer "SiteId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "site_rooms", force: :cascade do |t|
    t.integer "RoomID"
    t.integer "SiteAreaID"
    t.string "RoomName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sysdiagrams", primary_key: "diagram_id", id: :integer, force: :cascade do |t|
    t.string "name", null: false
    t.integer "principal_id", null: false
    t.integer "version"
    t.binary "definition"
    t.index ["principal_id", "name"], name: "UK_principal_name", unique: true
  end

  add_foreign_key "Asset", "Site_Room", column: "SiteRoomID", primary_key: "SiteRoomID", name: "FK_Asset_Site_Room"
  add_foreign_key "Asset_Default_Collection", "Asset", column: "AssetID", primary_key: "AssetID", name: "FK_Asset_Default_Collection_Asset"
  add_foreign_key "Site_Area", "Site", column: "SiteID", primary_key: "SiteID", name: "FK_SIte_Area_Site"
  add_foreign_key "Site_Room", "Site_Area", column: "SiteAreaID", primary_key: "SiteAreaID", name: "FK_Site_Room_SIte_Area"
end
