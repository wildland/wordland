# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#

class ArticleSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :text, :created_at, :updated_at
  has_one :user
end
