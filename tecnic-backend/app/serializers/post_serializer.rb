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
class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :post_date, :favorites_count, :tags

  belongs_to :author
  
  def tags
    object.tags.map{|tag| tag.name}
  end

  
end
