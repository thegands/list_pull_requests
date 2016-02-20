class ListPullRequests::ListPr
  attr_accessor :name

  def self.all
    JSON.parse(open("https://api.github.com/search/issues?q=author:thegands+is:merged").read)
  end
end
