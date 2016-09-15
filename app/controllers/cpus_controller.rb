class CpusController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_cpu, only: [:show, :edit, :update, :destroy]
  before_filter :all_cpus, only: [:index]

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
  end
  
  def update
  end
  
  def destroy
    @cpu.destroy
    redirect_to cpus_path
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

end
