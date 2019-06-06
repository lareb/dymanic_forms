class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:create]
  before_action :unsafe_params, only: [:create]

  def params
    @_params || super
  end

  def index
  end

  def submit_form
  end

  def create
    puts "============================="
    # ap params[:data]
    # ap params[:metadata]
    data = unsafe_params[:data]
    data[:message] = 'Data has been saved successfully'
    # render json: data
    respond_to do |format|
      format.json { render json: data }
      format.html {}
    end
  end

  private
  def unsafe_params
    @_params = request.parameters
  end


end
