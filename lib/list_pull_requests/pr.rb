class ListPullRequests::Pr
  attr_accessor :name, :url, :api_url, :mergeable, :merged, :created

  def initialize(url, api_url, name, created)
    @url, @api_url, @name, @created = url, api_url, name, created
  end

  def load(url, api_url, name)
    new(url, api_url, name)
  end
end
