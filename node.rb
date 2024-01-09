# frozen_string_literal: true

# node
class Node
  attr_accessor :value, :pointer

  def initialize(value = nil, pointer = nil)
    @value = value
    @pointer = pointer
  end
end
