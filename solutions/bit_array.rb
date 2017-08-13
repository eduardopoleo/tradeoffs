def unique_with_bit_array(s)
  vector = 0
  l = s.size

  s.each_char do |char|
    code = char.ord

    if (vector & (1 << code)) > 0
      return false
    end

    vector |= (1 << code)
  end

  return true
end
