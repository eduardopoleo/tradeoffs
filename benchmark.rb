require 'benchmark'
require 'objspace'
require_relative './solutions/brute_force'
require_relative './solutions/hash'
require_relative './solutions/array'
require_relative './solutions/bit_array'
require_relative './solutions/web_developer'

sample_sizes = [10, 100, 500, 1000, 2000, 10_000, 20_000, 40_000]

def build_string(size)
  # creates a string of unique charaters for the size given based on their
  # UTF_8 code
  (0..size).reduce('') { |memo, number| memo += number.chr(Encoding::UTF_8) }
end

Benchmark.bm do |x|
  sample_sizes.each do |sample_size|
    s = build_string(sample_size)

    x.report("Brute Force: with #{sample_size}") { 1_000.times { |i| unique_brute_force(s) } }
    x.report("Array: with #{sample_size}") { 1_000.times { unique_with_array(s) } }
    x.report("Hash: with #{sample_size}") { 1_000.times { unique_with_hash(s) } }
    x.report("Bit Array: with #{sample_size}") { 1_000.times { unique_with_bit_array(s) } }
    x.report("Web Developer: with #{sample_size}") { 1_000.times { unique_web_developer(s) } }
  end
end

biggest_string = build_string(40_000)

hash = {}
biggest_string.each_char {|c| hash[c] = true }
p "Hash size: #{ObjectSpace.memsize_of(hash)}" # => 1,985,672

array = [true] * 40_000
p "Array size: #{ObjectSpace.memsize_of(array)}" #=> 320,040
#
big_number = ("1" * 40_000).to_i(2)
p "Big number size: #{ObjectSpace.memsize_of(big_number)}" #=> number = 5040
#
