class FormElement < ApplicationRecord
  belongs_to :form

  # since select is reserved keywork in rails, replace select with select_box
  enum component_type: %w(textfield email datetime phoneNumber radio select_box checkbox button)

  # enum mode: %w(F2F Telephonic Online(skype/hangout) Other)
end
