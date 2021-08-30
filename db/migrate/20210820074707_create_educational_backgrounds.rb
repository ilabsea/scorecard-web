# frozen_string_literal: true

class CreateEducationalBackgrounds < ActiveRecord::Migration[6.0]
  def change
    create_table :educational_backgrounds, id: :uuid do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
