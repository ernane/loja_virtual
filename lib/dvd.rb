class DVD < Midia
  def initialize(titulo, valor, categoria)
    @titulo = titulo
    @valor = valor
    @categoria = categoria
  end

  def to_s
    %( Título: #{@titulo}, Valor: #{@valor} )
  end
end
