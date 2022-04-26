class AddDeletedAtToResume < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :deleted_at, :datetime, default: nil
  end
end
