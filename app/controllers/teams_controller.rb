class TeamsController < ApplicationController
  before_filter :sign_in_required, :except => [:show]
  before_filter :find_team, :only => [:show, :edit, :update]
  before_filter :ensure_membership, :except => [:new, :create, :show]

  def show
  end
  
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      current_user.add_to_team(@team)
      flash[:notice] = 'Team created successfully.'
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update_attributes(params[:team])
    if @team.save
      flash[:notice] = 'Team updated successfully.'
      redirect_to team_path(@team)
    else
      render :edit
    end
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def ensure_membership
    unless current_user.member_of?(@team)
      flash[:error] = 'You are not a member of that team.'
      redirect_to(team_path(@team))
    end
  end
end
