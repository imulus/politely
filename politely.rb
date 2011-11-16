require 'rubygems'
require 'open-uri'


module Politely
  def self.compliments
    compliments = []

		File.open('politely.md').each_line do |compliment|
			compliments.push compliment.gsub(/\* /, '')
    end

		return compliments
  end


  def self.random
    compliments[rand(compliments.size)]
  end
end

puts Politely.random
