# frozen_string_literal: true

# == Schema Information
#
# Table name: educational_backgrounds
#
#  id         :uuid             not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe EducationalBackground, type: :model do
  it { is_expected.to have_many(:cafs) }
  it { is_expected.to validate_presence_of(:code) }
  it { is_expected.to validate_presence_of(:name) }
end
