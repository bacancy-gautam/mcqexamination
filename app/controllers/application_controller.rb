class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        if(current_user.has_role?(:faculty))
            faculty_index_path
        elsif(current_user.has_role?(:admin))
            admin_index_path
        elsif(current_user.has_role?(:student))
            student_index_path
        else
            
        end
      end

      protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:enrollment ,:sem ,:fname, :lname, :email, :branch, :password, :mobile, :pyear, :status) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:enrollment ,:sem ,:fname, :lname, :email, :branch, :password, :mobile, :pyear, :status) }
        end 

end
