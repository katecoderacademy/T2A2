class Address < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "address_id", dependent: :destroy
    belongs_to :courses, class_name: "Course", foreign_key: "address_id", dependent: :destroy
end
