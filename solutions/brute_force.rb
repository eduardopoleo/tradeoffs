def unique_brute_force(s)
  l = s.size

  for i in 0...l
    current_char = s[i]
    for j in (i + 1)...l
      return false if current_char == s[j]
    end
  end

  return true
end
