class ListPullRequests::CLI

  def call
    puts "I list a GitHub user's pull requests!"
    puts "Please type the user name:"
    username = gets.strip
    # puts "What kind of pull requests would you like? (all/merged/unmerged):"
    pulls = get_pr
    puts "#{username} has #{pulls.count} merged pull requests:"
    pulls.each.with_index(1) do |pull, i|
      puts "#{i}. #{pull.name} - #{pull.created}"
    end
  end

  def get_pr
    ListPullRequests::User.new("thegands").get_merged
  end

end

# Would you like to list Pull Requests for a user or for a repository? (user/repo):
# user

# Please type the user name:
# thegands

# What kind of pull requests would you like? (all/merged/unmerged):
# merged

# thegands has 4 merged pull requests:
# 1. <Pull request name> | <Pull request repository> pull request #<Pull request number> | <Created date>
# 2. etc...
# 3. etc...
# 4. etc...
# Enter a pull request number to see more details. Otherwise type exit:
# 1

# Details for <Pull request repository> pull request #<Pull request number>
# <Pull request name>
# Created:
# URL:
# Merged: <merged date> by <merged_by>
# Mergeable: (if not merged)
# Type list to list pull requests again. or type a number or exit:
# exit
