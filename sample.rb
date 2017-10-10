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

File.delete('livros.yml') if File.exist?('livros.yml')
biblioteca = VendaFacil::Set.new
livros.each do |livro|
  biblioteca.adiciona(Livro.new(livro[:tit],
                                livro[:aut],
                                livro[:pag],
                                livro[:val],
                                livro[:categ],
                                livro[:isbn]))
end
puts '***** Executando o método livros_por_categoria com bloco (Biblioteca) *****'
biblioteca.livros_por_categoria :web do |livro|
  puts "Título: #{livro.titulo} - Categoria: #{livro.categoria}"
end
# Método não apresentará nenhuma resposta pois não foi passado o bloco como argumento
puts '***** Executando o método livros_por_categoria sem bloco(Biblioteca) *****'
puts biblioteca.livros_por_categoria(:dba)

imprime_livro_no_console = lambda do |livro|
  puts "Título: #{livro.titulo} - Categoria: #{livro.categoria}"
end
puts '***** Executando o método livros_por_categoria com um lambda (Biblioteca) *****'
biblioteca.livros_por_categoria(:tdd, &imprime_livro_no_console)

puts '***** Executando o método total (Relatorio) *****'
relatorio = Relatorio.new(biblioteca)
puts "Valor Total: #{relatorio.total}"

puts '***** Executando o método titulos (Biblioteca) *****'
puts relatorio.titulos

puts '***** Executando o métodos herdados da class Midia *****' 
livro = Livro.new('TDD com Ruby', 'Marcio Silva', 395, 69.90, :tdd, '8957')
dvd = DVD.new('Linux para desenvolvedores', 98.90, :linux)
puts "Livro. Título: #{livro.titulo} - Valor: #{livro.valor}"
puts "DVD. Título: #{dvd.titulo} - Valor: #{dvd.valor}"
puts "Livro. Título: #{livro.titulo} - Valor com desconto: #{livro.valor_com_desconto}"
puts "DVD. Título: #{dvd.titulo} - Valor com desconto: #{dvd.valor_com_desconto}"

puts "Invocando o valor_com_desconto da Classe Midia"
midia = Midia.new
puts midia.valor_com_desconto

puts "Classe CD"
windows = CD.new "Windows 95", 239.9, :sistemas_operacionais
p windows
puts windows