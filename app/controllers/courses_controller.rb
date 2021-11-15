class CoursesController < ApplicationController
  def index
    @course = Course.all
  end
  def create
    @course = current_user.courses.new(course_params)


    if @course.save 
      redirect_to @course
    else
      render :new
         
    end
  end


end
