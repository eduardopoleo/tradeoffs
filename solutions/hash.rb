def hash(s)
  characters = {}
  l = s.size

  for i in 0...l
    return false if characters[s[i]]

    characters[s[i]] = true
  end

  return true
end
