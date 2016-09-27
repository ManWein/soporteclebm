class OfficesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_office, only: [:show, :edit, :update, :destroy]
  before_filter :all_offices, only: [:index]

  def index
  end
  
  def create
    @office = Office.new(params_office)
    if @office.save!
      redirect_to offices_path, notice: 'Office created successfully'
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
    @office.destroy
    redirect_to offices_path
  end
  
  private
    def find_offcie
      @office = Office.find_by_id(params[:id])
    end

    def all_offices
      @offices = Offcie.all
    end

    def params_office
      params.require(:office).permit(Offcie.permited_params)
    end

end
