require 'spec_helper'

describe AuPair::AuthenticationToken do

  context 'token validation from config' do

    before do
      AuPair.configure{ |config| config.tokens = {'foo' => '1234', 'bar' => '5678'} }
    end

    it 'invalidates if vendor is nil' do
      expect(AuPair::AuthenticationToken.valid?(nil, nil)).to be_false
    end

    it 'identifies a valid token' do
      expect(AuPair::AuthenticationToken.valid?('1234', 'foo')).to be_true
    end

    it 'detects an invalid token' do
      expect(AuPair::AuthenticationToken.valid?('4567', 'foo')).to be_false
    end

    it 'detects an invalid vendor' do
      expect(AuPair::AuthenticationToken.valid?('4567', 'food')).to be_false
    end

    it 'detects an invalid vendor even when token is nil' do
      expect(AuPair::AuthenticationToken.valid?(nil, 'food')).to be_false
    end

  end

  context 'when authentication is disabled' do

    before do
      AuPair.configure{ |config| config.authentication_disabled = true}
    end

    it 'should authenticate request even when no token is provided' do
      expect(AuPair::AuthenticationToken.valid?(nil, nil)).to be_true
    end

  end

end