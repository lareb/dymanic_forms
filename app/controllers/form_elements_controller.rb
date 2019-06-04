class FormElementsController < ApplicationController
  before_action :set_form
  before_action :set_form_element, only: [:edit, :update, :destroy]

  def index
    @form_element = FormElement.new
    @form_elements = @form.form_elements
    @preview_element = JSON.generate(prepare_json)
  end

  def create
    @form_elements = @form.form_elements.new(form_elements_params)
    if @form_elements.save
      flash[:success] = "Form has been successfully created"
      redirect_to form_form_elements_path(@form)
    else
      render "new"
    end
  end

  private
  def prepare_json
    permit_jsons = []
    ap @form_elements
    @form_elements.each do |el|
      new_hsh = {}
      el.attributes.each do |k, v|
        # k = 'placeholder' if k.to_sym == :field_placeholder
        # k = 'type' if k.to_sym == :component_type
        new_hsh[k.to_sym] = v if permit_keys.include? k.to_sym
        new_hsh[:placeholder] = new_hsh[:field_placeholder]
        new_hsh[:type] = new_hsh[:component_type]
      end
      permit_jsons << new_hsh
    end
    return permit_jsons
  end

  def set_form
    @form = Form.find(params[:form_id])
  end

  def set_form_element
    @form_element = FormElement.find(params[:id])
  end

  def form_elements_params
    params.require(:form_element).permit(permit_keys)
  end

  def permit_keys
    [:key, :label, :field_placeholder, :tooltip, :description, :component_type, :format, :validation, :datasets]
  end
end
