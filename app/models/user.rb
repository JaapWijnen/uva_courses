class User < ActiveRecord::Base
  
  has_many :list_items
  has_many :courses, through: :list_items

  # save email in downcase
  before_save { email.downcase! }
  # when creating new user also make new session
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  # ensure valid email format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
  					format: { with: VALID_EMAIL_REGEX },
  				 	uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end

  private

  	def create_remember_token
  		self.remember_token = User.encrypt(User.new_remember_token)
  	end
end
