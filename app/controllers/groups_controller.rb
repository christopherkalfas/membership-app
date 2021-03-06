class GroupsController < ApplicationController
    before_action :authenticate!, except: [:index, :show]
    def index 
        @groups = Group.all
    end 

    def show 
        @group = Group.find(params[:id])
        # @membership = @group.users
        # @user = User.find(params[:id]) if current_user
    end 

    def new 
        @group = Group.new
    end 

    def create 
        @group = Group.new(group_params)
        @group.owner_id = current_user.id if current_user
        if @group.save
            Membership.create(group_id: "#{@group.id}", user_id: "#{@current_user.id}")
            redirect_to group_path(@group)
        else 
            render :new 
        end 
    end 

    def edit 
        @group = Group.find(params[:id])
    end

    def update 
        @group = Group.find(params[:id])
        if @group.update(group_params)
            redirect_to groups_path
        else  
            render :edit 
        end 
    end 

    private

    def group_params
        params.require(:group).permit(:name)
    end 
end
