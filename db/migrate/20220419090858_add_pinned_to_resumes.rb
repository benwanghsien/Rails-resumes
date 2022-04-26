# frozen_string_literal: true

class AddPinnedToResumes < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :pinned, :boolean, default: false
  end
end
