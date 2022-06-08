class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, length: { in: 2..10 }

  def self.authenticate_with_credentials(email, password)
    emailFormatted = email.strip.downcase
    user = User.find_by_email(emailFormatted)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
