require File.dirname(__FILE__) + '/../../spec_helper'

describe "application layout" do
  context "when signed in" do
    before(:each) do
      @person = mock(:person, :display_name => 'aimee')
      template.stub!(:signed_in? => true)
      template.stub!(:current_person => @person)
      render 'layouts/application'
    end

    it 'has link to the user profile' do
      response.should have_tag('a', :href => '/profile/edit', :content => @person.display_name)
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

  context "when not signed in" do
    before(:each) do
      template.stub!(:signed_in? => false)
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
