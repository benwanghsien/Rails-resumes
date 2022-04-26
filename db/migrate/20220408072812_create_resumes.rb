# frozen_string_literal: true

class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.string :title
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
