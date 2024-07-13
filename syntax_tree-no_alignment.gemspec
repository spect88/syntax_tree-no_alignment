# frozen_string_literal: true

require_relative "lib/syntax_tree/no_alignment/version"

Gem::Specification.new do |spec|
  spec.name = "syntax_tree-no_alignment"
  spec.version = SyntaxTree::NoAlignment::VERSION
  spec.authors = ["Tomasz Szczęśniak-Szlagowski"]
  spec.email = ["spect88@gmail.com"]

  spec.summary = "A Syntax Tree plugin disabling argument alignment"
  spec.description =
    "Syntax Tree aligns arguments of parens-less method calls. This plugin disables that behavior."
  spec.homepage = "https://github.com/spect88/syntax_tree-no_alignment"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files =
    Dir.chdir(__dir__) do
      `git ls-files -z`.split("\x0")
        .reject do |f|
          (File.expand_path(f) == __FILE__) ||
            f.start_with?(
              *%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile]
            )
        end
    end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "syntax_tree"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
