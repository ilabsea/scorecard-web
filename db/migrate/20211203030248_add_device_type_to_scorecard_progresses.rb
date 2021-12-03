class AddDeviceTypeToScorecardProgresses < ActiveRecord::Migration[6.1]
  def change
    add_column :scorecard_progresses, :device_type, :string
  end
end
