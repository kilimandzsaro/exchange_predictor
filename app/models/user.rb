# Users table model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false }
  has_many :exchange_settings
end
