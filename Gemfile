require 'pathname'

source 'http://rubygems.org'

SOURCE       = ENV.fetch('SOURCE', :git).to_sym
REPO_POSTFIX = SOURCE == :path ? ''                                : '.git'
DATAMAPPER   = SOURCE == :path ? Pathname(__FILE__).dirname.parent : 'http://github.com/datamapper'
DM_VERSION   = '~> 1.2.0.rc1'

gem 'dm-core', DM_VERSION, SOURCE => "#{DATAMAPPER}/dm-core#{REPO_POSTFIX}"

group :development do

  gem 'dm-migrations', DM_VERSION, SOURCE => "#{DATAMAPPER}/dm-migrations#{REPO_POSTFIX}"
  gem 'jeweler',       '~> 1.6.4'
  gem 'rake',          '~> 0.9.2'
  gem 'rspec',         '~> 1.3.2'

end

platforms :mri_18 do
  group :quality do

    gem 'rcov',      '~> 0.9.10'
    gem 'yard',      '~> 0.7.2'
    gem 'yardstick', '~> 0.4'

  end
end

group :datamapper do

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.push('dm-migrations').uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION, SOURCE => "#{DATAMAPPER}/#{plugin}#{REPO_POSTFIX}"
  end

end
