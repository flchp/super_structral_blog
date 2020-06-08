class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  #文章模版自连接结构
  has_many :children_posts, class_name: 'Post',
           foreign_key: 'post_model_id'
  belongs_to :post_model, class_name: 'Post',
             optional: true
  #模版范例自连接结构
  has_many :sub_posts, class_name: 'Post',
           foreign_key: 'post_example_id'
  belongs_to :post_example, class_name: 'Post',
             optional: true

  belongs_to :category

  validates :title, presence: true

  before_save :add_post_content, on: :create

  scope :is_model, -> {where(is_set_as_model: true)}
  scope :is_example, -> {where(is_set_as_example: true)}

  private

  def add_post_content
    self.content = self.post_model.content if (self.post_model && !self.content)
  end
end
