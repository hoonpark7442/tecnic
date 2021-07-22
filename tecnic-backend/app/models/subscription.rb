class Subscription < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :author_id

  belongs_to :user
  belongs_to :author
end
