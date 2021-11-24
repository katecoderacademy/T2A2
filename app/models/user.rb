class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :courses, dependent: :destroy
         has_many :addresses
         accepts_nested_attributes_for :addresses
         #has_many :instructor_id, through :course_id
         has_many :enrollments
         has_many :courses, through: :enrollments
         validates :email, uniqueness: true
         #, message: 'Please enter a unique email or reset your account password.'
         
        validates_length_of  :first_name, within: 2..40, message:'Please enter a valid first name.'
        validates_length_of :last_name, within: 2..40, message: 'Please enter a valid surname.'
        validates :email, uniqueness: true 
        validates_length_of :phone_number, within: 6..20, allow_blank:true, message: 'Please enter a valid phone number.'
        validates_numericality_of :phone_number, allow_blank:true, message: 'Please enter a valid phone number without spaces,  brackets or any other symbols.'
        validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
        validates_presence_of :phone_number, if: Proc.new{ |instructor| :instructor.blank? }
  

        # validates phone_number_if_instructor, on :create && :

        # def phone_number_if_instructor
        #   if :phone_number.blank? && :instructor.present?
        #     return errors.add(
        #       :phone_number, 'You must provide a phone number to post courses.')
        #   end

        # end

end
