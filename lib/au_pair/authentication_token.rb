class AuPair::AuthenticationToken

  def self.valid?(key, vendor)
    AuPair.tokens[vendor] == key
  end

end