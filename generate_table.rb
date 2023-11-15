#!/usr/bin/env ruby

require 'digest'
require 'byebug'
require 'pp'

class TableGenerator 
  attr_reader :passwords, :alg, :input, :out, :crypto_algs_available

  def initialize
    usage
    parse_args
  end 

  def close_output_file
    output_file.close
  end

private 

  def usage
    if ARGV.count < 2
      puts "#{$0} -f /path/to/file/with/pre/generated/passwords 
                  -a hashing_algorithm_eg_md5_or_sha512 
                  -o ./output_table.txt"
    end
  end

  def parse_args
    @input ||= ARGV[1]
    @alg ||= ARGV[2]
    @out ||= ARGV[3]

    raise 'unsupported crypto alg' unless available_alg? alg 

    puts "#{input} #{out} #{alg}"
  end

  def crypto_algs
    @crypto_algs_available ||= %w[md5 sha256 sha512]
  end 

  def available_alg? alg 
    crypto_algs_available.include? alg&.to_s
  end 

  def passwords 
    @passwords ||= File.readlines(input)
  end 

  def output_file 
    byebug
    @output_file ||= File.open(out, 'w')
  end 
end 


begin
  instance = TableGenerator.new
  instance.close_output_file
rescue
  instance.close_output_file
end 



