class Livro
  attr_accessor :valor

  def initialize(autor, numero_de_paginas, valor, isbn = '1')
    @autor = autor
    @numero_de_paginas = numero_de_paginas
    @isbn = isbn
    @valor = valor
  end

  def to_s
    "Autor: #{@autor}, ISBN: #{@isbn}, Páginas: #{@numero_de_paginas}"
  end
end
