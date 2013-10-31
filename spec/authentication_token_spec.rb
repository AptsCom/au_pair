require 'spec_helper'

describe AuPair::AuthenticationToken do

  context 'token validation from config' do

    before do
      AuPair.configure{ |config| config.tokens = {'foo' => '1234', 'bar' => '5678'} }
    end

    it 'identifies a valid token' do
      expect(AuPair::AuthenticationToken.valid?('1234', 'foo')).to be_true
    end

    it 'detects an invalid token' do
      expect(AuPair::AuthenticationToken.valid?('4567', 'foo')).to be_false
    end

  end

end