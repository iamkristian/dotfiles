#!/usr/bin/env ruby
require 'erb'
require 'date'
require_relative 'renderer'

@time = Date.new
renderer = Renderer.new('templates/test.txt.erb', binding)
puts "this is ruby"
puts renderer.render
