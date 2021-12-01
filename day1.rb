#!/usr/bin/env ruby

depth_increases = -1 
previous_depth = 0
File.open('inputs/1').each do | depth |
	depth_increases += 1 if depth.to_i > previous_depth
	previous_depth = depth.to_i
end

puts depth_increases

window = Array.new
previous_depth = 0
depth_increases = -1
current_window = 0
top_window = 0
roll_count = 0
File.open('inputs/1').each do | depth |
	3.times do |i|
		target_window = top_window - i
		window.push(0) if target_window >= window.length
		if target_window >= 0
			window[target_window] += depth.to_i
		end
	end
	top_window += 1
	roll_count += 1
	if roll_count == 3
		depth_increases += 1 if window[current_window] > previous_depth
		previous_depth = window[current_window]
		current_window += 1
		roll_count = 2
	end
end

puts depth_increases
