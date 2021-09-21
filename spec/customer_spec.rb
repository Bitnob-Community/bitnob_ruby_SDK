# frozen_string_literal: true

require 'spec_helper'
require 'bitnob'

RSpec.describe Customer do
  it 'creates a new Bitnob base object' do
    new_nob = described_class.new
    expect(new_nob.nil?).to eq false
  end
end
