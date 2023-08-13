require 'nokogiri'
require 'open-uri'
require_relative 'parserHelper.rb'

class Parser
  def initialize(names, fileNameResult)
    @fileNameResult = fileNameResult
    @names = names
    @stringNum = 0
    @urlsArrayNoSymbols = []
  end
  
  def urlParseArray 
    getFileUrlsArray.each do |url|
      parser = ParserHelper.new(url)
      parser.writeFile("#{@fileNameResult}")
    end
  end
  
  private

  def getFileUrlsArray
    urlsArray = File.open(@names).readlines
    urlsArray.each do |url|
      urlNoSymbol = url.gsub("\n", '') 
      p urlNoSymbol
      @urlsArrayNoSymbols << urlNoSymbol
    end
    return @urlsArrayNoSymbols
  end 
end 

hobbyText = Parser.new('/home/dave/programming/ruby_git/project/textParser/urls.txt', 'result.txt')
hobbyText.urlParseArray