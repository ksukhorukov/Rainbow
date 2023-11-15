#!/usr/bin/env ruby

require 'digest'
require 'pp'

def dictionary_generator
  @dictionary_generator ||= ('а'..'я').to_a + 
    ('А'..'Я').to_a + 
    ('a'..'z').to_a + 
    ('A'..'Z').to_a + 
    ('0'..'9').to_a +
    ('!'..'?').to_a
end

N = 4

for i in 1...N do  
  dictionary_generator.permutation(i).map { |e| puts e.join }
end 
