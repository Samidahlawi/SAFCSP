class AddGroupRefToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :group, null: false, foreign_key: true
  end
end
