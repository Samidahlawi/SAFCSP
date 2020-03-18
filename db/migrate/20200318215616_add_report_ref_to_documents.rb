class AddReportRefToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :report, null: false, foreign_key: true
  end
end
