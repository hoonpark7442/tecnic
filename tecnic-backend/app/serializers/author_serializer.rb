# == Schema Information
#
# Table name: authors
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  author_type :integer          default("individual")
#  blog        :string(255)
#  rss         :string(255)      not null
#  description :string(255)
#  github      :string(255)
#  facebook    :string(255)
#  linkedin    :string(255)
#  twitter     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :author_type, :blog, :description, :github, :facebook, :linkedin, :twitter

  has_many :posts do 
    include_data(false)
    link(:related) { author_posts_path(author_id: object.id) }
  end
end
