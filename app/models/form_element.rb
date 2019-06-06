class FormElement < ApplicationRecord
  belongs_to :form

  # since select is reserved keywork in rails, replace select with select_box
  # enum component_type: %w(textfield email datetime phoneNumber radio select checkbox button)
  enum validation: %w(required maxDate minDate maxLength minLength)

  def self.component_types
    %w(textfield email datetime phoneNumber radio select)
  end
end
