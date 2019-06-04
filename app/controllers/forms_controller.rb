class FormsController < ApplicationController
  before_action :set_form, only: [:edit, :update, :destroy]

  def index
    @forms = Form.all
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(forms_params)
    if @form.save
      flash[:success] = "Form has been successfully created"
      redirect_to forms_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @form.update_attributes(forms_params)
      flash[:success] = "Form has been successfully updated"
      redirect_to forms_path
    end
  end

  def destroy
    if @form.destroy
      flash[:success] = "Form has been successfully deleted"
      redirect_to forms_path
    end
  end

  private
  def set_form
    @form = Form.find(params[:id])
  end

  def forms_params
    params.require(:form).permit(:title, :description, :is_active)
  end
end
