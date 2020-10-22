# frozen_string_literal: true

require_relative "user"
require_relative "program"
require_relative "category"
require_relative "indicator"
require_relative "local_ngo"
require_relative "caf"
require_relative "scorecard_type"
require_relative "scorecard"
require_relative "raised_indicator"
require_relative "voting_indicator"
require_relative "rating"

module Sample
  class CscWeb
    def self.load_samples
      ::Sample::Program.load
      ::Sample::User.load
      ::Sample::Category.load
      ::Sample::Indicator.load
      ::Sample::LocalNgo.load
      ::Sample::Caf.load
      ::Sample::ScorecardType.load
      ::Sample::Scorecard.load
      ::Sample::RaisedIndicator.load
      ::Sample::VotingIndicator.load
      ::Sample::Rating.load
      # ::Sample::RaisedPerson.load
    end
  end
end
