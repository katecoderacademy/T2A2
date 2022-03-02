class Address < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'address_id', dependent: :destroy
  belongs_to :courses, class_name: 'Course', foreign_key: 'address_id', dependent: :destroy

  validates :address_line_1,
            format: { with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/, message: 'First line of address cannot be blank and cannot be more than 50 characters.' }, length: { maximum: 50, message: 'First line of address cannot be blank and cannot be more than 50 characters' }
  # validates :address_line_1, format: { /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
  # maximum: 50, message:'First line of address cannot be blank and cannot be more than 50 characters.'
  validates :address_line_2,
            format: { with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/, message: 'First line of address cannot be blank and cannot be more than 50 characters.' }, length: { maximum: 50, message: 'First line of address cannot be blank and cannot be more than 50 characters' }, allow_blank: true
  # validates_format_of :address_line_1, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
  # validates_length_of :address_line_1, maximum: 50, message:'First line of address cannot be blank and cannot be more than 50 characters.'
  # validates_format_of :address_line_2, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
  # validates_length_of :address_line_2, maximum: 50, allow_blank:true

  validates :suburb,
            format: { with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/, message: 'Suburb/Town cannot be blank and cannot be more than 50 characters.' }, length: { maximum: 50, message: 'Suburb/Town cannot be blank and cannot be more than 50 characters.' }
  # validates_format_of :suburb, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
  # validates_length_of :suburb, maximum: 50, message:'Suburb/Town cannot be blank and cannot be more than 50 characters.'
  validates_numericality_of :postcode, within: 800..9999
  validates_length_of :state, maximum: 3, message: 'Please enter State or Territory with its 3 character abbreviation.'
end
