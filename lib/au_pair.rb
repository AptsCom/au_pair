require "api_versioning/version"
require "api_versioning/authentication_token"

module ApiVersioning

  def self.configure(&block)
    @config = Configuration.new
    yield(config)
  end

  def self.config
    @config || Configuration.new
  end

  class Configuration
    attr_accessor :tokens
  end

  def self.tokens
    config.tokens.map(&:values).inject({}) { |h,pair| h[pair[0]] = pair[1]; h}
  end

end