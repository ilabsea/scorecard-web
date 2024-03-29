# frozen_string_literal: true

# == Schema Information
#
# Table name: mobile_notifications
#
#  id            :bigint           not null, primary key
#  title         :string
#  body          :text
#  success_count :integer
#  failure_count :integer
#  creator_id    :integer
#  program_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  app_versions  :string           default([]), is an Array
#
class MobileNotification < ApplicationRecord
  validates :body, presence: true
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"

  after_commit :push_notification_async, on: [:create]

  def push_notification_async
    MobileNotificationWorker.perform_async(id)
  end

  def build_content
    { notification: { title: title, body: body } }
  end

  def description
    return nil if success_count.nil?

    I18n.t("mobile_notification.description",
      success_count: success_count,
      failure_count: failure_count
    )
  end
end
