module AuPair::RouteExtensions

  def with_api_version(version, &block)
    constraints(AuPair::ApiConstraint.new(version)){ yield }
  end

end

class ActionDispatch::Routing::Mapper::Resources
  include AuPair::RouteExtensions
end