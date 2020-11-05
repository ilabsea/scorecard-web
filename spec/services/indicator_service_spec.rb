# frozen_string_literal: true

require "rails_helper"

RSpec.describe IndicatorService do
  describe "#clone_from_template" do
     let!(:program)  { create(:program) }
     let(:facility)  { create(:facility, program: program) }
     let(:template)  { create(:template, :with_indicators, program: program) }
     let(:service)   { IndicatorService.new(facility.id) }
     let(:indicators) { facility.indicators }

     before {
       service.clone_from_template(template.id)
     }

     it { expect(indicators.length).to eq(template.indicators.length) }
     it { expect(indicators.first.tag).to eq(template.indicators.first.tag) }
     it { expect(indicators.first.languages_indicators.length).to eq(template.indicators.first.languages_indicators.length) }
   end

  describe "#clone_to_template" do
    let!(:program)  { create(:program) }
    let(:facility)  { create(:facility, :with_indicators, program: program) }
    let(:service)   { IndicatorService.new(facility.id) }
    let(:template)  { ::Template.first }
    let(:indicators) { template.indicators }

    before {
      service.clone_to_template("Base line")
    }

    it { expect(::Template.count).to eq(1) }
    it { expect(::Template.first.name).to eq(template.name) }
    it { expect(indicators.length).to eq(facility.indicators.length) }
    it { expect(indicators.first.tag).to eq(facility.indicators.first.tag) }
    it { expect(indicators.first.languages_indicators.length).to eq(facility.indicators.first.languages_indicators.length) }
  end
end
