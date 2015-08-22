class Micropost < ActiveRecord::Base
  #config
  paginates_per 10

  #relation to users table
  belongs_to :user

  #relation to retweet_relations table
  has_many :retweeted_relationships, :class_name => "RetweetRelationship", :foreign_key => "origin_id", :dependent => :destroy
  has_many :retweeted_microposts, :through => :retweeted_relationships, :source => :retweet, :dependent => :destroy
  has_many :retweeted_users, :through => :retweeted_microposts, :source => :user
  has_one :origin_relationship, :class_name => "RetweetRelationship", :foreign_key => "retweet_id", :dependent => :destroy
  has_one :origin_tweet, :through => :origin_relationship, :source => :origin
  def retweet(origin_id)
    RetweetRelationship.create(:retweet_id => id, :origin_id => origin_id)
  end
  def has_origin? 
    return !origin_tweet.nil?
  end

  #relation to reply_relations table
  has_many :replied_relationships, :class_name => "ReplyRelationship", :foreign_key => "origin_id", :dependent => :destroy
  has_many :replied_microposts, :through => :replied_relationships, :source => :reply, :dependent => :destroy
  has_one :reply_origin_relationship, :class_name => "ReplyRelationship", :foreign_key => "reply_id", :dependent => :destroy
  has_one :reply_origin_tweet, :through => :reply_origin_relationship, :source => :origin

  def reply(origin_id)
    ReplyRelationship.create(:reply_id => id, :origin_id => origin_id)
  end

  def has_reply_origin? 
    return !reply_origin_tweet.nil?
  end

  #relation to favorite_relationships table
  has_many :favorite_relationships, :dependent => :destroy
  has_many :favorite_users, :through => :favorite_relationships, :source => :user

  def add_favorite(user_id)
    favorite_relationships.create(:user_id => user_id) 
  end

  #validation
  validates :user_id, :presence => true
  validates :content, :presence => true, :length => { :maximum => 140 }, :unless => "micropost_type == 'retweet'"
  validates :content, :length => { :maximum => 100 }, :if => "micropost_type == 'retweet'"
end
