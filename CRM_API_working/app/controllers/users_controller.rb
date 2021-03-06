class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate, only: [:create, :index, :show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    #@user = User.update(user_params)
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entityail
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
     # @user = User.find_by(auth_token: @data.auth_token)
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:NAME, :LAST_NAME, :USER_NAME, :PASSWORD, :PASSWORD_DIGGEST, :PASSWORD_CONFIRMATION,:auth_token, :admin)
    end
end
