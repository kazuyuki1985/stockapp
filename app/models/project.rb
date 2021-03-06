class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user
  
  
  # 必須制御
  # 「project」を未入力の状態では保存できなくなる
  validates :title, presence: { message: "入力してください" },
  length: { minimum:3, message: "短かいです"}
end
