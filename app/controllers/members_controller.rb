class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    puts current_user.id
    puts current_user.name
    puts current_user.email
    render json: { message: "If you see this, you're in!" }
  end
end