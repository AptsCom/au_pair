# Usage
#
#     class MyController 
#       incliude ApiVersioning:Authenticates
#       before_filter :authenticate!
#     end 
#

module AuPair::Authenticates

  def authentication_token
    ENV['AUTHENTICATION_TOKEN']
  end

  def token_header
    request.headers['x-api-token']
  end

  def vendor_name_header
    request.headers['x-api-vendor']
  end

  def authenticate!
    return true if ApiVersioning::AuthenticationToken.valid?(token_header, vendor_name_header)
    render(:json => {'error' => 'Invalid authentication token.'}, :status => 401) and return
  end

end