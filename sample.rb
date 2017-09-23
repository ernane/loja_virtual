require File.expand_path('lib/loja_virtual')

livros = [
  { autor: 'Paulo Sousa', pagina: 135, valor: 169.99, categoria: :tdd, isbn: '9983179587' },
  { autor: 'Saulo Silva', pagina: 239, valor: 175.99, categoria: :web, isbn: '9321739239' },
  { autor: 'Jorge Alves', pagina: 457, valor: 230.10, categoria: :web, isbn: '9148579788' },
  { autor: 'Paulo Silva', pagina: 351, valor: 220.00, categoria: :tdd, isbn: '5118172738' },
  { autor: 'Saulo Alves', pagina: 945, valor: 199.30, categoria: :tdd, isbn: '3148575288' },
  { autor: 'Jorge Sousa', pagina: 266, valor: 190.99, categoria: :dba, isbn: '8148579748' },
  { autor: 'Paulo Alves', pagina: 323, valor: 175.99, categoria: :web, isbn: '6148545758' },
  { autor: 'Saulo Sousa', pagina: 798, valor: 320.99, categoria: :dba, isbn: '4148671188' },
  { autor: 'Jorge Silva', pagina: 417, valor: 199.99, categoria: :dba, isbn: '1145579722' }
]

biblioteca = Biblioteca.new
livros.each do |livro|
  biblioteca.adiciona(Livro.new(livro[:autor],
                                livro[:pagina],
                                livro[:valor],
                                livro[:categoria],
                                livro[:isbn]))
end
puts '***** Executando o método livros_por_categoria *****'
biblioteca.livros_por_categoria :web do |livro|
  puts livro
end

# Método não apresentará nenhuma resposta pois não foi passado o bloco como argumento
biblioteca.livros_por_categoria :tdd
