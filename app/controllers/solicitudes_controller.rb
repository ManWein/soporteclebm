class SolicitudesController < ApplicationController
  before_filter :authenticate_user!

  #index #create #new #edit #show #update #update #destroy 

  def index
    @solicitudes = Solicitud.all
  end

  def create
  end

  def new
  end
  
  def edit
  end
  
  def show
  end

  def update
  end

  def destroy
  end

  private

end
