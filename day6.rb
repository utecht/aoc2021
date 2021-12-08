#!/usr/bin/env ruby


all_fish = Array.new(9, 0)
day_count = 256

File.read('inputs/6').split(',') do | fish |
	all_fish[fish.to_i] += 1
end

day_count.times do
	births = all_fish.shift
	all_fish[6] += births
	all_fish.push births
end

puts all_fish.sum