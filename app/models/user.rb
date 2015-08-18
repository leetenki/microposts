class User < ActiveRecord::Base
	has_many :microposts
	before_save { self.email = email.downcase }

	validates :name, :presence => true, :length => { :maximum => 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, 
			  :presence => true, 
			  :length => { :maximum => 255 }, 
			  :format => { :with => VALID_EMAIL_REGEX },
			  :uniqueness => { :case_sensitive => false }
	validates :country_code, :presence => true, :inclusion => { :in => Carmen::Country.all.map(&:code) }
	validate :check_state_code
	has_secure_password


	private
	def check_state_code
		if country_code.in? Carmen::Country.all.map(&:code)
			subregions = Carmen::Country.coded(country_code).subregions.map(&:code)
			if subregions.empty?
				if state_code.length > 60
					errors.add(:state_code, 'is too long!')
				end
			elsif (state_code.in? subregions)
			else
				errors.add(:state_code, 'is incorrect value!')
			end
		end
	end
end
