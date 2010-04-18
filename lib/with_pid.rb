require 'rubygems'
require 'erb'

def with_pid(options)
  # Add pid_dir option
  options[:pid_dir] = File.dirname(options[:pid])
  
  # Render bash script
  template = File.dirname(__FILE__) + '/../templates/bash.erb'
  template = File.expand_path(template)
  template = File.read(template)
  template = ERB.new(template).result(binding)
  bash_path = options[:tmp] + "/" + options[:name]
  
  # Write bash script to tmp
  FileUtils.mkdir_p(options[:tmp])
  File.open(bash_path, 'w') do |f|
    f.write(template)
  end
  
  # Execute bash script
  `chmod +x #{bash_path}`
  `#{bash_path}`
end