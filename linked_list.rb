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

  def prepend(value)
    @head = @head.nil? ? Node.new(value) : Node.new(value, @head)
  end

  def append(value)
    if @head.nil?
      prepend(value)
    else
      tail.pointer = Node.new(value)
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
    found = false
    loop do
      if temp.value == value
        found = true
        break
      else
        temp = temp.pointer
      end
      break if temp.pointer.nil?
    end
    found = true if tail.value == value
    found
  end

  def find(value) # modify to return value, not counter
    temp = @head
    counter = 0
    until temp.pointer.nil?
      break if temp.value == value

      temp = temp.pointer
      counter += 1

    end
    counter = nil unless contains?(value)
    counter
  end
end
