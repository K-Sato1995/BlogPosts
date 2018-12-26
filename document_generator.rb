require 'httparty'
require 'json'

url = 'https://k-blog0130.herokuapp.com/en/api/v1/posts'
# Get the response
response = HTTParty.get(url, format: :plain)
# Make it json
json_data = JSON.parse(response, symbolize_names: true)
# Make it easier to work with.
posts_array = json_data[:data]

# Iterate and create files
posts_array.each do |post|
  f = File.open("#{post[:title].split(' ').join('-')}.md", 'w')
  f.puts "#{post[:context]}"
end
