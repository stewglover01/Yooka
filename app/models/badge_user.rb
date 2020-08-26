class BadgeUser < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  validates :user, uniqueness: { scope: :badge }
end
