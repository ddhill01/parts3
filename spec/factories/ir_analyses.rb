FactoryBot.define do
  factory :ir_analysis do
    AssetID { 1 }
    AssetBucketID { 1 }
    IRFaultID { 1 }
    dbUserID { 1 }
    IRRepairDescriptionID { 1 }
    IRDefectDecriptionID { 1 }
    DateTested { "2023-05-25 14:42:14" }
    DateAnalyzed { "2023-05-25 14:42:14" }
    AnalysisComments { "MyText" }
    InternalComments { "MyText" }
    IsFlaggedForReview { false }
    IRComponentID { 1 }
    IRFaultLocationID { 1 }
    IRPhaseWireID { 1 }
    DeltaTinC { 1.5 }
    APhaseAmps { 1.5 }
    BPhaseAmps { 1.5 }
    CPhaseAmps { 1.5 }
    Loading { "MyString" }
    WasFaultCorrectedByPdM { false }
    WORequired { false }
    WOComplete { false }
    WOCreated { false }
    WONumber { "MyString" }
    WOPriority { 1 }
    VoltageL12 { 1.5 }
    VoltageL23 { 1.5 }
    VoltageL31 { 1.5 }
    VoltageL1G { 1.5 }
    VoltageL2G { 1.5 }
    VoltageL3G { 1.5 }
    ModifiedDate { "2023-05-25 14:42:14" }
    EmailedToPlants { false }
    EmailedToPdM { false }
    DeltaTinF { 1.5 }
    ReportForReferenceOnly { false }
  end
end
