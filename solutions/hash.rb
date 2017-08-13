def unique_with_hash(s)
  characters = {}

  s.each_char do |char|
    return false if characters[char]

    characters[char] = true
  end

  return true
end
