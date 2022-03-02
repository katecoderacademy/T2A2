class Category < ApplicationRecord
has_many :courses, class_name: "Course", foreign_key: "category_id"
end
