class Course < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_one :category, class_name: "Category", foreign_key: "category_id"
    has_many :addresses, class_name: "Address", foreign_key: "address_id"
    has_one_attached :picture
    has_many :enrollments
    has_many :users, through: :enrollments
    
    #need to validate here to only proceed IF the instructor? = true
    validates_length_of :title, within: 2..100, message:'Title cannot be blank and cannot be more than 45 characters.'    
    validates_format_of :title, with: /[a-z\s.-]/i
    validates_format_of :instructor_name, with: /[a-z\s.-]/i
    validates_format_of :instructor_role, with: /[a-z\s.-]/i
    # validates_format_of :description, multiline: true, with: /^([A-Za-z0-9]+\.[A-Za-z0-9]+(\r)?(\n)?)+$/
    validates_length_of :description, within: 30..4000, message:'Description cannot be blank and must be between 30 and 4000 characters.'
    # validates_format_of :url, url:true { allow_nil: true }

    validates_numericality_of :fee, greater_than: 0, allow_blank:true

    validates_numericality_of :ethics, greater_than: 0, allow_blank:true

    validates_numericality_of :professional_skills, greater_than: 0, allow_blank:true

    validates_numericality_of :substantive_law, greater_than: 0, allow_blank:true

    validates_numericality_of :ethics, greater_than: 0, allow_blank:true


 
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
