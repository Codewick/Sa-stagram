class Photo <  ActiveRecord::Base
  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
  belongs_to :user
  has_and_belongs_to_many :likers, class_name: 'User', join_table: :likes
  has_many :comments


  def liked_by?(user)
    likers.exists?(user_id)
  end

  def toggle_liked_by(user)
    if likers.exists?(user_id)
      likers.destroy(user_id)
    else
      likers << user
    end
  end

end
