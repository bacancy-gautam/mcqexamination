class ApplicationController < ActionController::Base

    def after_sign_in_path_for(resource)
        if(current_user.has_role?(:faculty))
            faculty_index_path
        elsif(current_user.has_role?(:admin))
            admin_index_path
        else
            student_index_path
        end
      end

end
