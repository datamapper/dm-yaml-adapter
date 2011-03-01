require 'pathname'

source 'http://rubygems.org'

SOURCE       = ENV.fetch('SOURCE', :git).to_sym
REPO_POSTFIX = SOURCE == :path ? ''                                : '.git'
DATAMAPPER   = SOURCE == :path ? Pathname(__FILE__).dirname.parent : 'http://github.com/datamapper'
DM_VERSION   = '~> 1.1.0.rc1'

group :runtime do

  gem 'dm-core', DM_VERSION, SOURCE => "#{DATAMAPPER}/dm-core#{REPO_POSTFIX}"

end

group :development do

  gem 'dm-migrations', DM_VERSION, SOURCE => "#{DATAMAPPER}/dm-migrations#{REPO_POSTFIX}"
  gem 'jeweler',       '~> 1.5.2'
  gem 'rake',          '~> 0.8.7'
  gem 'rspec',         '~> 1.3.1'

end

group :quality do

  gem 'rcov',      '~> 0.9.9', :platforms => :mri_18
  gem 'yard',      '~> 0.5'
  gem 'yardstick', '~> 0.1'

end

group :datamapper do

  if ENV['EXTLIB']
    gem 'extlib', '~> 0.9.15', SOURCE => "#{DATAMAPPER}/extlib#{REPO_POSTFIX}", :require => nil
  else
    gem 'activesupport', '~> 3.0.4', :require => nil
    gem 'i18n',          '~> 0.5.0'
  end

  plugins = ENV['PLUGINS'] || ENV['PLUGIN']
  plugins = plugins.to_s.tr(',', ' ').split.push('dm-migrations').uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION, SOURCE => "#{DATAMAPPER}/#{plugin}#{REPO_POSTFIX}"
  end

end
