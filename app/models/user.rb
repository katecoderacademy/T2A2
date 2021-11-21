class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :courses, dependent: :destroy
         has_many :addresses
         accepts_nested_attributes_for :addresses
         has_many :enrollments, dependent: :destroy
         #has_many :instructor_id, through :course_id
         
         
        #  validates :first_name, presence: true, length: { in: 2..40 }
        #  validates :last_name, presence: true, length: { in: 2..40 }
        #  validates :email, uniqueness: true
        #  validates :phone_number, length: { in: 6..20 }

end
