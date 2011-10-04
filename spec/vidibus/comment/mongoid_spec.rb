require 'spec_helper'

describe Vidibus::Comment::Mongoid do
  let(:article) { Factory(:article) }
  let(:subject) { Factory(:comment, :commentable => article) }

  describe 'validation' do
    it 'should pass with valid attributes' do
      subject.save!
      subject.should be_valid
    end

    it 'should fail without a commentable object' do
      subject.commentable = nil
      subject.should be_invalid
    end

    it 'should fail without content' do
      subject.content = nil
      subject.should be_invalid
    end
  end
end
