# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable

  has_many :subscriptions
  has_many :authors, through: :subscriptions

  has_many :read_marks
  has_many :posts, through: :read_marks

  has_many :favorites, dependent: :destroy

  has_many :drawers, dependent: :destroy

  def favorite(post)
    favorites.find_or_create_by(post: post)
  end

  def unfavorite(post)
    favorites.where(post: post).destroy_all

    post.reload
  end

  def favorited?(post)
    favorites.find_by(post_id: post.id).present?
  end

  def read_later(post)
    drawers.find_or_create_by(post: post)
  end

  def remove_from_drawer(post)
    drawers.where(post: post).destroy_all

    post.reload
  end

  def keep_in_drawer?(post)
    drawers.find_by(post_id: post.id).present?
  end
end
