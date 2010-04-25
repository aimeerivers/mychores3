require File.dirname(__FILE__) + '/../../spec_helper'

describe "application layout" do
  context "when logged in" do
    before(:each) do
      template.stub!(:logged_in? => true)
      render 'layouts/application'
    end

    it "has a sign out link" do
      response.should have_tag('a', 'Sign out')
    end

    it "does not have a sign in link" do
      response.should_not have_tag('a', 'Sign in')
    end

    it "does not have a sign up link" do
      response.should_not have_tag('a', 'Sign up')
    end
  end

  context "when not logged in" do
    before(:each) do
      template.stub!(:logged_in? => false)
      render 'layouts/application'
    end

    it "has a sign in link" do
      response.should have_tag('a', 'Sign in')
    end

    it "has a sign up link" do
      response.should have_tag('a', 'Sign up')
    end

    it "does not have a sign out link" do
      response.should_not have_tag('a', 'Sign out')
    end
  end
end
