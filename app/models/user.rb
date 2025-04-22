# == Schema Information
#
# Table name: users
#
# id                     :bigint           not null, primary key
# email                  :string           default(""), not null
# encrypted_password     :string           default(""), not null
# reset_password_token   :string
# reset_password_sent_at :datetime
# remember_created_at    :datetime
# created_at             :datetime         not null
# updated_at             :datetime         not null
# role                   :string           default("user"), not null
#

class User < ApplicationRecord
  # Include default Devise modules for authentication.
  # Available modules: :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum for user roles
  # Defines roles as 'user' and 'admin'
  enum role: { user: 'user', admin: 'admin' }

  has_many :articles

  # Check if the user is an admin
  def admin?
    role == 'admin'
  end
end
