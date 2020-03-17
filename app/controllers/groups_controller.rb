class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups
    # @last_update = 
  end

  def show
    id = params[:id]
    @group = Group.find(id)
  end

  def edit
  end

  def new
  end
end
