class CoursesController < ApplicationController
before_action :authenticate_user!, except: %i[index show]
before_action :find_course, only: %i[show edit update destroy]

def index
  @courses = Course.includes(:user).all  #find this to optimise load times

  # @category = Category.find(@courses.category_id)
end

def new
  @course = Course.new
  @categories = Category.all
  @address = Address.new
  @address.build_courses
end

def create
  if current_user.instructor

  @course = current_user.courses.new(course_params)
  @course.user_id = current_user.id
  
  if @course.save
    redirect_to @course
  else
    flash.now[:messages] = @course.errors.full_messages[0]
    render :new
  end
else
  flash.now[:messages] = "You must be an instructor to post courses."
  redirect_to root_path
  end
end

def show
  @course = Course.find(params[:id])
  @category = Category.find(@course.category_id)
end


def posted

  @courses = Course.where(user_id: current_user.id)

end





def edit
  @course = Course.find(params[:id])
end

def update
  if @course.update(course_params)

  redirect_to @course
  else
      flash.now[:messages] = @course.errors.full_messages[0]
      render :edit
    end


end



def destroy
  @course.destroy

  redirect_to posted_courses


end




private

def find_course
  @course = Course.find(params[:id])
end
def course_params
   params.require(:course).permit(:title, :start_time, :end_time, :url, :instructor_role, :duration, :description, :fee, :online, :instructor_name, :practice_management, :substantive_law, :ethics, :professional_skills, :category_id, :picture, :user_id, address_attributes: [:address_line_1, :address_line_2, :suburb, :state, :postcode])
end

end
