class Comment < ApplicationRecord
  acts_as_paranoid

  #validatione
  validates :content, presence: true

  # relationship
  belongs_to :user
  belongs_to :resume
end
