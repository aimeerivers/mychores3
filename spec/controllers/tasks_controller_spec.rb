require File.dirname(__FILE__) + '/../spec_helper'

describe TasksController do

  describe '#new' do
    before do
      @task = mock_model(Task)
      Task.stub!(:new => @task)
    end

    it 'makes a new task' do
      Task.should_receive(:new)
      get :new
    end

    it 'exposes the task' do
      get :new
      assigns[:task].should == @task
    end
  end

end
