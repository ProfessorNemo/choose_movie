class Film
  attr_accessor :title, :year, :producer, :genre

  def initialize(param)
    @title = param[:title]
    @year = param[:year].to_i
    @producer = param[:producer]
    @genre = param[:genre]
  end

  def to_s
    "\"#{title}\" - реж. #{producer} | #{genre} | (#{year} г.)"
  end
end
