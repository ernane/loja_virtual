require File.expand_path('lib/loja_virtual')

livros = [
  { tit: 'TDD A', aut: 'Paulo Sousa', pag: 135, val: 169.99, categ: :tdd, isbn: '9983' },
  { tit: 'PHP A', aut: 'Saulo Silva', pag: 239, val: 175.99, categ: :web, isbn: '9321' },
  { tit: 'PHP C', aut: 'Jorge Alves', pag: 457, val: 230.15, categ: :web, isbn: '9148' },
  { tit: 'TDD B', aut: 'Paulo Silva', pag: 351, val: 220.36, categ: :tdd, isbn: '5118' },
  { tit: 'TDD C', aut: 'Saulo Alves', pag: 945, val: 199.32, categ: :tdd, isbn: '3148' },
  { tit: 'SQL A', aut: 'Jorge Sousa', pag: 266, val: 190.99, categ: :dba, isbn: '8148' },
  { tit: 'PHP B', aut: 'Paulo Alves', pag: 323, val: 175.99, categ: :web, isbn: '6148' },
  { tit: 'SQL B', aut: 'Saulo Sousa', pag: 798, val: 320.99, categ: :dba, isbn: '4148' },
  { tit: 'SQL C', aut: 'Jorge Silva', pag: 417, val: 199.99, categ: :dba, isbn: '1145' }
]

biblioteca = Biblioteca.new
livros.each do |livro|
  biblioteca.adiciona(Livro.new(livro[:tit],
                                livro[:aut],
                                livro[:pag],
                                livro[:val],
                                livro[:categ],
                                livro[:isbn]))
end
puts '***** Executando o método livros_por_categoria (Biblioteca) *****'
biblioteca.livros_por_categoria :web do |livro|
  puts livro
end
# Método não apresentará nenhuma resposta pois não foi passado o bloco como argumento
biblioteca.livros_por_categoria(:tdd)

puts '***** Executando o método total (Relatorio) *****'
relatorio = Relatorio.new(biblioteca)
puts relatorio.total

puts '***** Executando o método titulos (Biblioteca) *****'
puts relatorio.titulos