class Tower
  attr_reader :posts
  def initialize(posts = {"A" => [3,2,1], "B" => [], "C" => []})
    @posts = posts
  end

  def move!(from = "A", to = "C", extra = "B")
    if @posts["A"].length == 1
      move_single(from, extra)
      move_single(extra, to)
    elsif @posts["A"].lenght == 2
      move_single(from, extra)
      move_single(from, to)
      move_single(extra, to)
    elsif @posts["A"].length == 3
      move_single(from, extra)
      move_single(from, to)
      move_single(extra, to)
      move_single(from, extra)
      move_single(to, from)
      move_single(to, extra)
      move_single(from, extra)
      move_single(extra, to)
      move_single(extra, from)
      move_single(to, from)
      move_single(extra, to)
      move_single(from, extra)
      move_single(from, to)
      move_single(extra, to)
    end
  end

  def move_single(from, to)
    to_move = @posts[from].pop
    @posts[to].push(to_move)
  end
end

