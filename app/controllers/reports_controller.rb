class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_report, only: [:show, :edit, :update, :destroy]
  before_filter :all_reports, only: [:index]
  before_filter :find_solicitud, only: [:create, :update]

  #index #create #new #edit #show #update #update #destroy 

  def index
    @reports = Report.all
  end

  def create
    puts ' -'*30
    puts params[:estado_solicitud]
    puts ' -'*30
    @report = Report.new(params_report)
    if @report.save!
      @solicitud.update(estado: params[:estado_solicitud]) unless @solicitud.blank?
      redirect_to reports_path, notice: 'Report created successfully'
    else
      render :new
    end

  end

  def new
  end
  
  def edit
  end
  
  def show
  end

  def update
    if @report.update_attributes!(params_report)
      @solicitud.update(estado: params[:estado_solicitud]) unless @solicitud.blank?
      redirect_to reports_path, notice: 'Reporte updated successfully'
    else
      flash[:notice] = "Some of the fields placed errors. Please check information and try again"
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path
  end

  private

    def find_report
      @report = Report.find_by_id(params[:id])
    end

    def all_reports
      @reports = Report.all
    end

    def params_report
      params.require(:report).permit(Report.permited_params)
    end

    def find_solicitud
      @solicitud = Solicitud.find_by_id(params[:report][:solicitud_id])
    end

end
