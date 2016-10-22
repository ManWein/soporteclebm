class RegulatorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_regulator, only: [:show, :edit, :update, :destroy]
  before_filter :all_regulators, only: [:index]

  def index
  end
  
  def create
    @regulator = Regulator.new(params_regulator)
    if @regulator.save!
      redirect_to regulators_path, notice: 'Regulator created successfully'
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
    if @regulator.update_attributes!(params_regulator)
      redirect_to regulators_path, notice: 'Regulator updated successfully'
    else
      flash[:notice] = "Some of the fields placed errors. Please check information and try again"
      render :edit
    end
  end
  
  def destroy
    @regulator.destroy
    redirect_to regulators_path
  end

  private
    def find_regulator
      @regulator = Regulator.find_by_id(params[:id])
    end

    def all_regulators
      @regulators = Regulator.all
    end

    def params_regulator
      params.require(:regulator).permit(Regulator.permited_params)
    end
  

end
