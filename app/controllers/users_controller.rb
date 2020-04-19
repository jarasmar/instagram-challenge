class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    # user profile
  end
end
