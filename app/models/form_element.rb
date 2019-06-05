class FormElement < ApplicationRecord
  belongs_to :form

  # since select is reserved keywork in rails, replace select with select_box
  enum component_type: %w(textfield email datetime phoneNumber radio select_box checkbox button)
  enum validation: %w(required non-required maxDate minDate maxLength minLength)
end
