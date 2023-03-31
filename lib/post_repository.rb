require_relative 'database_connection'
require_relative 'post'
require_relative 'comment'

class PostRepository
  def all
    sql = 'SELECT * FROM posts'
    result = DatabaseConnection.exec_params(sql, [])
    output = []

    result.each { |item| 
      post = Post.new
      post.id = item["id"]
      post.title = item["title"]
      post.content = item["content"]
      post.comments = item["comments"]

      output << post
    }
    return output
  end

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    post = Post.new
    post.id = result.first["id"]
    post.title = result.first["title"]
    post.content = result.first["content"]
    post.comments = result.first["comments"]

    return post
  end
  
  def find_with_comments(id)
    output = []
    sql = 'SELECT comments.id AS comments_id, comments.name, comments.comment, comments.post_id,
    posts.id AS posts_id, posts.title, posts.content
    FROM comments JOIN posts on comments.post_id = posts.id
    WHERE posts.id = $1'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)

    post = Post.new
    post.id = result.first["id"]
    post.title = result.first["title"]
    post.content = result.first["content"]
    # post.comments = result.first["comments"]
    result.each { |item| 
      comment = Comment.new
      comment.id = item["comments_id"]
      comment.name = item["name"]
      comment.comment = item["comment"]
      comment.post_id = item["post_id"]
      post.comments << comment
    }
    return post
  end

end