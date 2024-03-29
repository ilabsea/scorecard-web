# frozen_string_literal: true

module Scorecards::Filter
  extend ActiveSupport::Concern

  included do
    def self.filter(params = {})
      scope = all
      scope = scope.where("uuid LIKE ?", "%#{params[:uuid].downcase}%") if params[:uuid].present?
      scope = scope.where("planned_start_date BETWEEN ? AND ?", params[:start_date], params[:end_date]) if params[:start_date].present? && params[:end_date].present?
      scope = scope.where(facility_id: params[:facility_ids]) if params[:facility_ids].present?
      scope = scope.where(local_ngo_id: params[:local_ngo_ids]) if params[:local_ngo_ids].present?
      scope = scope.where(province_id: params[:province_ids]) if params[:province_ids].present?
      scope = scope.where(year: params[:years]) if params[:years].present?
      scope = scope.where(scorecard_type: params[:scorecard_type]) if params[:scorecard_type].present?
      scope = scope.where(progress: planned_statuses) if params[:filter] == "planned"
      scope = scope.where(progress: params[:filter]) if params[:filter].present? && params[:filter] != "planned"
      scope = scope.where(scorecard_batch_code: params[:batch_code]) if params[:batch_code].present?
      scope
    end

    def self.planned_statuses
      [nil, "renewed", "downloaded"]
    end
  end
end
