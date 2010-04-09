require 'spec_helper'

require 'dm-core'
require 'dm-core/spec/adapter_shared_spec'

DB_DIR = File.expand_path('../db', __FILE__)

describe 'DataMapper::Adapters::YamlAdapter' do

  before :all do

    FileUtils.mkdir_p(DB_DIR)

    yaml_db     = "#{DB_DIR}/primary_yaml"
    @adapter    = DataMapper.setup(:default, "yaml://#{yaml_db}")
    @repository = DataMapper.repository(@adapter.name)

  end

  after :all do
    FileUtils.rm_r(DB_DIR)
  end
  
  it_should_behave_like "An Adapter"

end
