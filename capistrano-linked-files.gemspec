lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'capistrano-linked-files'
  s.version       = '1.1.1'
  s.summary       = 'Upload linked files and directories.'
  s.description   = 'Adds tasks to upload your linked files and directories. '

  s.authors       = ['Runar Skaare Tveiten']
  s.email         = ['runar@tveiten.io']
  s.homepage      = 'https://github.com/runar/capistrano-linked-files'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.add_dependency 'capistrano', '~> 3.1'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
