require "au_pair/version"
require "au_pair/authentication_token"
require "au_pair/authenticates"
require 'au_pair/api_constraint'

module AuPair 

  def self.configure(&block)
    @config = Configuration.new
    yield(config)
  end

  def self.config
    @config || Configuration.new
  end

  def self.tokens
    config.tokens
  end

  class Configuration
    attr_accessor :tokens
  end

end