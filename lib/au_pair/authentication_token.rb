class AuPair::AuthenticationToken

  def self.valid?(key, vendor)
    return true if AuPair.authentication_disabled?
    return false unless key
    AuPair.tokens[vendor] == key
  end

end