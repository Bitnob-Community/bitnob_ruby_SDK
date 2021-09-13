require 'spec_helper'
require 'bitnob.rb'

bitnob_test_secret_key = 'sk.ce348.f927bbae9cdae28b642d599fb0'
fake_secret_key = 'sk-cerjjkkl49003-xxx'

RSpec.describe Bitnob do 
    it "should create a new Bitnob base object" do 
        new_nob = Bitnob.new(bitnob_test_secret_key)
        expect(new_nob.nil?).to eq false
    end

    it "should throw a bad key error if an invalid secret key is passed"  do
        begin
            new_nob = Bitnob.new(fake_secret_key) 
        rescue => e 
            p e
            expect(e.instance_of? BitnobBadKeyError ).to eq true 
        end
    end

    it "should return the sandbox url if the production is false" do
        new_nob = Bitnob.new(bitnob_test_secret_key, false)
        expect(new_nob.base_url).to eq(BaseEndpoints::BITNOB_SANDBOX_URL)
    end

    it "should return the live url if the production is true" do
        new_nob = Bitnob.new(bitnob_test_secret_key, true)
        expect(new_nob.base_url).to eq(BaseEndpoints::BITNOB_LIVE_URL)
    end
end