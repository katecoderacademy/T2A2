class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, dependent: :destroy
  has_one :address, class_name: "Address", foreign_key: "address_id"
  accepts_nested_attributes_for :address
         #has_many :instructor_id, through :course_id
  has_many :enrollments
  has_many :courses, through: :enrollments
  validates :email, uniqueness: true
  
  #, message: 'Please enter a unique email or reset your account password.'
         
         validates_format_of :first_name, with: /[a-z\s.-]/i
         validates_format_of :last_name, with: /[a-z\s.-]/i
         validates_length_of  :first_name, within: 2..40, message:'Please enter a valid first name.'
        
         validates_length_of :last_name, within: 2..40, message: 'Please enter a valid surname.'
        validates :email, uniqueness: true 
        validates_length_of :phone_number, within: 6..20, allow_blank:true, message: 'Please enter a valid phone number.'
        validates_numericality_of :phone_number, allow_blank:true, message: 'Please enter a valid phone number without spaces,  brackets or any other symbols.'
        validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
        validates :phone_number, presence: true, if: :instructor?
        
        # with_options if: :instructor.present? do |instructor|
        #   instructor.validates :phone_number, length:{in 2..40}, allow_blank:false
        
        # end
        
        # enables a nested form without revealing the Devise controller
        def with_address
          self.addresses.build
          self
        end

end
