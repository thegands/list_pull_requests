class ListPullRequests::User
  attr_accessor :name, :all, :merged

  def initialize(name)
    @name = name
  end

  def get_all
    @all = JSON.parse(open("https://api.github.com/search/issues?q=author:#{name}").read)
  end

  def get_merged
    @merged = JSON.parse(open("https://api.github.com/search/issues?q=author:#{name}+is:merged").read)
  end
end
