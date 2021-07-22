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
class Author < ApplicationRecord
	enum author_type: { individual: 1, community: 2 }

	has_many :posts

	has_many :subscriptions
	has_many :subscribers, through: :subscriptions, source: :user
end
