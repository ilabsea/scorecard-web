# frozen_string_literal: true

# == Schema Information
#
# Table name: programs
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Program < ApplicationRecord
  has_many :users
  has_many :languages
  has_many :categories
  has_many :cafs
  has_many :scorecards

  validates :name, presence: true

  after_create :create_default_language

  private
    def create_default_language
      languages.create(code: "km", name: "Khmer")
    end
end
