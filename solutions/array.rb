def array(s)
  l = s.size
  return false if l > 128

  char_set = Array.new(128)

  for i in 0...l
    code = s[i].ord
    return false if char_set[code]

    char_set[code] = true
  end

  return true
end
