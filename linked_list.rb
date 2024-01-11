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

  def prepend(value, data)
    @head = @head.nil? ? Node.new(value, data) : Node.new(value, data, @head)
  end

  def append(value, data)
    if @head.nil?
      prepend(value, data)
    else
      tail.pointer = Node.new(value, data)
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

  def at(index)
    counter = 0
    temp = @head
    until counter === index
      counter += 1
      temp = temp.pointer
    end
    temp
  end

  def pop
    at((size - 2)).pointer = nil
  end

  def contains?(value)
    temp = @head
    while temp
      return true if temp.value == value

      temp = temp.pointer
    end
    false
  end

  def find(value)
    temp = @head
    until temp.pointer.nil?
      break if temp.value == value

      temp = temp.pointer
    end
    temp.data
  end
end
