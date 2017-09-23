class Livro
  attr_accessor :valor
  attr_reader :categoria

  def initialize(autor, numero_de_paginas, valor, categoria, isbn = '1')
    @autor = autor
    @numero_de_paginas = numero_de_paginas
    @valor = valor
    @categoria = categoria
    @isbn = isbn
  end

  def to_s
    "Autor: #{@autor}, ISBN: #{@isbn}, Páginas: #{@numero_de_paginas}"
  end
end
