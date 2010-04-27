require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  describe '#display_name' do
    it 'uses the name when the user has set one' do
      user = User.new(:name => 'aimee', :login => 'sermoa')
      user.display_name.should == 'aimee'
    end

    it 'uses the login when the name is not set' do
      user = User.new(:login => 'sermoa')
      user.display_name.should == 'sermoa'
    end

    it 'uses the login when the name is blank' do
      user = User.new(:login => 'sermoa', :name => ' ')
      user.display_name.should == 'sermoa'
    end
  end

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
