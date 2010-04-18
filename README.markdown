With PID
========

The simple way to create and monitor a Ruby daemon.

Works by generating a bash file and executing it instead of doing any Ruby process tricks.

Requirements
------------

<pre>
sudo gem install with_pid
</pre>

Ruby script
-----------

<code>/data/my_app/current/bin/dj</code>:

<pre>
#!/usr/bin/env ruby

require 'rubygems'
require 'with_pid'

with_pid(
  :action => ARGV[0], # start or stop
  :command => "/data/my_app/current/script/runner 'Delayed::Worker.new.start'",
  :name => "dj",
  :pid => "/var/run/dj/dj.pid",
  :tmp => "/data/my_app/current/tmp",
  :user => "deploy"
)
</pre>

Be sure to run <code>chmod +x /data/my_app/current/bin/dj</code>.

It is up to you to make sure that the command you execute runs in a continuous loop.

Monit
-----

<pre>
check process delayed_job
  with pidfile /var/run/dj/dj.pid
  start program = "/data/my_app/current/bin/dj start"
  stop program = "/data/my_app/current/bin/dj stop"
  group delayed_job
</pre>