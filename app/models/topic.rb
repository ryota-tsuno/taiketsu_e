class Topic < ApplicationRecord
  belongs_to  :taiketsu, optional: true
  validates   :topic,
      presence: true,
      length:   {in: 1 .. 50}
end
