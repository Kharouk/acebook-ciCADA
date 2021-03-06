# frozen_string_literal: true

# Helper functions for the ImagePosts controller
module ImageCommentsHelper
  def find_image_comment_email(user_id)
    User.find(user_id).email
  end

  def find_comment_username(comment)
    User.find(comment.user_id).username
  end
end
