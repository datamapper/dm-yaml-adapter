require 'spec_helper'

require 'dm-core'
require 'dm-core/spec/shared/adapter_spec'

require 'dm-migrations'
require 'dm-yaml-adapter/spec/setup'

ENV['ADAPTER']          = 'yaml'
ENV['ADAPTER_SUPPORTS'] = 'all'

describe 'DataMapper::Adapters::YamlAdapter' do

  let(:adapter)    { DataMapper::Spec.adapter }
  let(:repository) { DataMapper.repository(adapter.name) }

  it_should_behave_like 'An Adapter'

end
