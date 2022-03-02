class EnrollmentsController < ApplicationController
before_action :authenticate_user!

def new
  @enrollment = Enrollment.new 
end

def create
  #prevents double enrollment
  @course = Course.find(params[:course_id])
  @enrollments = Enrollment.all.includes(:user).where(course_id: params[:course_id])
  
  unless @enrollments.map(&:user_id).include? current_user.id

      @enrollment = @course.enrollments.new
      @enrollment.user_id = current_user.id
      @enrollment.save
      redirect_to enrollments_path
    else

      redirect_to enrollments_path

  end


end

def destroy
  @enrollment = Enrollment.find(params[:id])
  @user = @enrollment.user
  @enrollment.destroy
  redirect_to root_path
end


def index
  @enrollments = current_user.enrollments.includes(:course).all
end



private

def find_enrollment
  @enrollment = Enrollment.find(params[:id])
end
def enrollment_params
   params.require(:enrollment).permit(:user_id, :course_id)
end

# def check_if_enrolled
#     user.joins(:course_id)

# end



end
