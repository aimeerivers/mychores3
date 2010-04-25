require 'spec_helper'

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

end
