#
# Cookbook Name:: spg-mongodb
# Spec:: setup
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'pg-mongodb::setup' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

  end
end
