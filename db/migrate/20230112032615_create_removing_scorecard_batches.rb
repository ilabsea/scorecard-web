# frozen_string_literal: true

class CreateRemovingScorecardBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :removing_scorecard_batches, id: :uuid do |t|
      t.string  :code
      t.integer :total_count, default: 0
      t.integer :valid_count, default: 0
      t.string  :reference
      t.integer :user_id
      t.integer :program_id

      t.timestamps
    end
  end
end
