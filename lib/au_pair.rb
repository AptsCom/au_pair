require "au_pair/version"
require "au_pair/authentication_token"
require "au_pair/route_extensions"
require "au_pair/authenticates"
module AuPair 

  def self.configure(&block)
    @config = Configuration.new
    yield(config)
  end

  def self.config
    @config || Configuration.new
  end

  def self.tokens
    config.tokens.map(&:values).inject({}) { |h,pair| h[pair[0]] = pair[1]; h}
  end

  class Configuration
    attr_accessor :tokens
  end

end