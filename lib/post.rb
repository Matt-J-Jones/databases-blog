class Post
  attr_accessor :title, :content, :comments

  def initialize
    @comments = []
  end
  
end