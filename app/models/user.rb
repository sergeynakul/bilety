class User < ActiveRecord::Base
	before_save { email.downcase! } # { self.email = email.downcase }
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 111 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum: 6 }

    # Возвращает дайджест для указанной строки.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? 
           BCrypt::Engine::MIN_COST :
           BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
