# frozen_string_literal: true

# == Schema Information
#
# Table name: raised_indicators
#
#  integer_id         :bigint
#  indicatorable_id   :integer
#  indicatorable_type :string
#  scorecard_uuid     :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  tag_id             :integer
#  participant_uuid   :string
#  id                 :uuid             not null, primary key
#  selected           :boolean          default(FALSE)
#
require "rails_helper"

RSpec.describe RaisedIndicator, type: :model do
  it { is_expected.to belong_to(:scorecard).optional }
  it { is_expected.to belong_to(:indicatorable) }
  it { is_expected.to have_many(:voting_indicators) }
end
