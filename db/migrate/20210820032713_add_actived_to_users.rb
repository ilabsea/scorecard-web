# frozen_string_literal: true

class AddActivedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :actived, :boolean, default: true
  end
end
