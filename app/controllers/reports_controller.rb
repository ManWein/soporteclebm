class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_report, only: [:show, :edit, :update, :destroy]
  before_filter :all_reports, only: [:index]

  #index #create #new #edit #show #update #update #destroy 

  def index
    @reports = Report.all
  end

  def create
    @report = Report.new(params_report)
    if @report.save!
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

end
