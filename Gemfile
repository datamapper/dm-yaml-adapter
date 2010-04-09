source 'http://rubygems.org'

gem 'rake',          '~> 0.8.7'
gem 'jeweler',       '~> 1.4'
gem 'rspec',         '~> 1.3'
gem 'yard',          '~> 0.5'

# We need to add these here because we want to pin these gems to their git sources

gem 'data_objects',  '~> 0.10.2', :git => 'git://github.com/datamapper/do.git'

if ENV['EXTLIB']
  gem 'extlib',        '~> 0.9.15',      :git => 'git://github.com/datamapper/extlib.git'
else
  gem 'activesupport', '~> 3.0.0.beta3', :git => 'git://github.com/rails/rails.git', :require => nil
end

gem 'dm-core',       '~> 0.10.3', :path => '/Users/snusnu/projects/github/shared/datamapper/dm-core' #:git => 'git://github.com/datamapper/dm-core.git'
