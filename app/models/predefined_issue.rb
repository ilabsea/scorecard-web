# frozen_string_literal: true

# == Schema Information
#
# Table name: predefined_issues
#
#  id             :bigint           not null, primary key
#  scorecard_uuid :string
#  content        :text
#  audio          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class PredefinedIssue < ApplicationRecord
  belongs_to :issue_category
end