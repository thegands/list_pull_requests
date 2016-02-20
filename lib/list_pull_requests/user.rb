class ListPullRequests::User
  attr_accessor :name, :all

  def initialize(name)
    @name = name
    @all = []
  end

  def get_all
    result = create_prs("https://api.github.com/search/issues?per_page=100&q=is:pr+author:#{name}")
    # binding.pry
  end

  def get_merged
    create_prs("https://api.github.com/search/issues?per_page=100&q=is:merged+author:#{name}")
    # binding.pry
  end

  def get_unmerged
    create_prs("https://api.github.com/search/issues?per_page=100&q=is:unmerged+author:#{name}")
    # binding.pry
  end

  def create_prs(url)
    puts "Retrieving list of pulls....".red
    page = 1
    begin
      json = JSON.parse(open(url + "&page=#{page}").read)
      amount ||= json["total_count"]
      json["items"].each do |pr|
        all << ListPullRequests::Pr.new(pr["pull_request"]["url"], pr["html_url"], pr["title"], pr["created_at"])
      end
      page += 1
    end until all.count == amount
    all
  end

end
