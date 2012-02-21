Gem::Specification.new do |spec|
  spec.name     = 'i-told-you-it-was-private'
  spec.version  = '1.0'
  spec.summary  = 'Enough diplomacy, is time for punishment!'
  spec.homepage = 'http://github.com/fxn/i-told-you-it-was-private'
  spec.author   = 'Xavier Noria'
  spec.email    = 'fxn@hashref.com'

  spec.test_files = Dir['test/*_test.rb']

  spec.files = %w(
    i-told-you-it-was-private.gemspec
    Rakefile
    README.md
    MIT-LICENSE
  ) + Dir['lib/*.rb'] + spec.test_files
end