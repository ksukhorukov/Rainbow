#!/usr/bin/env ruby

require 'digest'
require 'pp'

class TableGenerator 
  attr_reader :passwords, :alg, :out

  def initialize
    usage
    parse_args
  end 

  def usage
    if ARGV.count < 2
      puts "#{$0} -f /path/to/file/with/pre/generated/passwords -a hashing_algorithm_eg_md5_or_sha512 -o ./output_table.txt"
    end
  end

  def parse_args
    pp ARGV
  end
end 

TableGenerator.new


