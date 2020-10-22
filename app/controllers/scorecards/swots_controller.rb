# frozen_string_literal: true

module Scorecards
  class SwotsController < ApplicationController
    def index
      @scorecard = Scorecard.find(params[:scorecard_id])
      @voting_indicators = @scorecard.voting_indicators.order(median: :DESC)
    end
  end
end