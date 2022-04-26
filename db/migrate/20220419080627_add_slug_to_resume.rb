# frozen_string_literal: true

class AddSlugToResume < ActiveRecord::Migration[6.1]
  def change
    add_column :resumes, :slug, :string
    add_index :resumes, :slug, unique: true
  end
end
