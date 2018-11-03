class Comment < ApplicationRecord
    belongs_to :topic
    has_many :good_counts
    has_many :bad_counts
    validates :text, presence: true
end