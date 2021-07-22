class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :post_date, :tags

  belongs_to :author
  
  def tags
    object.tags.map{|tag| tag.name}
  end
  
end
