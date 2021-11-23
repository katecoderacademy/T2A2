class EnrollmentsController < ApplicationController
before_action :authenticate_user!

def new
  @enrollment = Enrollment.new 
end

def create
  @course = Course.find(params[:course_id])
  @enrollment = @course.enrollments.new
  @enrollment.user_id = current_user.id
  @enrollment.save

    redirect_to root_path
end

def destroy
  @enrollment = Enrollment.find(params[:id])
  @user = @enrollment.user
  @enrollment.destroy
  redirect_to root_path
end


def index
  @enrollments = current_user.enrollments
end



private

def find_enrollment
  @enrollment = Enrollment.find(params[:id])
end
def enrollment_params
   params.require(:enrollment).permit(:user_id, :course_id)
end

end
