class AuPair::AuthenticationToken

  def self.validate(vendor, key)
    AuPair.tokens[vendor] == key
  end

end