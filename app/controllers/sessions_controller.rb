class SessionsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_authorized_user
    def create 
        user = User.find_by!(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: {error: "RecordNotFound"}, status: :unauthorized
        end


    end

    def destroy
        user = User.find(session[:user_id])
        if user
            session.delete :user_id 
            return head :no_content  
        else
            render json: { error:"unauthorized"}, status: 401
        end
    end
    private 

    def not_authorized_user e
        render json: {errors: [e]  }, status: 401
    end
end
