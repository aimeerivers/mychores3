require File.dirname(__FILE__) + '/../spec_helper'

describe TeamsController do
  describe '#create' do
    before do
      @user = mock_model(User)
      controller.stub!(:current_user => @user)
    end

    it 'adds the current user to the team' do
      team = mock_model(Team, :save => true)
      Team.stub!(:new => team)
      @user.should_receive(:add_to_team).with(team)
      post :create, :team => {:name => 'Household'}
    end
  end

  describe '#edit' do
    before do
      @team = mock_model(Team)
      Team.stub!(:find => @team)
    end

    context 'when not signed in' do
      it 'requires sign in' do
        get :edit, :id => 1
        response.should be_redirect
      end
    end

    context 'when signed in' do
      before do
        @user = mock_model(User)
        controller.stub!(:current_user => @user)
      end

      it 'checks whether the user is a member of the team' do
        @user.should_receive(:member_of?).with(@team)
        get :edit, :id => 1
      end

      it 'allows members of the team to edit' do
        @user.stub!(:member_of? => true)
        get :edit, :id => 1
        response.should render_template(:edit)
      end

      it 'does not allow non-members of the team to edit' do
        @user.stub!(:member_of? => false)
        get :edit, :id => 1
        response.should be_redirect
      end
    end
  end

end
