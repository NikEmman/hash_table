# frozen_string_literal: true

# node
class Node
  attr_accessor :key, :value, :pointer

  def initialize(key = nil, value = nil, pointer = nil)
    @key = key
    @value = value
    @pointer = pointer
  end
end
