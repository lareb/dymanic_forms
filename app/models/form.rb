class Form < ApplicationRecord
  has_many :form_elements, dependent: :destroy
end
