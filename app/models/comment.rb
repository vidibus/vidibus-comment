class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Vidibus::Uuid::Mongoid
  include Vidibus::Comment::Mongoid

  field :realm_uuid, :type => String

  # validates :realm_uuid, :uuid => true

  scope :in_realm, lambda { |realm| where(:realm_uuid => realm) }
end
