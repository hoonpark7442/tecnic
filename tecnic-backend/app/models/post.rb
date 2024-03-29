# == Schema Information
#
# Table name: posts
#
#  id              :bigint           not null, primary key
#  author_id       :bigint           not null
#  title           :string(255)      not null
#  link            :string(255)      not null
#  post_date       :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  favorites_count :integer          default(0), not null
#
class Post < ApplicationRecord
  include ReadMarkChecker::Readable::InstanceMethods
  extend ReadMarkChecker::Readable::ClassMethods
  extend ReadMarkChecker::ReadableScopes

  scope :favorited_by, -> (user) {joins(:favorites).where(favorites: {user: User.where(id: user.id)})}

  belongs_to :author
  has_and_belongs_to_many :tags
  
  has_many :read_marks
  has_many :users, through: :read_marks

  has_many :favorites, dependent: :destroy

  has_many :drawers, dependent: :destroy
end
