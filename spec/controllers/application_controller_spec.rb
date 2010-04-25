require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationController do

  describe "logged_in?" do
    it "is true when there is a current user" do
      controller.stub!(:current_user => mock(:user))
      controller.send(:logged_in?).should be_true
    end

    it "is false when there is no current user" do
      controller.stub!(:current_user => nil)
      controller.send(:logged_in?).should be_false
    end

    it "is false when current user is false" do
      controller.stub!(:current_user => false)
      controller.send(:logged_in?).should be_false
    end
  end

end
