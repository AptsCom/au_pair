module AuPair::Authenticates

  def token
    request.headers['api-token'] || params[:api_token]
  end

  def vendor_name
    request.headers['api-vendor'] || params[:api_vendor]
  end

  def authenticate!
    return true if AuPair::AuthenticationToken.valid?(token, vendor_name)
    render(:json => {'error' => 'Invalid authentication token.'}, :status => 401) and return
  end

end
