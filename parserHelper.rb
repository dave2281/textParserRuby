class ParserHelper 
  def initialize(url)
    @url = url
  end

  def parseUrl
    page = Nokogiri::HTML(URI.open(@url))
    return page.css('.Post-body').css('p').text
  end

  def writeFile(fileName)
    File.open(fileName, 'a') do |file|
      file.puts(parseUrl)
      file.puts("\n")
    end
  end 
end 