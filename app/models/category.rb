class Category < ApplicationRecord
belongs_to :courses, class_name: "Course", foreign_key: "category_id"
end
