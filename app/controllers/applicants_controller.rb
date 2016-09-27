class ApplicantsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_applicant, only: [:show, :edit, :update, :destroy]
  before_filter :all_applicants, only: [:index]

  def index
  end

  def create
    @applicant = Applicant.new(params_applicant)
    if @applicant.save!
      redirect_to applicants_path, notice: 'Applicant created successfully'
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
    @applicant.destroy
    redirect_to applicants_path
  end

  private
    def find_applicant
      @applicant = Applicant.find_by_id(params[:id])
    end

    def all_applicants
      @applicants = Applicant.all
    end

    def params_applicant
      params.require(:applicant).permit(Applicant.permited_params)
    end

end
