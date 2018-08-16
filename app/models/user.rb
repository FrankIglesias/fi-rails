class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :first_name, :last_name
  validates :first_name, presence: true
  validates :last_name, presence: true

  before_validation :generate_verification_code, on: :create

  has_many :rent

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end
end
