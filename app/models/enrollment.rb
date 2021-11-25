class Enrollment < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    belongs_to :course, class_name: "Course", foreign_key: "course_id"
    # validates_uniqueness_of :user_id, scope: [:enrollment_id, :course_id], message: "You can't add a course more than once", on: 'create'
    # validates_uniqueness_of :course_id, if: Proc.new { |user| user.approved? }, on: 'create'
end

#https://stackoverflow.com/questions/27882003/ruby-on-rails-if-a-user-has-already-added-data-for-one-product-stop-them-from-do
#https://coderedirect.com/questions/162086/rails-validate-uniqueness-only-if-conditional