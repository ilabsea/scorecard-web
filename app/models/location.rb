# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  code          :string           not null, primary key
#  name_en       :string           not null
#  name_km       :string           not null
#  kind          :string           not null
#  parent_id     :string
#  latitude      :float
#  longitude     :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  osm_latitude  :float
#  osm_longitude :float
#
class Location < ApplicationRecord
  validates :code, :name_en, :name_km, :kind, presence: true
  validates_inclusion_of :kind, in: %w[province district commune village], message: "type %{value} is invalid"
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }, allow_blank: true
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, allow_blank: true
  validate  :presence_of_lat_lng

  has_many :children, class_name: "Location", foreign_key: :parent_id
  belongs_to :parent, class_name: "Location", optional: true

  def self.location_kind(code)
    return if code.blank?

    { 2 => "province", 4 => "district", 6 => "commune", 8 => "village" }[code.to_s.length]
  end

  private
    def presence_of_lat_lng
      return unless latitude.present? != longitude.present?

      errors.add(:longitude, "can't be blank") if latitude.present?
      errors.add(:latitude, "can't be blank") if longitude.present?
    end
end
