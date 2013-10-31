class AuPair::AuthenticationToken

  def self.valid?(key, vendor)
    puts vendor
    puts key
    AuPair.tokens[vendor] == key
  end

end