class CoursesController < ApplicationController
before_action :authenticate_user!, except: %i[index show]
before_action :find_course, only: %i[show edit update destroy]

def index
  @courses = Course.all
end

def new
  @course = Course.new
end

def create
  @course = current_user.courses.new(course_params)


  if @course.save 
    redirect_to @course
  else
    puts @course.errors.full_messages
    puts "something goes wrong"
       
  end
end

def show
  @course = Course.find(params[:id])
end






def edit
  @course = Course.find(params[:id])
end

def update
  if @course.update(course_params)

  redirect_to @course
  else
    render :edit

  end
end


def destroy
  @course.destroy

  redirect_to root_path


end




private

def find_course
  @course = Course.find(params[:id])
end
def course_params
   params.require(:course).permit(:title, :start_time, :end_time, :url, :instructor_role, :duration, :description, :fee, :online, :instructor_name, :practice_management, :substantive_law, :ethics, :professional_skills, :course_category, :picture, :user_id)
end

end
