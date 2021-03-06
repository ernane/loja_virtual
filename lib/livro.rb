class Livro < Midia
  attr_reader :categoria, :isbn, :autor

  include FormatadorMoeda

  formata_moeda :valor_com_desconto, :valor

  def initialize(titulo, autor, numero_de_paginas, valor, categoria, isbn = '1')
    @titulo = titulo
    @autor = autor
    @numero_de_paginas = numero_de_paginas
    @valor = valor
    @categoria = categoria
    @isbn = isbn
    @desconto = 0.15
  end

  def to_s
    <<-END
  Autor: #{@autor}, ISBN: #{@isbn}, Páginas: #{@numero_de_paginas}, Categoria: #{@categoria}, Valor: #{@valor}
    END
  end

  def eql?(other)
    @isbn == other.isbn
  end

  def hash
    @isbn.hash
  end
end
