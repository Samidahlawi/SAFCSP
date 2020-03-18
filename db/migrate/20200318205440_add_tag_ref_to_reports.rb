class AddTagRefToReports < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :tag, null: false, foreign_key: true
  end
end
