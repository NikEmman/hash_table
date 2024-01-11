# frozen_string_literal: true

require_relative 'linked_list'

# hash map
class HashMap
  attr_accessor :array

  def initialize
    @array = [] # Array.new(@capacity) { LinkedList.new }
    @load_factor = 0.75
    @capacity = 16
  end

  def check_load
    temp = 0.0
    @array.each { |list| temp += 1 unless list.head.nil? }
    @capacity *= 2 if temp / @capacity > @load_factor
  end

  def hash(string)
    hash_code = 0
    prime_number = 47
    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code % @capacity
  end

  def set(key, value)
    check_load
    @array[hash(key)] = LinkedList.new if @array[hash(key)].nil?

    @array[hash(key)].append(key, value)
  end

  def get(key)
    @array[hash(key)].contains?(key) ? @array[hash(key)].find(key) : nil
  end
end

a = HashMap.new
a.set('Nick', 'friend')
