class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @posts = @user.posts.order("id desc")
  end

  def edit

  end

  def update

  end

  private
  def set_user
    @user = User.find_by(name: params[:name])
  end

end