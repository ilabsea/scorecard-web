# frozen_string_literal: true

namespace :voting_indicator do
  desc "migrate display_order"
  task migrate_display_order: :environment do
    scorecards = Scorecard.completeds.includes(:voting_indicators)
    scorecards.find_each do |scorecard|
      scorecard.voting_indicators.each_with_index do |indi, index|
        indi.update_column(:display_order, index + 1)
      end
    end
  end

  desc "migrate reference for raised indicator and voting indicator"
  task migrate_reference_with_raised_indicator: :environment do
    scorecards = Scorecard.with_deleted.completeds.includes(:voting_indicators, :raised_indicators)
    scorecards.find_each do |scorecard|
      update_selected_indicator(scorecard)
    end
  end
end

private
  def update_selected_indicator(scorecard)
    scorecard.voting_indicators.each do |vi|
      ri = scorecard.raised_indicators.select { |ri| ri.indicatorable_id == vi.indicatorable_id && ri.indicatorable_type == vi.indicatorable_type }.first
      ri.update_column(:selected, true)
      vi.update_column(:raised_indicator_id, ri.id)
    end
  end
