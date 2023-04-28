class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password

  def authenticate(password)
    if BCrypt::Password.new(self.password_digest) == password
      self
    else
      false
    end
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.authenticate(password)
      user
    else
      raise StandardError.new('You must be registered to login.')
    end
  end

  # Ensure that email addresses are unique
  validates :email, presence: true, uniqueness: true
end
