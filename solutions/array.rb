def unique_with_array(s)
  char_set = Array.new(l)

  s.each_char do |char|
    code = char.ord

    return false if char_set[code]

    char_set[code] = true
  end

  return true
end
