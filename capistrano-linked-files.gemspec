lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'capistrano-linked-files'
  s.version       = File.read('VERSION').strip
  s.summary       = 'Upload linked files and directories.'
  s.description   = 'Adds tasks to upload your linked files and directories. '

  s.authors       = ['Runar Skaare Tveiten']
  s.email         = ['runar@tveiten.io']
  s.homepage      = 'https://github.com/runar/capistrano-linked-files'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  s.test_files    = s.files.grep(/^test/)
  s.require_paths = ['lib']

  s.add_dependency 'capistrano', '~> 3.1'

  s.add_development_dependency 'bundler', '~> 1.12'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 0.5'
  s.add_development_dependency 'minitest', '~> 5.9'
  s.add_development_dependency 'rake', '~> 11.2'
  s.add_development_dependency 'rubocop', '~> 0.40'
end
