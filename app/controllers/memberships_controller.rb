class MembershipsController < ApplicationController

    def index 
        @memberships = Membership.all 
    end 

    def new 
        @membership = Membership.new 
        @users = User.all 
        @group = current_user.owned_groups
        
    end 

    def create 
        @membership = Membership.create(membership_params)
        if @membership.save 
            redirect_to groups_path
        else  
            render :new
        end 
    end 

    private 

    def membership_params 
        params.require(:membership).permit(:user_id, :group_id)
    end 
end
