require 'rubygems'
require 'erb'

def with_pid(options)
  options[:pid_dir] = File.dirname(options[:pid])
  template = File.dirname(__FILE__) + '/../templates/bash.erb'
  template = File.expand_path(template)
  template = File.read(template)
  template = ERB.new(template).result(binding)
  bash_path = options[:tmp] + "/" + options[:name]
  FileUtils.mkdir_p(options[:tmp])
  File.open(bash_path, 'w') do |f|
    f.write(template)
  end
  `chmod +x #{bash_path}`
  `#{bash_path}`
end