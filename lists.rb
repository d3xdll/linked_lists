class LinkedLists
  attr_accessor :head, :tail
  @@list = []

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @@list << self
  end

  def prepend(value)
    new_node = Node.new(value)
    if !@head
      @head = new_node
      @tail = new_node
    else
      @head = Node.new(value, @head)
    end
    @@list << self
  end

  def self.size
    @@list.count
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    if index == 0
      @head.value
    else
      at_index = @head
      index.times do
        at_index = at_index.next_node
      end
    end
    p at_index.value
  end

  def pop
    node = @head
    index = @@list.length
    (index - 2).times do
      node = node.next_node
    end
    @tail = nil
    @tail = node
    @tail.next_node = nil
  end

  def containts?(value)
    cont = nil
    ObjectSpace.each_object(Node) do |obj|
      if obj.value == value
        cont = true
        break
      end
    end
    cont
  end

  def find(value)
    result = @head
    @@list.length.times do |n|
      if result.value == value
        return n
      end
      result = result.next_node
    end
    nil
  end

  def to_s
    arr = []
    first = @head
    @@list.length.times do
      arr << first.value
      first = first.next_node
    end
    arr
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

new_list = LinkedLists.new

new_list.append("23")
new_list.append('44')
new_list.prepend('45')
new_list.append('15')
p new_list.to_s