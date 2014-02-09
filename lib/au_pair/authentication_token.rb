class AuPair::AuthenticationToken

  def self.valid?(key, vendor)
    return false unless key
    AuPair.tokens[vendor] == key
  end

end