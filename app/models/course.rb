class Course < ApplicationRecord
    belongs_to :user
    has_one :category
    has_one :address, through: :user
    has_one_attached :picture
    has_many :enrollments
    has_many :users, through: :enrollments
    
    #need to validate here to only proceed IF the instructor? = true
    validates_length_of :title, within: 2..40, message:'Title cannot be blank and cannot be more than 45 characters.'    
    
    validates_length_of :description, within: 30..4000, message:'Description cannot be blank and must be between 30 and 4000 characters.'
    
    validates_numericality_of :fee, greater_than: 0, allow_blank:true

    validates_numericality_of :ethics, greater_than_or_equal_to: 0, allow_blank:true

    validates_numericality_of :professional_skills, greater_than_or_equal_to: 0, allow_blank:true

    validates_numericality_of :substantive_law, greater_than_or_equal_to: 0, allow_blank:true

    validates_numericality_of :ethics, greater_than_or_equal_to: 0, allow_blank:true

    # validates :professional_skills, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    # validates :substantive_law, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    # validates :ethics, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
 
        # def required_details_for_offline_course
        #     if :online == false && :address_line_1 == nil
        #     errors.add(:online, "Course must be online if no address provided")
        #     end
        #     if :online == false && :course_date == nil
        #         errors.add(:online, "Course provide a date if it is not online")
        #     end
        #     if :online == false && :course_time == nil
        #     errors.add(:online, "Course provide a time if it is not online")
        #     end
        # end

    
end
