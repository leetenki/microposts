class ReplyRelationship < ActiveRecord::Base
  belongs_to :origin, :class_name => "Micropost"
  belongs_to :reply, :class_name => "Micropost", :dependent => :destroy
end
