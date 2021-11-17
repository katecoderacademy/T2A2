class Course < ApplicationRecord
    belongs_to :user
    has_one :category_name


    validates :course_title, presence: true, length:  { in: 4..40 }    
    
    validates :course_description, presence: true, length: { in: 30..4000 }
    
    validates :course_fee, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    validates :course_ethics, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    validates :course_professional_skills, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    validates :course_substantive_law, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    validates :course_ethics, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
 
    def required_details_for_offline_course
        if :online == false && :address_line_1 == nil
          errors.add(:online, "Course must be online if no address provided")
        end
        if :online == false && :course_date == nil
            errors.add(:online, "Course provide a date if it is not online")
        end
        if :online == false && :course_time == nil
        errors.add(:online, "Course provide a time if it is not online")
        end
      end

end
