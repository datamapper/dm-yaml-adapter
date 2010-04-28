require 'spec_helper'

require 'dm-core'
require 'dm-core/spec/shared/adapter_spec'

require 'dm-migrations'
require 'dm-yaml-adapter/spec/setup'

ENV['ADAPTER']          = 'yaml'
ENV['ADAPTER_SUPPORTS'] = 'all'

DataMapper::Spec.setup

describe 'DataMapper::Adapters::YamlAdapter' do

  before :all do
    @adapter    = DataMapper::Spec.adapter
    @repository = DataMapper.repository(@adapter.name)
  end

  it_should_behave_like "An Adapter"

end
