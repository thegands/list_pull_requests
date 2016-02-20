class ListPullRequests::ListPr
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def all
    JSON.parse(open("https://api.github.com/search/issues?q=author:#{name}").read)
  end

  def merged
    JSON.parse(open("https://api.github.com/search/issues?q=author:#{name}+is:merged").read)
  end
end
