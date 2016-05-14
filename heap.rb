class Heap
  attr_reader :min, :heap, :size

  def initialize(min = true)
    @heap = Array.new(1)
    @size = 0
    @min = min
  end

  def peek
    @heap[1]
  end

  def pop
    if !self.is_empty?
      result = @heap[1]
      delete(1)
    end

    result
  end

  def insert(value)
    @heap[size + 1] = value
    heapify_up(size + 1)
    @size += 1

    nil
  end

  def size
    @size
  end

  def is_empty?
    @size == 0
  end

  private

  def delete(idx)
    @heap[idx] = @heap[size]
    @heap[size] = nil
    @size -= 1
    heapify_down(idx)

    nil
  end

  def heapify_up(idx)
    if idx > 1
      parent_idx = parent(idx)
      value = @min ? @heap[idx] < @heap[parent_idx] : @heap[idx] > @heap[parent_idx]
      if value
        @heap[idx], @heap[parent_idx] = @heap[parent_idx], @heap[idx]
        heapify_up(parent_idx)
      end
    end

    nil
  end

  def heapify_down(idx)
    if 2 * idx > size
      return
    elsif 2* idx < size
      value = @min ?  @heap[left_child_idx(idx)] < @heap[right_child_idx(idx)] :
                      @heap[left_child_idx(idx)] > @heap[right_child_idx(idx)]
      idx2 = value ? left_child_idx(idx) : right_child_idx(idx)
    else
      idx2 = 2 * idx
    end
    value2 = @min ? @heap[idx2] < @heap[idx] : @heap[idx2] > @heap[idx]
    if value2
      @heap[idx], @heap[idx2] = @heap[idx2], @heap[idx]
      heapify_down(idx2)
    end

    nil
  end

  def left_child_idx(index)
    2 * index
  end

  def right_child_idx(index)
    2 * index + 1
  end

  def parent(index)
    index / 2
  end
end
