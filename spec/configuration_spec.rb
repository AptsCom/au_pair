require 'spec_helper'

describe AuPair do

  it 'accepts tokens as part of its configuration' do
    tokens = [{'foo' => '1234'}]
    AuPair.configure{ |config| config.tokens = tokens }
    expect(AuPair.config.tokens).to eq tokens
  end

  it 'accepts an option to disable authentication as part of its configuration' do
    AuPair.configure{ |config| config.authentication_disabled = true }
    expect(AuPair.authentication_disabled?).to be_true
  end

end