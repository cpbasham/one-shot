def alphanumerals
  @ALPHANUMERALS ||= [*"0".."9"] + [*"A".."Z"]
end

def normalized_string(s)
  chars = s.downcase.chars
  chars.select! { |char| alphanumerals.include?(char) }
  chars.join("")
end

def normalized_match?(s1, s2)
  normalized_string(s1) == normalized_string(s2)
end