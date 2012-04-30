# Most of this taken from Tim Sharpe's blog
# http://bombasticmonkey.com/
require 'rake'

# puppet lint ALL the things!
require 'puppet-lint/tasks/puppet-lint'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end
