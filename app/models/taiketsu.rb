class Taiketsu < ApplicationRecord
  has_many  :topics
  accepts_nested_attributes_for :topics
end
