require 'rubygems'
gem 'require'
require 'require'

Require do
  gem :require, '=0.2.6'
  gem(:rake, '=0.8.7') { require 'rake' }
  gem :rspec, '=1.3.0'
  
  gemspec do
    author 'Winton Welsh'
    email 'mail@wintoni.us'
    name 'with_pid'
    homepage "http://github.com/winton/#{name}"
    summary "The simple way to create and monitor a Ruby daemon"
    version '0.1.2'
  end
  
  rakefile do
    gem(:rake) { require 'rake/gempackagetask' }
    gem(:rspec) { require 'spec/rake/spectask' }
    require 'require/tasks'
  end
  
  spec_helper do
    require 'require/spec_helper'
    require 'lib/with_pid'
    require 'pp'
  end
end
