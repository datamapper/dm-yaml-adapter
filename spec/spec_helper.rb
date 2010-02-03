# use local dm-core and dm-data_objects-adapter paths if running from a typical dev checkout.
local_dm_core_lib = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'dm-core', 'lib'))
$LOAD_PATH.unshift(local_dm_core_lib) if File.directory?(local_dm_core_lib)

local_do_adapter_lib = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'dm-data_objects-adapter', 'lib'))
$LOAD_PATH.unshift(local_do_adapter_lib) if File.directory?(local_do_adapter_lib)

# Support running specs with 'rake spec' and 'spec'
$LOAD_PATH.unshift('lib') unless $LOAD_PATH.include?('lib')

require 'rubygems'
require 'dm-core'
require 'yaml_adapter'

DB_DIR = Pathname(__FILE__).dirname.expand_path / 'db'
DB_DIR.mkpath

require DataMapper.root / 'spec' / 'lib' / 'pending_helpers'

Spec::Runner.configure do |config|
  config.include(DataMapper::Spec::PendingHelpers)
end
