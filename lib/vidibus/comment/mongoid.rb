module Vidibus
  module Comment
    module Mongoid
      extend ActiveSupport::Concern

      included do
        class CommentError < StandardError; end

        belongs_to :commentable, :polymorphic => true
        belongs_to :user

        belongs_to :reference, :class_name => 'Comment'
        has_many :replies, :class_name => 'Comment', :inverse_of => :reference

        field :content, :type => String
        field :likes, :type => Integer, :default => 0
        field :dislikes, :type => Integer, :default => 0
        field :likes_users, :type => Array, :default => []
        field :dislikes_users, :type => Array, :default => []

        validates :commentable, :user, :content, :presence => true

        scope :latest, desc(:created_at)
        scope :threads, where(:reference_id => nil)
      end

      module InstanceMethods
        def like!(user)
          like_or_dislike!(user, :likes)
        end

        private

        def like_or_dislike!(user, type)
          validate_rating(user, type)
          list = push("#{type}_users", user.uuid)
          update_attribute(type, list.size)
        end

        def validate_rating(user, type)
          message = if !%w[likes dislikes].include?(type.to_s)
            'Provide "likes" or "dislikes".'
          elsif !user.kind_of?(User) || user.uuid.nil?
            "No valid User provided."
          elsif send("#{type}_users").include?(user.uuid)
            "User #{user.uuid} already #{type} this comment."
          end

          raise CommentError.new(message) if message
          true
        end
      end
    end
  end
end
