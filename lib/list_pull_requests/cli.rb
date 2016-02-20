class ListPullRequests::CLI

  def call
    puts "works!"
    get_pr
  end

  def get_pr
    ListPullRequests::User.new("thegands").get_merged
  end

end
