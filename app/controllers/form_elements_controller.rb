class FormElementsController < ApplicationController
  before_action :set_form, except: [:preview]
  before_action :set_form_element, only: [:edit, :update, :destroy]

  def index
    @form_element = FormElement.new
    @form_elements = @form.form_elements
    ap prepare_json
    @preview_element = JSON.generate(prepare_json)
  end

  def preview
    @form = Form.find(params[:id])
    @form_elements = @form.form_elements
    @preview_element = JSON.generate(prepare_json)
  end

  def edit
  end

  def update
    if @form_element.update_attributes(prepare_params)
      flash[:success] = "Form element has been successfully created"
      redirect_to form_form_elements_path(@form)
    else
      render "edit"
    end
  end

  def create
    @form_elements = @form.form_elements.new(prepare_params)
    if @form_elements.save
      flash[:success] = "Form element has been successfully created"
      redirect_to form_form_elements_path(@form)
    else
      render "new"
    end
  end

  def destroy
    if @form_element.destroy
      flash[:success] = "Form element has been successfully deleted"
      redirect_to form_form_elements_path(@form)
    end
  end

  private
  def prepare_params
    new_allow_params = form_elements_params

    if(form_elements_params[:component_type] == 'textfield' || form_elements_params[:component_type] == 'email' || form_elements_params[:component_type] == 'phoneNumber' || form_elements_params[:component_type] == 'datetime')
      new_allow_params.delete(:datasets)
      new_allow_params.delete(:values)
    end

    if(form_elements_params[:component_type] == 'radio')
      new_allow_params.delete(:datasets)
      new_allow_params[:datasets] = new_allow_params[:values]
      new_allow_params.delete(:values)
    end


    if(form_elements_params[:component_type] == 'select')
      new_allow_params.delete(:values)
    end


    # if(form_elements_params.has_key?(:component_type))
      # ap form_elements_params
      # new_allow_params[:component_type] = replace_component_type(new_allow_params[:component_type])
      # new_allow_params.delete(:component_type)
    # end

    if(form_elements_params.has_key?(:field_validation))
      # new_allow_params[:type] = replace_component_type(new_allow_params[:component_type])

      new_allow_params[:field_validation][:required] = !new_allow_params[:field_validation][:required].blank?
      new_allow_params[:field_validation][:minLength] = new_allow_params[:field_validation][:minLength].to_i unless new_allow_params[:field_validation][:minLength].blank?
      new_allow_params[:field_validation][:maxLength] = new_allow_params[:field_validation][:maxLength].to_i unless new_allow_params[:field_validation][:maxLength].blank?
      new_allow_params[:field_validation][:maxDate] = Date.parse(new_allow_params[:field_validation][:maxDate]).strftime('%Y-%m-%d') unless new_allow_params[:field_validation][:maxDate].blank?
      new_allow_params[:field_validation][:minDate] = Date.parse(new_allow_params[:field_validation][:minDate]).strftime('%Y-%m-%d') unless new_allow_params[:field_validation][:minDate].blank?
    end

    return new_allow_params
  end

  def replace_component_type(type)
    case type
    when 'select_box'
      return 'select'
    else
      return type
    end
  end

  def prepare_json
    permit_jsons = []
    @form_elements.each do |el|
      new_hsh = {}
      el.attributes.each do |k, v|
        new_hsh[k.to_sym] = v if permit_keys.include? k.to_sym
        new_hsh[:validate] = v  if k == 'field_validation'



        new_hsh[:placeholder] = new_hsh[:field_placeholder]
        new_hsh[:type] = new_hsh[:component_type]

        # if(new_hsh[:type] == 'select_box')
        new_hsh[:type] = 'select' if new_hsh[:type] == 'select_box'
        # end
        if(new_hsh[:type] == 'select')
          new_hsh[:data] = v if k == 'datasets'
        end

        if(new_hsh[:type] == 'radio')
          new_hsh[:values] = v if k == 'datasets'
        end


        if(new_hsh[:type] == 'datetime')
          new_hsh[:format] = 'dd-MM-yyyy'
          new_hsh[:datePicker] = v  if k == 'field_validation'
        end
        new_hsh[:format] = '(999) 999-9999' if new_hsh[:type] == 'phoneNumber'
      end
      permit_jsons << new_hsh
    end

    permit_jsons << {type: 'button',action: 'submit',label: 'Submit',theme: 'primary'}

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
    [
      :type,
      :key, :label, :field_placeholder, :tooltip, :description, :component_type, :format,
      :field_validation => [:required, :maxLength, :minLength, :maxDate, :minDate],
      :date_validation => [:maxDate, :minDate],
      :datasets => [:values => [:label, :value]],
      :values => [:label, :value]
    ]
  end
end
