class CD < Midia
  def initialize(titulo, valor, categoria)
    super()
    @titulo = titulo
    @valor = valor
    @categoria = categoria
  end

  def to_s
    %( Titulo: #{@titulo}, Valor: #{@valor} )
  end
end
