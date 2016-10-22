class PrintersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_printer, only: [:show, :edit, :update, :destroy]
  before_filter :all_printers, only: [:index]

  def index
  end
  
  def create
    @printer = Printer.new(params_printer)
    if @printer.save!
      redirect_to printers_path, notice: 'printer created successfully'
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
    if @printer.update_attributes!(params_printer)
      redirect_to printers_path, notice: 'Printer updated successfully'
    else
      flash[:notice] = "Some of the fields placed errors. Please check information and try again"
      render :edit
    end
  end
  
  def destroy
    @printer.destroy
    redirect_to printers_path
  end
  
  private
    def find_printer
      @printer = Printer.find_by_id(params[:id])
    end

    def all_printers
      @printers = Printer.all
    end

    def params_printer
      params.require(:printer).permit(Printer.permited_params)
    end

end
