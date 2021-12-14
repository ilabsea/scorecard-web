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
class RaisedIndicator < ApplicationRecord
  include Tagable

  belongs_to :scorecard, foreign_key: :scorecard_uuid, optional: true
  belongs_to :indicatorable, polymorphic: true
  belongs_to :tag, optional: true
  has_many   :voting_indicators
end
