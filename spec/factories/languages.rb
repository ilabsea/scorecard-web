# frozen_string_literal: true

# == Schema Information
#
# Table name: languages
#
#  id         :bigint           not null, primary key
#  code       :string
#  name_en    :string
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name_km    :string
#  deleted_at :datetime
#
FactoryBot.define do
  factory :language do
    code     { FFaker::Locale.code }
    name_en  { FFaker::Locale.language }
    name_km  { name_en }
    program
  end
end
