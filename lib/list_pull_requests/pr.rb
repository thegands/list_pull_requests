class ListPullRequests::Pr
  attr_accessor :api_url, :url, :name, :created, :repo, :number, :mergeable, :merged, :merged_by

  def initialize(api_url, url, name, created)
    @api_url, @url, @name, @created = api_url, url, name, created
    split_url = url.split("/")
    @repo = split_url.fetch(-3)
    @number = split_url.last
  end

  def lookup
    unless @looked_up
      puts "Retrieving pull details....".red
      details = JSON.parse(open(api_url).read)
      @mergeable = details["mergeable"]
      @merged = details["merged_at"]
      @merged_by = details["merged_by"]["login"] if details["merged_by"]
      @looked_up = true
    end
  end

end
