require './lib/tower'

mild = {"A" => [1], "B" => [], "C" => []}
t = Tower.new(mild)
t.move!
puts t.posts

medium = {"A" => [2, 1], "B" => [], "C" => []}
t = Tower.new(medium)
t.move!
puts t.posts

spicy = {"A" => [3, 2, 1], "B" => [], "C" => []}
t = Tower.new(spicy)
t.move!
puts t.posts


