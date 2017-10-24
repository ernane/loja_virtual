class DVD < Midia
  include FormatadorMoeda

  def initialize(titulo, valor, categoria)
    super()
    @titulo = titulo
    @valor = valor
    @categoria = categoria
  end

  def to_s
    %( Título: #{@titulo}, Valor: #{@valor} )
  end
end
