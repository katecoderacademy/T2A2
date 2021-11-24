class Enrollment < ApplicationRecord
    belongs_to :user
    belongs_to :course



    # validates :course_id, uniqueness:true, message: "You are already tracking that course."
end
