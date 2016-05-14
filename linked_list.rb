class Node
  attr_accessor :value, :next, :prev

  def initialize(node)
    @value = node
  end
end


class LinkedList
  attr_accessor :size, :first

  def initialize
    @size = 0
    @first = nil
  end

  def insert(data)
    new_node = Node.new(data)
    if @first.nil?
      @first = new_node
    elsif data < @first.value
      @first.prev = new_node
      new_node.next = @first
      @first = new_node
    else
      node = search(data)
      new_node.prev = node
      new_node.next = node.next
      node.next = new_node
    end
    @size += 1
  end

  def delete(data)
    node = search(data)
    node.prev.next = node.next
    node.next.prev = node.prev
    @size -= 1
  end

  def search(data)
    node = @first
    while !node.nil?
      return node if node.value == data
      return node if node.value < data && (node.next.nil? || node.next.value > data )
      node = node.next
    end
  end

  def toString
    node = @first
    if size == 1
      puts node.value
    else
      while !node.nil?
        print node.value
        node = node.next
        print " <-> " if !node.nil?
      end
      puts ""
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  l = LinkedList.new
  l.insert("hello")
  l.insert("ace")
  l.insert("run")
  l.toString
  l.delete("hello")
  l.toString
  l.insert("hello")
  l.toString
end
Status API Training Shop Blog About
© 2016 GitHub, Inc. Terms Privacy Security Contact Help
