class Address < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "address_id", dependent: :destroy
    belongs_to :courses, class_name: "Course", foreign_key: "address_id", dependent: :destroy


    validates_format_of :address_line_1, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
    validates_format_of :address_line_2, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
    validates_format_of :suburb, with: /\A[a-zA-Z0-9 ,.;'"+-?!%$]*(?:\R[a-zA-Z0-9 ,.;'"+-?!%$]*)*\z/
    validates_numericality_of :postcode, within: 800..9999
    validates_length_of :address_line_1, maximum: 50, message:'First line of address cannot be blank and cannot be more than 50 characters.'
    validates_length_of :address_line_2, maximum: 50, allow_blank:true
    validates_length_of :suburb, maximum: 50, message:'Suburb/Town cannot be blank and cannot be more than 50 characters.'
    validates_length_of :state, maximum: 3, message:'Please enter State or Territory with its 3 character abbreviation.'
end
