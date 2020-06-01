module SessionsHelper

    def current_user    
        if session[:user_id]
            User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil?  
    end

    def log_in(user)
        session[:user_id] = user.id
    end
    
    def log_out
        reset_session
        @current_user = nil
    end
end
