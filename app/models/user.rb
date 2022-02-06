class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, dependent: :destroy
  has_one :address, class_name: 'Address', foreign_key: 'address_id'
  accepts_nested_attributes_for :address

  has_many :enrollments
  has_many :courses, through: :enrollments
  validates :email, uniqueness: true

  validates :first_name, format: { with: /[a-z\s.-]/i, message: 'Please enter a valid first name' },
                         length: { minimum: 2, maximum: 40, message: 'Please enter a valid first name' }
  # validates_format_of :first_name, with:
  # validates_length_of  :first_name, within: 2..40, message:'Please enter a valid first name.'
  validates :last_name, format: { with: /[a-z\s.-]/i, message: 'Please enter a valid surname.' },
                        length: { minimum: 2, maximum: 60, message: 'Please enter a valid surname.' }
  # validates :phone_number, within: 6..20, allow_blank:true, message: 'Please enter a valid phone number.'
  validates :phone_number, numericality: true,
                           length: { minimum: 6, maximum: 20, message: 'Please enter a valid phone number without spaces, brackets or other symbols' }, allow_blank: true
  # validates_numericality_of :phone_number, allow_blank:true, message: 'Please enter a valid phone number without spaces,  brackets or any other symbols.'
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, on: :create
  validates :phone_number, presence: true, if: :instructor?
  # enables a nested form without revealing the Devise controller - doesn't work at present
  def with_address
    addresses.build
    self
  end
end
