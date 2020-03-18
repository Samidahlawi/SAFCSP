class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /groups/group_id/reports/report_id/documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])
    @group_id = params[:group_id]
    @report_id = params[:report_id]
  end

  # GET /groups/group_id/reports/report_id/documents/new
  def new
    @document = Document.new
    @group_id = params[:group_id]
    @report_id = params[:report_id]
  end

  # GET /groups/group_id/reports/report_id/documents/:id/edit
  def edit
    @document = Document.find(params[:id])
    @group_id = params[:group_id]
    @report_id = params[:report_id]
  end

  # POST /groups/group_id/reports/report_id/documents
  # POST /documents.json
  def create
    report_id = params[:report_id]
    group_id = params[:group_id]
    @document = Document.new(document_params)
    @document.report_id = report_id 

    respond_to do |format|
      if @document.save
        format.html { redirect_to group_report_path(group_id,report_id) , notice: 'Document was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /groups/group_id/report/report_id/documents/:id
  # PATCH/PUT /documents/1.json
  def update
    group_id = params[:group_id]
    report_id= params[:report_id]
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to group_report_path(group_id,report_id), notice: 'Document was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /groups/group_id/reports/report_id/documents/1
  # DELETE /documents/1.json
  def destroy
    group_id = params[:group_id]
    report_id = params[:report_id]
    @document.destroy
    respond_to do |format|
      format.html { redirect_to group_report_path(group_id,report_id), notice: 'Document was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:title, :content)
    end
end
