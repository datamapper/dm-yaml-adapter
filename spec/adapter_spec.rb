require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec', 'spec_helper'))

require 'dm-core/spec/adapter_shared_spec'

describe DataMapper::Adapters::YamlAdapter do
  before :all do
    yaml_db = "#{DB_DIR}/primary_yaml"
    FileUtils.rm_r(yaml_db)
    
    @adapter    = DataMapper.setup(:default, "yaml://#{yaml_db}")
    @repository = DataMapper.repository(@adapter.name)
  end
  
  it_should_behave_like "An Adapter"
end
