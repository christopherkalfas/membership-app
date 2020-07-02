class InvitesController < ApplicationController

    def new 
        @invite = Invite.new
    end 

    def create
        @invite = Invite.new(params[:invite])
        @invite.sender = current_user
        if @invite.save 
            if logged_in?
                Mailer.deliver_invite(@invite, signup_url(@invite.token))
                flash[:notice] = "Invite Send"
                redirect_to groups_path
            else 
                flash[:notice] = "We will notify you when we are ready."
                redirect_to groups_path
            end 
        else 
            render :action => 'new'
        end 
    end 

end 