# frozen_string_literal: true

# == Schema Information
#
# Table name: cafs
#
#  id                        :bigint           not null, primary key
#  name                      :string
#  sex                       :string
#  date_of_birth             :string
#  tel                       :string
#  address                   :string
#  local_ngo_id              :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  actived                   :boolean          default(TRUE)
#  educational_background_id :string
#  scorecard_knowledge_id    :string
#
require "rails_helper"

RSpec.describe Caf, type: :model do
  it { is_expected.to belong_to(:local_ngo) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_inclusion_of(:sex).in_array(%w(female male other)).allow_nil }

  describe "soft delete" do
    let(:caf) { create(:caf) }

    context "with scorecards" do
      it "is soft delete" do
        expect { caf.destroy }.to change { Caf.only_deleted.count }.by 1
      end
    end
  end
end
