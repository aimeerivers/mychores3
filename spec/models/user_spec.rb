require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  describe '#add_to_team' do
    it 'adds the user into the team' do
      user = User.new
      team = mock_model(Team)
      user.add_to_team(team)
      user.teams.should == [team]
    end
  end

  describe '#member_of?' do
    before do
      @user = User.new
      @team = mock_model(Team)
    end

    it 'is true when the user is a member of the team' do
      @user.teams << @team
      @user.member_of?(@team).should be_true
    end

    it 'is false when the user is not a member of the team' do
      @user.member_of?(@team).should be_false
    end
  end
end
