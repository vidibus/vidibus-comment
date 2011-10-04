module Vidibus
  module Comment
    module Mongoid
      extend ActiveSupport::Concern

      included do
        belongs_to :commentable, :polymorphic => true

        field :content, :type => String

        validates :commentable, :content, :presence => true
      end
    end
  end
end
