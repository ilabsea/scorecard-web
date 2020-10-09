# frozen_string_literal: true

class CreatePredefinedIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :predefined_issues do |t|
      t.text    :content
      t.string  :audio
      t.integer :issue_category_id
      t.string  :tag

      t.timestamps
    end
  end
end