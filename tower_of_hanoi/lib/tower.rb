class Tower
  attr_reader :posts
  def initialize(posts = {"A" => [3,2,1], "B" => [], "C" => []})
    @posts = posts
  end

  def move!(from = "A", to = "C", extra = "B")
    move_single("A", "B")
    move_single("A", "C")
    move_single("B", "C")
    move_single("A", "B")
    move_single("C", "A")
    move_single("C", "B")
    move_single("A", "B")
    move_single("B", "C")
    move_single("B", "A")
    move_single("C", "A")
    move_single("B", "C")
    move_single("A", "B")
    move_single("A", "C")
    move_single("B", "C")
  end

  def move_single(from, to)
    to_move = @posts[from].pop
    @posts[to].push(to_move)
  end
end

