class CreateVenderFavoritedResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :vender_favorited_resumes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :resume, null: false, foreign_key: true

      t.timestamps
    end
  end
end
