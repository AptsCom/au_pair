require 'spec_helper'

describe AuPair::AuthenticationToken do

  context 'token validation from config' do

    before do
      AuPair.configure{ |config| config.tokens = [{:vendor => 'foo', :key => '1234'}, {:vendor => 'bar', :key => '5678'}]}
    end

    it 'identifies a valid token' do
      expect(AuPair::AuthenticationToken.validate('foo', '1234')).to be_true
    end

    it 'detects an invalid token' do
      expect(AuPair::AuthenticationToken.validate('foo', '5678')).to be_false
    end

  end

end
