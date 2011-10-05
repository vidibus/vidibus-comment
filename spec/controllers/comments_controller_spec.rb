require 'spec_helper'

describe CommentsController do
  describe "on GET to #index" do
    before { get :index }
    it 'should have an index action'
  end
  
  describe "on POST to #create" do
    before { post :create }
    it 'should have a create action'
  end
end
