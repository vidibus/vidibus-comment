class Article
  include Mongoid::Document
  include Vidibus::Comment::Mongoid
end
