class CableParser
  COLOR    = %w[синий зеленый красный фиолетовый оранжевый черный белый голубой желтый серый розовый].freeze
  STANDART = [/ГОСТ*[^;]{1,}/, /ТУ.[^;]{1,}/].freeze

  def initialize(string)
    @string = string
    @response_data = {}
  end

  def test
    response
    @string
  end

  def response
    %i[color size standart unit execution name voltage ].each do |method|
      @response_data[method] = send(method)
      @string.sub!(@response_data[method], '') unless @response_data[method].nil?
    end
    @response_data
  end

  private

  def unit
    @string.split(';').find { |str| str =~ /кг/ || str =~ /т/ }
  end

  def name
    @string[/[\W]{1,}\d{1,}/]&.strip
  end

  def color
    COLOR.map { |color| @string[color] }.compact.join('-')
  end

  def standart
    STANDART.map { |r| @string[r] }.join
  end

  def voltage

  end

  def execution
    @string[/прям.сеч/]
  end

  def size
    @string[/[\d,]{1,}[хx][\d,]{1,}/]
  end
end
