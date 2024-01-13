# frozen_string_literal: true

require_relative 'linked_list'

# hash map
class HashMap
  attr_accessor :buckets

  def initialize
    @buckets = []
    @capacities = [16]
    @load_factor = 0.75
    @capacity = 16
  end

  def check_load
    counter = 0.0
    @buckets.each { |list| counter += 1 unless list.nil? }
    return unless counter / @capacity > @load_factor

    @capacity *= 2
    @capacities.push(@capacity)
  end

  def hash(string, capacity = @capacity)
    hash_code = 0
    prime_number = 47
    string.each_char { |char| hash_code = prime_number * hash_code + char.ord }
    hash_code % capacity
  end

  def set(key, value)
    check_load
    if find_bucket(key).nil?
      @buckets[hash(key)] = LinkedList.new if @buckets[hash(key)].nil?
      @buckets[hash(key)].append(key, value)
    else
      @buckets[find_bucket(key)].find(key).value = value
    end
  end

  def get(key)
    if key?(key)
      temp = @buckets[find_bucket(key)].find(key)
      temp.value
    else
      display_error
    end
  end

  def key?(key)
    return false if find_bucket(key).nil?

    @buckets[find_bucket(key)].contains?(key)
  end

  def remove(key)
    @buckets[find_bucket(key)].delete(key)
  end

  def display_error
    puts "Sorry, this key doesn't exist"
  end

  def find_bucket(key)
    temp = nil
    @capacities.each do |capacity|
      temp = hash(key, capacity) if @buckets[hash(key, capacity)]&.contains?(key)
    end
    temp
  end

  def length
    counter = 0
    @buckets.each { |list| counter += list.size unless list.nil? }
    counter
  end

  def clear
    @buckets = []
    @capacities = [16]
    @capacity = 16
  end

  def values
    values_array = []
    @buckets.each { |list| values_array.push(list.values) unless list.nil? }
    values_array.flatten
  end

  def entries
    entries = []
    @buckets.each { |list| entries.push(list.get_pairs) unless list.nil? }
    entries.flatten(1)
  end
end

a = HashMap.new
a.set('Nick', 'friend')
a.set('Van', 'wiz')
a.set('Bab', 'handyman')
a.set('Tal', 'sorc')
a.set('Bob', 'ferryman')
