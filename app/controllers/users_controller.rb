class UsersController < ApplicationController

    def index 
        @users = User.all
    end 

    def show 
        @user = User.find(params[:id])
    end 

    def new 
        @user = User.new(:invitation_token => params[:invitation_token])
        @user.email = @user.invite.recipient_email if @user.invite 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to groups_path, notice: "Thank you for signing up!"
        else
          render "new"
        end
    end 

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to users_path
        else  
            render :edit 
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:name, :password, :email, :invite_id, :invitation_limit, :invitation_token)
    end 
end
