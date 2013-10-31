module AuPair::Authenticates

  def token_header
    request.headers['x-api-token'] || params[:api_token]
  end

  def vendor_name_header
    request.headers['x-api-vendor'] || params[:api_vendor]
  end

  def authenticate!
    return true if AuPair::AuthenticationToken.valid?(token_header, vendor_name_header)
    render(:json => {'error' => 'Invalid authentication token.'}, :status => 401) and return
  end

end
