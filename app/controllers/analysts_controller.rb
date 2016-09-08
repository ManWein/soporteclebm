class AnalystsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_analyst, only: [:show, :edit, :update, :destroy]
  before_filter :all_analysts, only: [:index]

  def index
  end

  def create
    @analyst = Analyst.new(params_analyst)
    if @analyst.save!
      redirect_to analysts_path, notice: 'Analyst created successfully'
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
    @analyst.destroy
    redirect_to analysts_path
  end

  private
    def find_analyst
      @analyst = Analyst.find_by_id(params[:id])
    end

    def all_analysts
      @analysts = Analyst.all
    end

    def params_analyst
      params.require(:analyst).permit(Analyst.permited_params)
    end

end
