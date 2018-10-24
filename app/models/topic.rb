class Topic < ApplicationRecord
  belongs_to  :taiketsu, optional: true
end
