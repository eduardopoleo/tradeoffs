def unique_brute_force(s)

  s.each_char.with_index do |char1, i|
    s2 = s[i+1..-1]

    s2.each_char do |char2|
      return false if char1 == char2
    end
  end

  return true
end
