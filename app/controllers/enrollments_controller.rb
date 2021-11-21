class EnrollmentsController < ApplicationController
    def create
        # Find associated product and current cart
        chosen_course = Course.find(params[:course_id])
        current_enrollment = @current_enrollment
      
        # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
        if current_enrollment.courses.include?(chosen_course)
          # Find the line_item with the chosen_product
          @course = current_enrollment.enrollment.find_by(:product_id => chosen_product)


        else
            @enrollment = Enrollment.new
            # @enrollment.cart = current_cart
            @enrollment.course = chosen_course
        end
      
        # Save and redirect to cart show path
        @enrollment.save
        redirect_to enrollment_path(current_enrollment)
      end
      
      def destroy
        @enrollment = Enrollment.find(params[:id])
        @enrollment.destroy
        redirect_to root_path
      end  

      #ADDED

    #   def add_quantity
    #     @line_item = LineItem.find(params[:id])
    #     @line_item.quantity += 1
    #     @line_item.save
    #     redirect_to cart_path(@current_cart)
    #   end
      
    #   def reduce_quantity
    #     @line_item = LineItem.find(params[:id])
    #     if @line_item.quantity > 1
    #       @line_item.quantity -= 1
    #     end
    #     @line_item.save
    #     redirect_to cart_path(@current_cart)
    #   end
#     link_to "Add one", line_item_add_path(:id => line_item), method: :post
# link_to "Reduce one", line_item_reduce_path(:id => line_item), method: :post

    #   #ADDED
      

      private
        def enrollment_params
          params.require(:enrollment).permit(:quantity,:user_id, :course_id)
        end
end
