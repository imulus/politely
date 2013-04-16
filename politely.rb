require 'rubygems'
require 'open-uri'


module Politely
  def self.compliments
    @compliments ||= begin
      File.open('politely.md').each_line.map do |compliment|
        compliment.gsub(/\* /, '').gsub(/\n/, '')
      end
    end
  end

  def self.random
    compliments.sample
  end
end

