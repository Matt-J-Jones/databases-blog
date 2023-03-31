require_relative 'lib/post_repository'
require_relative 'lib/database_connection'

class Application
  
  def initialize(database_name, io = Kernel, post_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @post_repository = post_repository
  end

  def run
    print "Enter number of post to display: "
    choice = gets.chomp!
    output = @post_repository.find_with_comments(choice.to_i)

    puts "Post title: #{output.title}"
    puts "Post body: #{output.content}"
    puts "**Comments**"
    output.comments.each { |comment|
      puts "#{comment.name}: '#{comment.comment}'"
    }
  end
end

if __FILE__ == $0
  app = Application.new(
    'blog',
    Kernel,
    PostRepository.new
  )
  app.run
end