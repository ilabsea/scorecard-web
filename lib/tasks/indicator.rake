# frozen_string_literal: true

namespace :indicator do
  desc "migrate uuid"
  task migrate_uuid: :environment do
    Indicator.find_each do |indi|
      indi.secure_uuid
      indi.save
    end
  end

  desc "migrate from custom_indicator"
  task migrate_from_custom_indicator: :environment do
    CustomIndicator.find_each do |ci|
      next if ci.scorecard.nil?

      indi = ci.scorecard.facility.indicators.find_or_initialize_by(uuid: ci.uuid)
      indi.update(
        name: ci.name,
        tag_id: ci.tag_id,
        audio: ci.audio,
        type: "Indicators::CustomIndicator"
      )
    end
  end

  desc "migrate missing custom_indicator"
  task migrate_missing_custom_indicator: :environment do
    miss_custom_indicators = CustomIndicator.where.not(uuid: Indicators::CustomIndicator.pluck(:uuid))
    miss_custom_indicators.each do |ci|
      indi = ci.scorecard.facility.indicators.find_or_initialize_by(uuid: ci.uuid)
      indi.update(
        name: ci.name,
        tag_id: ci.tag_id,
        audio: ci.audio,
        type: "Indicators::CustomIndicator"
      )
    end
  end
end
