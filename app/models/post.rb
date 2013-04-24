class Post < ActiveRecord::Base
  serialize :metadata
  attr_accessible :title, :metadata, :user_id
  belongs_to :user
end
