# frozen_string_literal: true

require "bundler/gem_tasks"

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

require "syntax_tree/rake_tasks"
stree_config =
  proc do |t|
    t.source_files =
      FileList[%w[Gemfile Rakefile lib/**/*.rb test/**/*.rb *.gemspec]]
  end
SyntaxTree::Rake::CheckTask.new(&stree_config)
SyntaxTree::Rake::WriteTask.new(&stree_config)

require "rubocop/rake_task"
RuboCop::RakeTask.new

desc "Run all code checks"
task check: %i[rubocop stree:check test]

desc "Run all automated fixes"
task fix: %i[stree:write rubocop:autocorrect_all]

task default: :check
