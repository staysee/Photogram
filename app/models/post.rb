class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :image, presence: true #must attach image to form

  has_attached_file :image, styles: { :medium => "640x" } #resize image to 640px wide
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
