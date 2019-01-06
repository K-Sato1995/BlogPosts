require 'httparty'
require 'json'

url = 'https://k-blog0130.herokuapp.com/en/api/v1/posts'
# Get the response
response = HTTParty.get(url, format: :plain)
# Make it json
json_data = JSON.parse(response, symbolize_names: true)
# Make it easier to work with and create README
posts_array = json_data[:data]
readme = File.open("README.md", 'w')
readme.puts "The posts on my [blog](https://k-blog0130.herokuapp.com/en).\n\n"
readme.puts "# The list of the posts\n\n"

# Iterate and create files
posts_array.each do |post|
  f = File.open("#{post[:title].split(' ').join('-')}.md", 'w')
  readme.puts "- [#{post[:title].split(' ').join('-')}.md](https://github.com/K-Sato1995/BlogPosts/blob/master/#{post[:title].split(' ').join('-')}.md)"
  f.puts "#{post[:context]}"
end

# Close README
readme.close
