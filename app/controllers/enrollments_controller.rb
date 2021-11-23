class EnrollmentsController < ApplicationController
before_action :authenticate_user!

def new
  @enrollment = Enrollment.new 
end

def create
  @course = Course.find(params[:course_id])
  # user_id = current_user.id
  @enrollment = @course.enrollments.new
  @enrollment.user_id = current_user.id
  @enrollment.save
  # @enrollment = Enrollment.create(params.require(:enrollment).permit(:course_id, :user_id))
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
  
  #@enrollment = Enrollment.find(params[:id])
  #@course = Course.find(:course_id)
end



private

def find_enrollment
  @enrollment = Enrollment.find(params[:id])
end
def enrollment_params
   params.require(:enrollment).permit(:user_id, :course_id)
end

end
