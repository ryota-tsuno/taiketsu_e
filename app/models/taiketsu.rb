class Taiketsu < ApplicationRecord
  has_many  :topics, dependent: :destroy
  accepts_nested_attributes_for :topics
end
