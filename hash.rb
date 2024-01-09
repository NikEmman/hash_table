# frozen_string_literal: true

require_relative 'linked_list'

# hash map
class HashMap
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

  def set(key, value) # check if key exists and if yes overwrite value
    check_load
    if @array[hash(key)].nil?
      @array[hash(key)] = LinkedList.new.append([key, value])
    else
      @array[hash(key)].append([key, value])
    end
  end

  def get(key)
    # check if key exists ? return [key,value] value : nil
  end
end
