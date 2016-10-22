class MonitorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_monitor, only: [:show, :edit, :update, :destroy]
  before_filter :all_monitors, only: [:index]

  def index
  end
  
  def create
    @monitor = Screen.new(params_monitor)
    if @monitor.save!
      redirect_to monitors_path, notice: 'Monitor created successfully'
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
    if @monitor.update_attributes!(params_monitor)
      redirect_to monitors_path, notice: 'Monitor updated successfully'
    else
      flash[:notice] = "Some of the fields placed errors. Please check information and try again"
      render :edit
    end
  end
  
  def destroy
    @monitor.destroy
    redirect_to monitors_path
  end
  
  private
    def find_monitor
      @monitor = Screen.find_by_id(params[:id])
    end

    def all_monitors
      @monitors = Screen.all
    end

    def params_monitor
      params.require(:screen).permit(Screen.permited_params)
    end

end
