# frozen_string_literal: true

module Api
  module V1
    class ScorecardProgressesController < ApiController
      def create
        @scorecard_progress = ScorecardProgress.new(scorecard_progress_params)

        if @scorecard_progress.save
          head :ok
        else
          render json: { errors: @scorecard_progress.errors }, status: :unprocessable_entity
        end
      end

      private
        def scorecard_progress_params
          params.require(:scorecard_progress).permit(
            :scorecard_uuid, :status, :device_id, :device_type
          ).merge(user_id: current_user.id)
        end
    end
  end
end
