class MiceController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_mouse, only: [:show, :edit, :update, :destroy]
  before_filter :all_mice, only: [:index]

  def index
  end
  
  def create
    @mouse = Mouse.new(params_mouse)
    if @mouse.save!
      redirect_to mice_path, notice: 'Mouse created successfully'
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
    @mouse.destroy
    redirect_to mice_path
  end
  
  private
    def find_mouse
      @mouse = Mouse.find_by_id(params[:id])
    end

    def all_mice
      @mice = Mouse.all
    end

    def params_mouse
      params.require(:mouse).permit(Mouse.permited_params)
    end

end
