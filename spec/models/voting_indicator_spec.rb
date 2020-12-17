# frozen_string_literal: true

# == Schema Information
#
# Table name: voting_indicators
#
#  id                 :bigint           not null, primary key
#  indicatorable_id   :integer
#  indicatorable_type :string
#  scorecard_uuid     :string
#  median             :integer
#  strength           :text
#  weakness           :text
#  desired_change     :text
#  suggested_action   :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "rails_helper"

RSpec.describe VotingIndicator, type: :model do
  it { is_expected.to belong_to(:scorecard).optional }
  it { is_expected.to belong_to(:indicatorable) }
end
