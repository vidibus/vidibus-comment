require 'spec_helper'

describe Comment do
  it 'should include Vidibus::Comment::Mongoid' do
    Comment.ancestors.include?(Vidibus::Comment::Mongoid).should be_true
  end
end
