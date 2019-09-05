# frozen_string_literal: true

require 'nokogiri'
require 'csv'
require 'curb'
require_relative 'parser'
require_relative 'recorder'

parser = Parser.new(ARGV[0])

record = Recorder.new(parser.run, ARGV[1])

record.printing
