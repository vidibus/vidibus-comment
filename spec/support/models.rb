class Article
  include Mongoid::Document
  has_many :comments, :as => :commentable
end

class Comment
  include Mongoid::Document
  include Vidibus::Comment::Mongoid
end
