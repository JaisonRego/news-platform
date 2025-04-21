# == Schema Information
#
# Table name: authors
#
# id         :bigint           not null, primary key
# name       :string           not null
# email      :string           not null
# created_at :datetime         not null
# updated_at :datetime         not null
#

class Author < ApplicationRecord
  # Associations
  # An author can write many articles.
  has_many :articles
end
