require 'spec_helper'

describe Vidibus::Comment::Mongoid do
  let(:subject) { Article.new(:content => 'Awesome!') }

  describe 'validation' do
    it 'should pass with valid attributes' do
      subject.should be_valid
    end
  end
end
