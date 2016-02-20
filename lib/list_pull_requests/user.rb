class ListPullRequests::User
  attr_accessor :name, :all, :merged

  def initialize(name)
    @name = name
    @all = []
  end

  def get_all
    @all = create_prs("https://api.github.com/search/issues?per_page=100&q=is:pr+author:#{name}")
    # binding.pry
  end

  def get_merged
    @merged = create_prs("https://api.github.com/search/issues?per_page=100&q=is:merged+author:#{name}")
    # binding.pry
  end

  def get_unmerged
    @merged = create_prs("https://api.github.com/search/issues?per_page=100&q=is:unmerged+author:#{name}")
    # binding.pry
  end

  def create_prs(url)
    json = JSON.parse(open(url).read)
    amount = json["total_count"]
    json["items"].each do |pr|
      all << ListPullRequests::Pr.new(pr["pull_request"]["url"], pr["html_url"], pr["title"], pr["created_at"])
    end
    page = 2
    until all.count == amount
      JSON.parse(open(url + "&page=#{page}").read)["items"].each do |pr|
        all << ListPullRequests::Pr.new(pr["pull_request"]["url"], pr["html_url"], pr["title"], pr["created_at"])
      end
      page += 1
    end
    all
  end

end
