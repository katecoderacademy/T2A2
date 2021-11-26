class Course < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_one :category, class_name: "Category", foreign_key: "category_id"
    has_one :address, class_name: "Address", foreign_key: "address_id"
    accepts_nested_attributes_for :address
    has_one_attached :picture
    has_many :enrollments
    has_many :users, through: :enrollments
    
    #need to validate here to only proceed IF the instructor? = true
    validates_length_of :title, within: 2..100, message:'Title cannot be blank and cannot be more than 100 characters.'    
    validates_format_of :title, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
    
    validates_format_of :description, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
    validates_length_of :description, within: 30..4000, message:'Description cannot be blank and must be between 30 and 4000 characters.'

    validates_length_of :instructor_role, within: 2..100, message:'Instructor Role cannot be blank and must be less than 100 characters.'
    validates_format_of :instructor_name, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
    validates_format_of :instructor_role, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
    validates_length_of :instructor_name, within: 2..40, message:'Instructor name cannot be blank and must be less than 100 characters.'
    validates_length_of :url, maximum: 150, allow_blank:true
    
    validates :url, url: { allow_blank: true } 

    validates_numericality_of :fee, greater_than: 0, allow_blank:true

    validates_numericality_of :ethics, greater_than_or_equal_to: 0, allow_blank:true

    validates_numericality_of :professional_skills, greater_than_or_equal_to: 0, allow_blank:true

    validates_numericality_of :substantive_law, greater_than_or_equal_to: 0, allow_blank:true

    validates_numericality_of :practice_management, greater_than_or_equal_to: 0, allow_blank:true

end
