class User < ActiveRecord::Base
  attr_writer :authenticate_with_credentials

  has_secure_password
  has_many :orders
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, :case_sensitive => false
  validates :password, presence: true, confirmation: true, length: { minimum: 4 }


  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
    self.nick = self.nick.strip unless self.nick.nil?
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
