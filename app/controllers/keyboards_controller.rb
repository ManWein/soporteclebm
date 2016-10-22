class KeyboardsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_keyboard, only: [:show, :edit, :update, :destroy]
  before_filter :all_keyboards, only: [:index]

  def index
  end
  
  def create
    @keyboard = Keyboard.new(params_keyboard)
    if @keyboard.save!
      redirect_to keyboards_path, notice: 'Keyboard created successfully'
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
    if @keyboard.update_attributes!(params_keyboard)
      redirect_to keyboards_path, notice: 'Keyboard updated successfully'
    else
      flash[:notice] = "Some of the fields placed errors. Please check information and try again"
      render :edit
    end
  end
  
  def destroy
    @keyboard.destroy
    redirect_to keyboards_path
  end
  
  private
    def find_keyboard
      @keyboard = Keyboard.find_by_id(params[:id])
    end

    def all_keyboards
      @keyboards = Keyboard.all
    end

    def params_keyboard
      params.require(:keyboard).permit(Keyboard.permited_params)
    end

end
