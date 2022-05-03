module Slugable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :random_slug, use: :slugged
  end

  private

  def random_slug
    [*'A'..'Z', *'a'..'z', *'0'..'9'].sample(10).join
  end
end