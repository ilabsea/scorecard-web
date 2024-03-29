# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :code
      t.string :name_en
      t.string :name_km
      t.string :hierarchy

      t.timestamps
    end
  end
end
