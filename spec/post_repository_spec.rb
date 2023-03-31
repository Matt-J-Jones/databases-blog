require 'post_repository'

RSpec.describe PostRepository do
  def reset_blog_table
    seed_sql = File.read('spec/seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_test'})
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_blog_table
  end

  it "returns all blog posts" do
    repo = PostRepository.new
    post_list = repo.all
    output = []
    post_titles = [
      "Why Walking is Good for Your Health",
      "The Benefits of Meditation",
      "How to Improve Your Productivity",
      "Tips for Better Sleep",
      "10 Easy Recipes for a Busy Week"
    ]
    post_list.each { |post|
      output << post.title
    }

    expect(output.length).to eq 5
    expect(output).to eq post_titles

  end

  it "returns a single post" do
    repo = PostRepository.new
    output = repo.find(2)
    expect(output.title).to eq "The Benefits of Meditation"
    expect(output.content).to eq "Increase focus and reduce anxiety."
  end

  it "returns post with comments" do
    repo = PostRepository.new
    output = repo.find_with_comments(2)
    expect(output.title).to eq "The Benefits of Meditation"
    expect(output.content).to eq "Increase focus and reduce anxiety."
    comments = [
      ['Olivia_Garcia', 'Love it!', '2'],
      ['Mia_Rodriguez', 'Could be better', '2'],
      ['Daniel_Anderson', 'Helpful tips', '2']
    ]
    expect(output.comments[0].comment).to eq comments[0][1]
    expect(output.comments[1].comment).to eq comments[1][1]
    expect(output.comments[2].comment).to eq comments[2][1]
  end
end