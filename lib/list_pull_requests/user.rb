class ListPullRequests::User
  attr_accessor :name, :all, :merged

  def initialize(name)
    @name = name
  end

  def get_all
    @all = create_prs("https://api.github.com/search/issues?q=is:pr+author:#{name}")
    # binding.pry
  end

  def get_merged
    @merged = create_prs("https://api.github.com/search/issues?q=is:merged+author:#{name}")
    # binding.pry
  end

  def create_prs(url)
    JSON.parse(open(url).read)["items"].collect do |pr|
      ListPullRequests::Pr.new(pr["pull_request"]["url"], pr["html_url"], pr["title"], pr["created_at"])
    end
  end

end
