class ApplicationController < ActionController::Base

    #added to pass authentication in pproduction because 
    #heroku will not allow clouflare flexible ssl to 
    #make unverified changes
    skip_before_action :verify_authenticity_token 

    before_action :authenticate_user!
    layout :layout_by_resource

    helper_method :current_account

    def current_account
        @current_account ||= current_user.account
        @current_account
    end


protected

    def layout_by_resource
        if devise_controller?
            "devise"
        else
            "application"
        end
    end
end
