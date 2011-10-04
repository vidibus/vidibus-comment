module Vidibus
  module Comment
    module Mongoid
      extend ActiveSupport::Concern

      included do
        field :content, :type => String

        validates :content, :presence => true
      end
    end
  end
end
