class SolicitudsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_solicitud, only: [:show, :edit, :update, :destroy]
  before_filter :all_solicituds, only: [:index, :analyst_solicitud]

  #index #create #new #edit #show #update #update #destroy 

  def index
    @solicituds = Solicitud.all
  end

  def create
    @solicitud = Solicitud.new(params_solicitud)
    if @solicitud.save!
      redirect_to solicituds_path, notice: 'Solicitud created successfully'
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
  end

  def destroy
    @solicitud.destroy
    redirect_to solicituds_path
  end

  def analyst_solicitud
  end

  def analyst_solicitud_new
  end

  def analyst_solicitud_create
    @analyst = AnalystSolicitud.new(params_analyst_solicitud)
    if @analyst.save!
      redirect_to analyst_solicitud_path, notice: 'Analyst Associated successfully'
    else
      render :new
    end
  end

  def analyst_solicitud_delete
    @ana_sol = AnalystSolicitud.where(analyst_id: params[:user_id], solicitud_id: params[:solicitud_id]).first
    unless @ana_sol.blank?
      @ana_sol.destroy
    end
    redirect_to analyst_solicitud_path
  end

  private

    def find_solicitud
      @solicitud = Solicitud.find_by_id(params[:id])
    end

    def all_solicituds
      @solicituds = Solicitud.all
    end

    def params_solicitud
      params.require(:solicitud).permit(Solicitud.permited_params)
    end

    def params_analyst_solicitud
      params.permit(:analyst_id, :solicitud_id)
    end

end
