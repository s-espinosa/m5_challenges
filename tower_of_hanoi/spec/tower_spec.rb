require 'rspec'
require './lib/tower'

describe Tower do
  it 'can move a single disc to a target' do
    mild = {"A" => [1], "B" => [], "C" => []}
    t = Tower.new(mild)
    t.move!

    expect(t.posts).to eq({"A" => [], "B" => [], "C" => [1]})
  end


  it 'can move two discs to a target' do
    medium = {"A" => [2, 1], "B" => [], "C" => []}
    t = Tower.new(medium)
    t.move!

    expect(t.posts).to eq({"A" => [], "B" => [], "C" => [2, 1]})
  end

  it 'can move three discs to a target' do
    spicy = {"A" => [3, 2, 1], "B" => [], "C" => []}
    t = Tower.new(spicy)
    t.move!

    expect(t.posts).to eq({"A" => [], "B" => [], "C" => [3, 2, 1]})
  end

  it 'can move four discs to a target' do
    start = {"A" => [4, 3, 2, 1], "B" => [], "C" => []}
    t = Tower.new(start)
    t.move!

    expect(t.posts).to eq({"A" => [], "B" => [], "C" => [4, 3, 2, 1]})
  end

  it 'can move ten discs to a target' do
    start = {"A" => [10, 9, 8, 7, 6, 5, 4, 3, 2, 1], "B" => [], "C" => []}
    t = Tower.new(start)
    t.move!

    expect(t.posts).to eq({"A" => [], "B" => [], "C" => [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]})
  end

  it 'can create a goal for itself' do
    input = [4, 2, 1]
    output = [2, 1]
    tower = Tower.new

    expect(tower.identify_goal(input)).to eq(output)
  end

  it 'can determine if discs can move between posts' do
    tower = Tower.new({"A" => [4, 1], "B" => [2], "C" => []})

    expect(tower.can_move?("A", "B")).to be(true)
    expect(tower.can_move?("A", "C")).to be(true)
    expect(tower.can_move?("B", "C")).to be(true)
    expect(tower.can_move?("B", "A")).to be(false)
    expect(tower.can_move?("C", "A")).to be(false)

    tower.move_single("A", "C")

    expect(tower.can_move?("C", "A")).to be(true)
  end
end


