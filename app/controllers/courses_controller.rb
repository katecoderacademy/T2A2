class CoursesController < ApplicationController
before_action :authenticate_user!, except: %i[index show]
before_action :find_course, only: %i[show edit update destroy]

def index
  @courses = Course.all
end

def show
  @course = Course.find(params[:id])
end
def new
  @course = Course.new
end

def create
  @course = current_user.courses.new(course_params)


  if @course.save 
    redirect_to @course
  else
    flash[:info] = "Something is wrong, try again."
       
  end
end



def edit
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
   params.require(:course).permit(:title, :time, :duration, :description, :fee, :online, :instructor_name, :practice_management, :substantive_law, :ethics, :professional_skills, :course_category, :user_id)
end

end
