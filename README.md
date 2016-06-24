# capistrano-linked-files

[![Gem Version](https://img.shields.io/gem/v/capistrano-linked-files.svg?style=flat-square)](http://badge.fury.io/rb/capistrano-linked-files)
[![Build Status](https://img.shields.io/travis/runar/capistrano-linked-files/master.svg?style=flat-square)](https://travis-ci.org/runar/capistrano-linked-files)
[![Code Climate](https://img.shields.io/codeclimate/github/runar/capistrano-linked-files.svg?style=flat-square)](https://codeclimate.com/github/runar/capistrano-linked-files)
[![Coverage Status](https://img.shields.io/codeclimate/coverage/github/runar/capistrano-linked-files.svg?style=flat-square)](https://codeclimate.com/github/runar/capistrano-linked-files/coverage)
[![Dependency Status](https://img.shields.io/gemnasium/runar/capistrano-linked-files.svg?style=flat-square)](https://gemnasium.com/runar/capistrano-linked-files)

This gem provides Capistrano 3.1 reciepes to upload your linked files and
directories. It's quite useful for files such as `config/database.yml` and
`config/secrets.yml`, which are usually ignored (at least they should be) from
version control systems.

Linked files and directories are placed in the `shared` directory on your
remote servers and kept between deployments. After a new deployment, a symlink
is created from the `shared` directory to the `current` directory.

Inspiration was found in damselem's
[capistrano-shared-files](https://github.com/damselem/capistrano-shared-file),
but capistrano-linked-files uses the "built in" Capistrano configuration
variables `linked_files` and `linked_dirs` instead of custom ones. This way
it's not necessary to specify your linked files twice.

## Installation

Add the gem to your `Gemfile`:

```ruby
gem 'capistrano-linked-files'
```

Or install it to your system:

```
$ gem install capistrano-linked-files
```

## Usage

Add the gem to your `Capfile`:

```ruby
require 'capistrano/linked_files'
```

In `deploy.rb`, list the files and directories you'd like to keep between
deployments:

```ruby
set :linked_files, %w(config/database.yml config/secrets.yml)
set :linked_dirs, %w(bin log tmp)
```

Then run the task:

```
$ bundle exec cap <STAGE> linked_files:upload
```

By default, the listed files and directories are uploaded to all server roles.
You may change this by doing the following:

```ruby
# Set upload roles using symbols
set :upload_roles, :all

# Set upload roles using arrays
set :upload_roles, %w(web app)
```

If you only want to upload files or dirs, then run the tasks accordingly:

```
$ bundle exec cap <STAGE> linked_files:upload_files
$ bundle exec cap <STAGE> linked_files:upload_dirs
```

To automatically upload linked files and directories after a new deployment,
add the following to your `deploy.rb`:

```ruby
# Uploading both linked_files and dirs
before :finishing, 'linked_files:upload'

# Uploading only linked_files
before :finishing, 'linked_files:upload_files'

# Uploading only dirs
before :finishing, 'linked_files:upload_dirs'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The capistrano-linked-files plugin is free software released under the MIT
License. See
[LICENSE](https://github.com/runar/capistrano-linked-files/blob/master/LICENSE)
for details.
