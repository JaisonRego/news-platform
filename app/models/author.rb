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

  validates :name, presence: true  # == Schema Information
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
    has_many :articles, dependent: :destroy
  
    # Validations
    # Ensures the presence of essential attributes for an author.
    validates :name, presence: true
    validates :description, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    # Instance Methods
  
    # Returns the author's full profile as a string.
    def profile
      "#{name} - #{email}"
    end
  end
  validates :description, presence: true
end
