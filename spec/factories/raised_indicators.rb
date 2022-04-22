# frozen_string_literal: true

# == Schema Information
#
# Table name: raised_indicators
#
#  id                    :bigint           not null, primary key
#  indicatorable_id      :integer
#  indicatorable_type    :string
#  scorecard_uuid        :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  tag_id                :integer
#  participant_uuid      :string
#  selected              :boolean          default(FALSE)
#  voting_indicator_uuid :string
#  indicator_uuid        :string
#
FactoryBot.define do
  factory :raised_indicator do
    tag
    indicatorable { create(:indicator) }
  end
end
