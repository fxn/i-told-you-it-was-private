require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.pattern = 'test/*_test.rb'
  t.ruby_opts = %w(-rminitest/pride)
end
