require 'spec_helper'

describe Vidibus::Comment::Mongoid do
  let(:user) { Factory(:user) }
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

  describe '#replies' do
    it 'should be empty unless any replies are given' do
      subject.replies.should be_empty
    end

    it 'should contain replies to this comment' do
      first_reply = Factory(:comment, :commentable => article)
      second_reply = Factory(:comment, :commentable => article)

      subject.replies.concat [first_reply, second_reply]
      subject.reload.replies.should eq([first_reply, second_reply])
    end
  end

  describe '#reference' do
    it 'should be nil unless comment is an answer' do
      subject.replies.should be_empty
    end

    it 'should contain the reference of a reply' do
      reply = Factory(:comment, :commentable => article)
      subject.replies << reply
      reply.reload.reference.should eq(subject)
    end
  end

  describe '#like!' do
    before { subject.like!(user) }

    it 'should add the uuid of the given user to the list of likes' do
      subject.likes_users.should eq([user.uuid])
    end

    it 'should increment likes counter' do
      subject.likes.should eql(1)
    end

    it 'should raise an error if no valid rating type is provided' do
      expect {
        subject.send(:like_or_dislike!, user, nil)
      }.to raise_error(Vidibus::Comment::Mongoid::CommentError)
    end

    it 'should raise an error if no user is provided' do
      expect {
        subject.send(:like_or_dislike!, nil, :likes)
      }.to raise_error(Vidibus::Comment::Mongoid::CommentError)
    end

    it 'should raise an error if no user is provided' do
      user.uuid = nil

      expect {
        subject.send(:like_or_dislike!, user, :likes)
      }.to raise_error(Vidibus::Comment::Mongoid::CommentError)
    end

    it 'should raise an error if no user class is provided' do
      expect {
        subject.send(:like_or_dislike!, article, :likes)
      }.to raise_error(Vidibus::Comment::Mongoid::CommentError)
    end

    it 'should raise an error if user already likes this comment' do
      expect { subject.like!(user) }.to raise_error(Vidibus::Comment::Mongoid::CommentError)
    end
  end
end
