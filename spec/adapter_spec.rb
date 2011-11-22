require 'spec_helper'

require 'dm-core'
require 'dm-core/spec/shared/adapter_spec'

require 'dm-migrations'
require 'dm-yaml-adapter/spec/setup'

ENV['ADAPTER']          = 'yaml'
ENV['ADAPTER_SUPPORTS'] = 'all'

describe 'DataMapper::Adapters::YamlAdapter' do

  before :all do
    @adapter    = DataMapper::Spec.adapter
    @repository = DataMapper.repository(@adapter.name)
  end

  it_should_behave_like 'An Adapter'

  describe 'A YAML database with one record deleted' do

    before :all do
      class ::Example
        include DataMapper::Resource

        property :id,   Serial
        property :name, String
      end

      DataMapper.finalize

      Example.all.destroy
      @obj1 = Example.create :name => 'alice'
      @obj2 = Example.create :name => 'bob'

      @obj1.destroy

      @obj3 = Example.create :name => 'cathy'
    end

    it 'should not have duplicate ids' do
      file = @adapter.send(:yaml_file, Example)
      results = YAML.load(open(file).read)
      results[0]['id'].should_not == results[1]['id']
    end

    it 'should find all of the individual records in the db' do
      examples = Example.all

      names = examples.map(&:name)

      names.should include 'cathy'
      names.should include 'bob'
    end
  end
end
