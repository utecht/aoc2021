#!/usr/bin/env ruby


all_fish = Array.new(9, 0)
day_count = 256

File.read('inputs/6').split(',') do | fish |
	all_fish[fish.to_i] += 1
end

while day_count > 0
	new_fish = Array.new(9, 0)
	all_fish.each_index do | i |
		new_target = i - 1
		if new_target < 0
			new_target = 6
			new_fish[8] += all_fish[i]
		end
		new_fish[new_target] += all_fish[i]
	end
	all_fish = new_fish
	# puts all_fish.join(',')
	day_count -= 1
end

puts all_fish.sum