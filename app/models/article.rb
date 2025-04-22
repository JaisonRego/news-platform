# == Schema Information
#
# Table name: articles
#
# id             :bigint           not null, primary key
# title          :string           not null
# article_type   :integer          not null
# category_id    :bigint           not null
# author_id      :bigint           not null
# user_id        :bigint           not null
# publish_date   :datetime         not null
# created_at     :datetime         not null
# updated_at     :datetime         not null
#

class Article < ApplicationRecord
  # Associations
  belongs_to :category
  belongs_to :author
  belongs_to :user
  has_and_belongs_to_many :tags
  has_one_attached :article_image

  # Enum for article types
  # Defines the type of the article as one of the following:
  # - text: 0
  # - audio: 1
  # - video: 2
  enum article_type: { text: 0, audio: 1, video: 2 }

  # Validations
  # Ensures the presence of essential attributes for an article
  validates :title, :article_type, :category_id, :author_id, :user_id, :publish_date, presence: true

  # Scopes
  # Fetch articles published in the last N days
  scope :recent, ->(days) { where('publish_date >= ?', days.days.ago) }

  # Instance Methods

  # Returns a formatted publish date
  def formatted_publish_date
    publish_date.strftime('%B %d, %Y')
  end
end
