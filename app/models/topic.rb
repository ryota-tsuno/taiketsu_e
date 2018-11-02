class Topic < ApplicationRecord
  belongs_to  :taiketsu, optional: true
  has_many :comments, dependent: :destroy
  # 投稿が削除されたときに一緒にコメントも削除する
  validates   :topic,
      presence: true,
      length:   {in: 1 .. 50}
end
