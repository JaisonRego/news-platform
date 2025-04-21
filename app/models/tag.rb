# == Schema Information
#
# Table name: tags
#
# id         :bigint           not null, primary key
# name       :string           not null
# created_at :datetime         not null
# updated_at :datetime         not null
#

class Tag < ApplicationRecord
  # Associations
  # A tag can be associated with many articles, and an article can have many tags.
  has_and_belongs_to_many :articles
end
