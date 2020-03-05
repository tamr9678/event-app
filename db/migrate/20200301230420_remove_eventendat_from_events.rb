class RemoveEventendatFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_end_at, :datetime
  end
end
