require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'rubygems'
require 'bundler/setup'
require 'capistrano/all'
require 'capistrano/setup'
require 'minitest/autorun'
require 'rake'

class UnitTest < Minitest::Test
  def setup
    set :upload_roles, :all
  end
end
