class SolicitudsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_solicitud, only: [:show, :edit, :update, :destroy]
  before_filter :all_solicituds, only: [:index, :analysts_solicitud]

  #index #create #new #edit #show #update #update #destroy 

  def index
    #@solicituds = Solicitud.all
  end

  def create
    @solicitud = Solicitud.new(params_solicitud)
    if @solicitud.save!
      if current_user.manager?
        redirect_to solicituds_path, notice: 'Solicitud created successfully'
      elsif current_user.applicant?
        redirect_to applicant_solicituds_path(current_user.blank? ? 0 : current_user), notice: 'Solicitud created successfully'
      elsif current_user.analyst?
        redirect_to analyst_solicituds_path(current_user.blank? ? 0 : current_user), notice: 'Solicitud created successfully'  
      end

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

  def analysts_solicitud
  end

  def analysts_solicitud_new
  end

  def analysts_solicitud_create
    @analyst = AnalystSolicitud.new(params_analyst_solicitud)
    if @analyst.save!
      redirect_to analysts_solicitud_path, notice: 'Analyst Associated successfully'
    else
      render :new
    end
  end

  def analysts_solicitud_delete
    @ana_sol = AnalystSolicitud.where(analyst_id: params[:user_id], solicitud_id: params[:solicitud_id]).first
    unless @ana_sol.blank?
      @ana_sol.destroy
    end
    redirect_to analysts_solicitud_path
  end

  private

    def find_solicitud
      @solicitud = Solicitud.find_by_id(params[:id])
    end

    def all_solicituds
      if current_user.manager? 
        @solicituds = Solicitud.all
      elsif current_user.applicant?
        @solicituds = Solicitud.where(applicant_id: params[:applicant_id])
      elsif current_user.analyst?
        @solicituds = Analyst.find_by_id(params[:analyst_id]).solicituds
        #Analyst.find(3).solicituds
      end
    end

    def params_solicitud
      params.require(:solicitud).permit(Solicitud.permited_params)
    end

    def params_analyst_solicitud
      params.permit(:analyst_id, :solicitud_id)
    end

end
