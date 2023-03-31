require 'post_repository'

RSpec.describe PostRepository do
  def reset_blog_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_test'})
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_blog_table
  end

  xit "returns all blog posts" do
    #
  end

  xit "returns a single post" do
    #
  end

  xit "adds post" do
    #
  end

  xit "deletes post" do
    #
  end

  xit "returns post with comments" do
    #
  end
end