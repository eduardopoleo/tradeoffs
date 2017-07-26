def bit_array(s)
  vector = 0
  l = s.size

  for i in 0...l
    code = s[i].ord
    if (vector & (1 << code)) > 0
      return false
    end

    vector |= (1 << code)
  end

  return true
end
