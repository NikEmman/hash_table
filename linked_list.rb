# frozen_string_literal: true

require_relative 'node'

# linked list
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    temp = @head
    temp = temp.pointer until temp.pointer.nil?
    temp
  end

  def values
    values = []
    temp = @head
    while temp
      values.push(temp.value)
      temp = temp.pointer
    end
    values
  end

  def prepend(key, value)
    @head = @head.nil? ? Node.new(key, value) : Node.new(key, value, @head)
  end

  def append(key, value)
    if @head.nil?
      prepend(key, value)
    else
      tail.pointer = Node.new(key, value)
    end
  end

  def size
    counter = 0
    unless @head.nil?
      counter = 1
      temp = @head
      until temp.pointer.nil?
        temp = temp.pointer
        counter += 1
      end
    end
    counter
  end

  def contains?(key)
    temp = @head
    while temp
      return true if temp.key == key

      temp = temp.pointer
    end
    false
  end

  def find(key)
    temp = @head
    until temp.pointer.nil?
      break if temp.key == key

      temp = temp.pointer
    end
    temp
  end

  def delete(key)
    temp = @head
    if temp.key == key
      @head = temp.pointer
    else
      until temp.pointer.nil?
        break if temp.pointer.key == key

        temp = temp.pointer
      end
      temp.pointer = temp.pointer.pointer
    end
  end

  def get_pairs
    pairs = []
    current = @head
    while current
      temp_arr = []      
      temp_arr.push(current.key)
      temp_arr.push(current.value)
      pairs.push(temp_arr)
      current = current.pointer
    end
    pairs
  end
end
