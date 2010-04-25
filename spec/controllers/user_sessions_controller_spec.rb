require File.dirname(__FILE__) + '/../spec_helper'

describe UserSessionsController do

  describe '#new' do
    before do
      @user_session = mock_model(UserSession)
      UserSession.stub!(:new => @user_session)
    end

    it 'creates a new user session' do
      UserSession.should_receive(:new)
      get :new
    end

    it 'exposes the user session' do
      get :new
      assigns[:user_session].should == @user_session
    end
  end

  describe '#create' do
    before(:each) do
      @user_session = mock_model(UserSession, :save => true)
      UserSession.stub!(:new => @user_session)
      @user_session_params = {'login' => 'aimee', 'password' => 'passw0rd'}
    end

    def do_post
      post :create, :user_session => @user_session_params 
    end

    it "makes a new UserSession" do
      UserSession.should_receive(:new).with(@user_session_params)
      do_post
    end

    it "attempts to save the UserSession" do
      @user_session.should_receive(:save)
      do_post
    end

    context "when the sign in is successful" do
      before(:each) do
        @user_session.stub!(:save => true)
      end

      it "provides feedback" do
        do_post
        flash[:success].should_not be_blank
      end

      it "redirects to the home page" do
        do_post
        response.should redirect_to(root_path)
      end
    end

    context "when the sign in is unsuccessful" do
      before(:each) do
        @user_session.stub!(:save => false)
      end

      it "shows the sign in form again" do
        do_post
        response.should render_template(:new)
      end
    end
  end

end
