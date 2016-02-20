class ListPullRequests::CLI

  def call
    puts "I list a GitHub user's pull requests!"
    puts "Please type the user name:"
    @username = gets.strip
    puts "What kind of pull requests would you like? (all/merged/unmerged):"
    @request_type = gets.strip
    case @request_type
    when "all"
      list_prs(pulls = ListPullRequests::User.new("thegands").get_all)
      pr_details(pulls)
    when "merged"
      list_prs(pulls = ListPullRequests::User.new("thegands").get_merged)
      pr_details(pulls)
    when "unmerged"
      list_prs(pulls = ListPullRequests::User.new("thegands").get_unmerged)
      pr_details(pulls)
    end
  end

  def list_prs(prs)
    puts "#{@username} has #{prs.count} #{@request_type + " " unless @request_type == "all"}pull requests:"
    prs.each.with_index(1) do |pull, i|
      puts "#{i}." + "#{pull.repo} ##{pull.number}".cyan + " | " + "#{pull.name}".green + " | " + "#{pull.created}".yellow
    end
  end

  def pr_details(prs)
    puts "Enter a pull request number to see more details. Otherwise type exit:"
    input = gets.strip
    until input == "exit"
      if input == "list"
        list_prs(prs)
      elsif input.to_i < 1 || input.to_i > prs.count
        print "Invalid input. "
      else
        detail_pr = input.to_i-1
        prs[detail_pr].lookup
        puts "---"
        puts "#{prs[detail_pr].repo} ##{prs[detail_pr].number}".cyan
        puts "Titled:    " + "#{prs[detail_pr].name}".green
        puts "Created:   " + "#{prs[detail_pr].created}".yellow
        puts "URL:       " + "#{prs[detail_pr].url}".blue
        print "Merged:    "; puts prs[detail_pr].merged ? "#{prs[detail_pr].merged} by #{prs[detail_pr].merged_by}".magenta : "false".magenta
        puts "Mergeable: " + "#{prs[detail_pr].mergeable}".magenta unless prs[detail_pr].merged_by
        puts "---"
        puts ""
      end
      puts "Enter a pull request number to see more details. Otherwise type list or exit:"
      input = gets.strip
    end
  end

end

# String.colors = [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

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
