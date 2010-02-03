require 'pathname'
require 'yaml'

dir = Pathname(__FILE__).dirname.expand_path / 'yaml_adapter'

require dir / 'adapter'
