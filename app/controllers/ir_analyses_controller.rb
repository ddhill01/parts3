class IrAnalysesController < ApplicationController
  before_action :set_ir_analysis, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ir_analyses = IrAnalysis.all
    respond_with(@ir_analyses)
  end

  def show
    respond_with(@ir_analysis)
  end

  def new
    @ir_analysis = IrAnalysis.new
    respond_with(@ir_analysis)
  end

  def edit
  end

  def create
    @ir_analysis = IrAnalysis.new(ir_analysis_params)
    flash[:notice] = 'IrAnalysis was successfully created.' if @ir_analysis.save
    respond_with(@ir_analysis)
  end

  def update
    flash[:notice] = 'IrAnalysis was successfully updated.' if @ir_analysis.update(ir_analysis_params)
    respond_with(@ir_analysis)
  end

  def destroy
    @ir_analysis.destroy
    respond_with(@ir_analysis)
  end

  private
    def set_ir_analysis
      @ir_analysis = IrAnalysis.find(params[:id])
    end

    def ir_analysis_params
      params.require(:ir_analysis).permit(:AssetID, :AssetBucketID, :IRFaultID, :dbUserID, :IRRepairDescriptionID, :IRDefectDecriptionID, :DateTested, :DateAnalyzed, :AnalysisComments, :InternalComments, :IsFlaggedForReview, :IRComponentID, :IRFaultLocationID, :IRPhaseWireID, :DeltaTinC, :APhaseAmps, :BPhaseAmps, :CPhaseAmps, :Loading, :WasFaultCorrectedByPdM, :WORequired, :WOComplete, :WOCreated, :WONumber, :WOPriority, :VoltageL12, :VoltageL23, :VoltageL31, :VoltageL1G, :VoltageL2G, :VoltageL3G, :ModifiedDate, :EmailedToPlants, :EmailedToPdM, :DeltaTinF, :ReportForReferenceOnly)
    end
end
