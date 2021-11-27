# == Schema Information
#
# Table name: read_marks
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  post_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ReadMark < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :post_id

  belongs_to :user
  belongs_to :post
end
