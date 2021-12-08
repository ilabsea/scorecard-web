# frozen_string_literal: true

module Scorecards::Filter
  extend ActiveSupport::Concern

  included do
    def self.filter(params = {})
      scope = all
      scope = scope.where("uuid LIKE ?", "%#{params[:uuid].downcase}%") if params[:uuid].present?
      scope = scope.where("conducted_date BETWEEN ? AND ?", params[:start_date], params[:end_date]) if params[:start_date].present? && params[:end_date].present?
      scope = scope.where(facility_id: params[:facility_id]) if params[:facility_id].present?
      scope = scope.where(local_ngo_id: params[:local_ngo_id]) if params[:local_ngo_id].present?
      scope = scope.where(province_id: params[:province_id]) if params[:province_id].present?
      scope = scope.where(year: params[:year].to_i) if params[:year].present?
      scope = scope.where(scorecard_type: params[:scorecard_type]) if params[:scorecard_type].present?
      scope = scope.where(locked_at: nil) if params[:filter] == "planned"
      scope = scope.where.not(locked_at: nil) if params[:filter] == "locked"
      scope
    end
  end
end
