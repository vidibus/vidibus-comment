class Article
  include Mongoid::Document
  has_many :comments, :as => :commentable
end

class User
  include Mongoid::Document
  include Vidibus::Uuid::Mongoid
end
