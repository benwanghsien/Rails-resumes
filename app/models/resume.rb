# frozen_string_literal: true

class Resume < ApplicationRecord
  acts_as_paranoid
  include Slugable

  has_one_attached :mugshot
  has_many_attached :attachments

  # validations
  validates :title, presence: true
  validates :content, presence: true

  # scope
  scope :published, -> { where(status: 'published') }
  scope :draft, -> { where(status: 'draft') }

  # callbacks
  before_create :set_as_default

  # relationships
  belongs_to :user
  has_many :vender_favorited_resumes
  has_many :be_favorited, through: :vender_favorited_resumes, source: :user
  has_many :comments

  def self.all_status
    [
      %w[草稿 draft],
      %w[發佈 published]
    ]
  end

  # ref: https://stackoverflow.com/questions/34707159/how-to-make-case-sensitive-urls-with-rails-friendly-id
  def normalize_friendly_id(value)
    value.to_s.parameterize(preserve_case: true)
  end

  private

  def set_as_default
    self.pinned = true if user.resumes.count.zero?
  end
end
