class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :author_type, :blog, :description, :github, :facebook, :linkedin, :twitter

  has_many :posts do 
    include_data(false)
    link(:related) { author_posts_path(author_id: object.id) }
  end
end
