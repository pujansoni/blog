module ApplicationHelper
  def find_like post_id, user_id
    like = Post.find(post_id).likes.find_by(user_id: user_id)
    return like.present? ? like.id : 0
  end

  def find_comment comment_id, user_id
    like = Comment.find(comment_id).likes.find_by(user_id: user_id)
    return like.present? ? like.id : 0
  end
end
