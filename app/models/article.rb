# == Schema Information
#
# Table name: articles
#
# id             :bigint           not null, primary key
# title          :string           not null
# article_type   :integer          not null
# category_id    :bigint           not null
# author_id      :bigint           not null
# publish_date   :datetime         not null
# created_at     :datetime         not null
# updated_at     :datetime         not null
#

class Article < ApplicationRecord
  # Associations
  belongs_to :category
  belongs_to :author
  has_and_belongs_to_many :tags

  # Enum for article types
  enum article_type: { text: 0, audio: 1, video: 2 }

  # Validations
  validates :title, :article_type, :category_id, :author_id, :publish_date, presence: true
end
