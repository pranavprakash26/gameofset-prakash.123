class Card
    attr_reader :shape, :color, :number, :shading
  
    def initialize(shape, color, number, shading)
      @shape = shape
      @color = color
      @number = number
      @shading = shading
    end
  
    def to_s
      "#{number} #{shading} #{color} #{shape}(s)"
    end
  end
  