class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    report_id = params[:id]
    @report = Report.find(report_id)
    @group_id = params[:group_id]
  end

  # GET /groups/:group_id/reports/new
  def new
    @report = Report.new
    
  end

  # GET /groups/group_id/reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    @report.group_id = params[:group_id]
    respond_to do |format|
      if @report.save
        format.html { redirect_to group_path(@report.group_id), notice: 'Report was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    group_id = params[:group_id]
    report = Report.find(params[:id])
    report.destroy
    redirect_to group_path(group_id), notice: 'Report was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:name)
    end
end
