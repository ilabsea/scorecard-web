# frozen_string_literal: true

# == Schema Information
#
# Table name: voting_indicators
#
#  id                 :bigint           not null, primary key
#  indicatorable_id   :integer
#  indicatorable_type :string
#  scorecard_uuid     :string
#  median             :float
#  strength           :text
#  weakness           :text
#  improvement        :text
#  next_step          :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class VotingIndicator < ApplicationRecord
  belongs_to :scorecard, foreign_key: :scorecard_uuid
  belongs_to :indicatorable, polymorphic: true

  enum median: {
    very_bad: 1,
    bad: 2,
    acceptable: 3,
    good: 4,
    very_good: 5
  }
end
