class RetweetRelationship < ActiveRecord::Base
  belongs_to :origin, :class_name => "Micropost"
  belongs_to :retweet, :class_name => "Micropost", :dependent => :destroy
end
