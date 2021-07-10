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
require 'rails_helper'

RSpec.describe Author, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
