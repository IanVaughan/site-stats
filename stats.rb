require 'sinatra'
require 'json'

stats = { nmt: 4807, mods: 35221, interactions: 211330, sites: 7601, members: 11987246 }

counter = Thread.new(stats) do |s|
  loop do
    s[:nmt] += 4
    s[:mods] += 3
    s[:interactions] += 1
    s[:sites] += 0
    s[:members] += 4

    sleep 1
  end
end

get '/' do
  content_type :json
  stats.to_json
end

# 10.times {
#    puts stats
# sleep 1}
