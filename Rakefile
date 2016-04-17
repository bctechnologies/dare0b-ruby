require 'rake'

desc 'Default task'
task :default => [:test]

desc 'Run the unit tests'
require 'rake/testtask'
Rake::TestTask.new :test do |test|
  test.libs << 'lib'
  test.test_files = FileList['test/test*.rb']
end
