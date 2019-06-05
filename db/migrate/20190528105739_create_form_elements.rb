class CreateFormElements < ActiveRecord::Migration[5.2]
  def change
    create_table :form_elements do |t|
      t.integer :form_id, null: false
      t.string  :key, null: false
      t.string  :label
      t.string  :field_placeholder
      t.string  :tooltip
      t.string  :description, length: 512

      t.string :component_type
      t.json    :format
      t.json    :field_validation
      t.json    :datasets

      t.timestamps
    end
  end
end
