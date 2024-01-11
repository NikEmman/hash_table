# frozen_string_literal: true

# node
class Node
  attr_accessor :value, :data, :pointer

  def initialize(value = nil, data = nil, pointer = nil)
    @value = value
    @data = data
    @pointer = pointer
  end
end
