require 'spec_helper'

describe Person do
  describe '#display_name' do
    it 'uses the name when the person has set one' do
      create_user('testsermoa').person.display_name.should == 'testsermoa'
    end

    it 'uses the login when the name is not set' do
      create_user.person.display_name.should == 'testuser'
    end

    it 'uses the login when the name is blank' do
      create_user(' ').person.display_name.should == 'testuser'
    end

    def create_user(name= nil)
      Factory(:user, :person => Person.new({ :name => name,
                                :email => 'test@test.com' }))
    end
  end
end
