class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :update_avatar]
  before_action :set_user, only: [:show, :update, :update_avatar]

  def index
    @users = User.all

    render json: @users
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:email, :name, :avatar)
    end
end
