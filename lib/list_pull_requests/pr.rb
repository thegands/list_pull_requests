class ListPullRequests::Pr
  attr_accessor :name, :url, :api_url, :mergeable, :merged, :created

  def initialize(api_url, url, name, created)
    @api_url, @url, @name, @created = api_url, url, name, created
  end

  def load(url, api_url, name, created)
    new(url, api_url, name, created)
  end
end
