class User < ActiveRecord::Base
	has_many :orders
  has_many :meals, through: :orders

  validates :uid, :provider, presence: true
  
	def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.save!
    user
	end
end
