class ListPullRequests::CLI

  def call
    puts "works!"
    get_pr
  end

  def get_pr
    ListPullRequests::ListPr.new("thegands").all
  end

end
