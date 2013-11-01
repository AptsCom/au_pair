class AuPair::ApiConstraint

  attr_accessor :numeric_version

  def initialize(path_part)
    @path_part = path_part.downcase
    @numeric_version = path_part.gsub(/.?([0-9]+)/, "\\1").to_i
  end

  def matches?(request)
    path_matches?(request) || header_matches?(request) || param_matches?(request)
  end

  private

  def path_matches?(request)
    request.path =~ /\/#{@path_part}\//
  end

  def header_matches?(request)
    request.headers['x-api-version'] =~ /[^0-9]*#{@numeric_version}$/
  end

  def param_matches?(request)
    request.request_parameters["api_version"].to_i == numeric_version || request.query_parameters["api_version"].to_i == numeric_version
  end

end
