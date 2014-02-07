class AuPair::AuthenticationToken

  def self.valid?(key, vendor)
    return false unless vendor
    AuPair.tokens[vendor] == key
  end

end