#!/usr/bin/env ruby

require 'digest'

File.readlines('./passwords.txt').each do |n|
  puts Digest::MD5.hexdigest n
end 