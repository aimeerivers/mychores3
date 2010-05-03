require File.dirname(__FILE__) + '/../spec_helper'

describe TasksController do
  before do
    controller.stub!(:current_user => create_user) 
  end

  def create_user
    Factory(:user)
    #User.destroy_all
    #User.create!(:login => 'memememe', :password => 's3cr3t', 
                 #:password_confirmation => 's3cr3t', :email => 'me@meme.com')
  end

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

  describe '#create' do
    before do
      @task = mock_model(Task, :save => true)
      Task.stub!(:new => @task)
      @task_params = {'name' => 'Water plants'}
    end

    def do_post
      post :create, :task => @task_params
    end

    it 'creates the task from parameters sent' do
      Task.should_receive(:new).with(@task_params)
      do_post
    end

    it 'attempts to save the task' do
      @task.should_receive(:save)
      do_post
    end

    context 'when the save is successful' do
      it 'redirects to the task page' do
        do_post
        response.should redirect_to(task_path(@task))
      end

      it 'provides feedback' do
        do_post
        flash[:notice].should_not be_blank
      end
    end

    context 'when the save is not successful' do
      it 'shows the new page again' do
        @task.stub!(:save => false)
        do_post
        response.should render_template(:new)
      end
    end
  end

  context '#show' do
    before do
      @task = mock_model(Task, :id => 1)
      Task.stub!(:find).and_return(@task)
    end

    it 'finds the task' do
      Task.should_receive(:find).with('1')
      get :show, :id => '1'
    end

    it 'exposes the task' do
      get :show, :id => '1'
      assigns[:task].should == @task
    end
  end

end
