class User < ActiveRecord::Base
  paginates_per 12

  has_many :microposts

  #favorite relationships
  has_many :favorite_relationships, :dependent => :destroy
  has_many :favorite_microposts, :through => :favorite_relationships, :source => :micropost

  has_many :following_relationships, :class_name => "Relationship", :foreign_key => :follower_id, :dependent => :destroy
  has_many :following_users, :through => :following_relationships, :source => :followed
  has_many :follower_relationships, :class_name => "Relationship", :foreign_key => :followed_id, :dependent => :destroy
  has_many :follower_users, :through => :follower_relationships, :source => :follower

  before_save { self.email = email.downcase }

  validates :name, :presence => true, :length => { :maximum => 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
        :presence => true, 
        :length => { :maximum => 255 }, 
        :format => { :with => VALID_EMAIL_REGEX },
        :uniqueness => { :case_sensitive => false }
  validates :country_code, :presence => true, :inclusion => { :in => Carmen::Country.all.map(&:code) }
  validates :profile, :length => { :maximum => 150 }
  validate :check_state_code
  has_secure_password


  #get time line
  def feed_items
    Micropost.where(:user_id => following_user_ids + [self.id])
  end

  #to follow other user
  def follow(other_user)
    following_relationships.create(followed_id: other_user.id)
  end

  #to unfollow other user
  def unfollow(other_user)
    following_relationships.find_by(followed_id: other_user.id).destroy
  end

  #is following
  def following?(other_user)
    following_users.include?(other_user)
  end

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
