# == Schema Information
#
# Table name: categories
#
# id         :bigint           not null, primary key
# name       :string           not null
# created_at :datetime         not null
# updated_at :datetime         not null
#

class Category < ApplicationRecord
  # Associations
  # A category can have many articles associated with it.
  has_many :articles

  validates :name, presence: true
end
