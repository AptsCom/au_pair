require 'spec_helper'

describe AuPair::ApiConstraint do

  class Request
    attr_accessor :path, :headers, :request_parameters, :query_parameters
  end

  let(:constraint) { AuPair::ApiConstraint.new("") }
  let(:request) { Request.new }

  before do
    constraint.stub(:request) { request }
    request.headers = {}
    request.request_parameters = {}
    request.query_parameters = {}
  end

  context 'path matching' do

    it 'matches with mixed text and numbers' do
      request.path = "/foo/version_1/bar"
      constraint.path_part = "version_1"
      expect(constraint.matches?(request)).to be_true
    end

  end

  context 'param matching' do

    it 'matches with numbers' do
      request.request_parameters['api_version'] = "1"
      constraint.numeric_version = 1
      expect(constraint.matches?(request)).to be_true
    end

  end

  context 'header matching' do

    it 'matches with mixed text and numbers' do
      request.headers['api-version'] = "version_1"
      constraint.numeric_version = "1"
      expect(constraint.matches?(request)).to be_true
    end

    it 'matches with numbers' do
      request.headers['api-version'] = "11"
      constraint.numeric_version = 11
      expect(constraint.matches?(request)).to be_true
    end

    it 'with no false positives' do
      request.headers['api-version'] = "1"
      constraint.numeric_version = 21
      expect(constraint.matches?(request)).to be_false
    end

  end

end
