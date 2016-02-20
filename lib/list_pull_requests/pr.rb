class ListPullRequests::Pr
  attr_accessor :name, :url, :api_url, :repo, :number, :mergeable, :merged, :created, :merged_by

  def initialize(api_url, url, name, created)
    @api_url, @url, @name, @created = api_url, url, name, created
    split_url = url.split("/")
    @repo = split_url.fetch(-3)
    @number = split_url.last
  end

end
