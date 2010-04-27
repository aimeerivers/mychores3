require File.dirname(__FILE__) + '/../spec_helper'

describe Team do
  before(:each) do
    @valid_attributes = {
      :name => "Household",
      :description => "me and my homies"
    }
  end

  it "should create a new instance given valid attributes" do
    Team.new(@valid_attributes).should be_valid
  end

  it 'requires a name' do
    Team.new().errors_on(:name).should_not be_empty
  end
end
