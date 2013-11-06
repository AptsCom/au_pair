class AuPair::ApiConstraint

  attr_accessor :numeric_version, :path_part

  def initialize(path_part)
    @path_part = path_part.downcase
    @numeric_version = path_part.gsub(/.?([0-9]+)/, "\\1").to_i
  end

  def matches?(request)
    path_matches?(request) || header_matches?(request) || param_matches?(request)
  end

  def path_matches?(request)
    request.path =~ /\/#{@path_part}\//i
  end

  def header_matches?(request)
    request.headers['api-version'] =~ /^[^\d]*#{numeric_version}$/
  end

  def param_matches?(request)
    request.request_parameters["api_version"].to_i == numeric_version || request.query_parameters["api_version"].to_i == numeric_version
  end

end
