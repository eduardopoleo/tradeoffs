require 'benchmark'
require 'objspace'
require_relative './solutions/brute_force'
require_relative './solutions/hash'
require_relative './solutions/array'
require_relative './solutions/bit_array'
require_relative './solutions/web_developer'

s = (0..127).map { |i| i.chr }.join

Benchmark.bm do |x|
  x.report("Brute Force:") { 100_000.times { brute_force(s) } }
  x.report("Hash:") { 100_000.times { hash(s) } }
  x.report("Array:") { 100_000.times { array(s) } }
  x.report("Bit Array:") { 100_000.times { bit_array(s) } }
  x.report("Web Developer:") { 100_000.times { web_developer(s) } }
end

hash = {}
s.each_char {|c| hash[c] = true }
p ObjectSpace.memsize_of(hash) # => 6488

array = [true] * 128
p ObjectSpace.memsize_of(array) #=> 1064

big_number = ("1" * 128).to_i(2)
p ObjectSpace.memsize_of(big_number) #=> 40

array = s.split("")
p ObjectSpace.memsize_of(array) * 2 #=> 2128
