class User < ApplicationRecord
  has_secure_password

  def authenticate(password)
    if BCrypt::Password.new(self.password_digest) == password
      self
    else
      false
    end
  end

  # Ensure that email addresses are unique
  validates :email, presence: true, uniqueness: true
end
