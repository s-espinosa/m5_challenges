require 'colorize'

class Tower
  attr_reader :posts
  def initialize(posts = {"A" => [3,2,1], "B" => [], "C" => []})
    @posts = posts
  end

  def move!(from = "A", to = "C", extra = "B")
    goal = identify_goal(@posts[from])
    goal_length = goal.length

    until @posts[to][-goal_length..-1] == goal
      if can_move?(from, extra)
        move_single(from, extra)
      elsif can_move?(from, to)
        move_single(from, to)
      elsif can_move?(extra, to)
        move_single(extra, to)
      else
        move!(to, from, extra)
        move_single(extra, to)
      end
    end
  end

  def move_single(from, to)
    to_move = @posts[from].pop
    @posts[to].push(to_move)
  end

  def can_move?(from, to)
    @posts[from].last != nil &&
      (
        @posts[to].last == nil ||
        @posts[from].last < @posts[to].last
      )
  end

  def identify_goal(sorted_array)
    start = 0
    i = 0

    until i == sorted_array.length - 1
      if (sorted_array[i] - sorted_array[i + 1]) > 1
        start = i + 1
      end
      i = i + 1
    end

    sorted_array[start..-1].dup
  end
end

