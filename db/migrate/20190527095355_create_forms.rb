class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :title, null: false
      t.text :description
      t.boolean :is_active 
      t.timestamps
    end
  end
end
