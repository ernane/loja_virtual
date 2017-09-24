class Livro
  attr_accessor :valor
  attr_reader :categoria, :isbn, :autor

  def initialize(autor, numero_de_paginas, valor, categoria, isbn = '1')
    @autor = autor
    @numero_de_paginas = numero_de_paginas
    @valor = valor
    @categoria = categoria
    @isbn = isbn
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
