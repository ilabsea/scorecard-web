# frozen_string_literal: true

module Sample
  class Rating
    def self.load
      scorecard = ::Scorecard.first
      return if scorecard.nil?

      scorecard.number_of_participant.to_i.times do |i|
        scorecard.voting_indicators.each do |indi|
          scorecard.ratings.create(
            voting_indicator_id: indi.id,
            score: rand(1..5)
          )
        end
      end

      update_voting_indicator_median(scorecard)
    end

    private
      def self.update_voting_indicator_median(scorecard)
        scorecard.voting_indicators.each do |indi|
          ratings = ::Rating.where(voting_indicator_id: indi.id).pluck(:score)
          indi.update(median: ratings.median.ceil)
        end
      end
  end
end
