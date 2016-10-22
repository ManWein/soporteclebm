class CpusController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_cpu, only: [:show, :edit, :update, :destroy]
  before_filter :all_cpus, only: [:index, :cpu_user]

  def index
  end
  
  def create
    @cpu = Computer.new(params_cpu)
    if @cpu.save!
      redirect_to cpus_path, notice: 'CPU created successfully'
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
    if @cpu.update_attributes!(params_cpu)
      redirect_to cpus_path, notice: 'CPU updated successfully'
    else
      flash[:notice] = "Some of the fields placed errors. Please check information and try again"
      render :edit
    end
  end
  
  def destroy
    @cpu.destroy
    redirect_to cpus_path
  end
  
  def cpu_user
  end

  def cpu_user_new
  end

  def cpu_user_create
    @cpu = ApplicantComputer.new(params_cpu_user)
    if @cpu.save!
      redirect_to cpu_user_path, notice: 'CPU assigned successfully'
    else
      render :new
    end
  end

  def cpu_user_delete
    @app_cpu = ApplicantComputer.where(applicant_id: params[:user_id], computer_id: params[:cpu_id]).first
    unless @app_cpu.blank?
      @app_cpu.destroy
    end
    redirect_to cpu_user_path
  end
  
  private
    def find_cpu
      @cpu = Computer.find_by_id(params[:id])
    end

    def all_cpus
      @cpus = Computer.all
    end

    def params_cpu
      params.require(:computer).permit(Computer.permited_params)
    end

    def params_cpu_user
      params.permit(:applicant_id, :computer_id)
    end
end
