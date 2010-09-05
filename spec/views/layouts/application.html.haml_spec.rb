require File.dirname(__FILE__) + '/../../spec_helper'

describe "layouts/application.html.haml" do
  context "when signed in" do
    before(:each) do
      @user = mock(:user, :display_name => 'aimee')
      view.stub!(:signed_in? => true)
      view.stub!(:current_user => @user)
      render
    end

    it 'has link to the user profile' do
      rendered.should have_selector('a', :href => '/profile/edit', :content => @user.display_name)
    end

    it "has a sign out link" do
      rendered.should have_selector('a', :content => 'Sign out')
    end

    it "does not have a sign in link" do
      rendered.should_not have_selector('a', :content => 'Sign in')
    end

    it "does not have a sign up link" do
      rendered.should_not have_selector('a', :content => 'Sign up')
    end
  end

  context "when not signed in" do
    before(:each) do
      view.stub!(:signed_in? => false)
      render
    end

    it "has a sign in link" do
      rendered.should have_selector('a', :content => 'Sign in')
    end

    it "has a sign up link" do
      rendered.should have_selector('a', :content => 'Sign up')
    end

    it "does not have a sign out link" do
      rendered.should_not have_selector('a', :content => 'Sign out')
    end
  end
end
