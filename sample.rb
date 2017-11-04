require File.expand_path('lib/loja_virtual')

livros = [
  { tit: 'TDD A',
    aut: 'Paulo Sousa',
    pag: 135, val: 169.99,
    categ: :tdd,
    isbn: '9983' },
  { tit: 'PHP A',
    aut: 'Saulo Silva',
    pag: 239,
    val: 175.99,
    categ: :web,
    isbn: '9321' },
  { tit: 'PHP C',
    aut: 'Jorge Alves',
    pag: 457,
    val: 230.15,
    categ: :web,
    isbn: '9148' },
  { tit: 'TDD B',
    aut: 'Paulo Silva',
    pag: 351,
    val: 220.36,
    categ: :tdd,
    isbn: '5118' },
  { tit: 'TDD C',
    aut: 'Saulo Alves',
    pag: 945,
    val: 199.32,
    categ: :tdd,
    isbn: '3148' },
  { tit: 'SQL A',
    aut: 'Jorge Sousa',
    pag: 266,
    val: 190.99,
    categ: :dba,
    isbn: '8148' },
  { tit: 'PHP B',
    aut: 'Paulo Alves',
    pag: 323,
    val: 175.99,
    categ: :web,
    isbn: '6148' },
  { tit: 'SQL B',
    aut: 'Saulo Sousa',
    pag: 798,
    val: 320.99,
    categ: :dba,
    isbn: '4148' },
  { tit: 'SQL C',
    aut: 'Jorge Silva',
    pag: 417,
    val: 199.99,
    categ: :dba,
    isbn: '1145' }
]

File.delete('midias.yml') if File.exist?('midias.yml')
Dir.glob('db/revistas/*.yml').each { |file| File.delete(file) }
# biblioteca = VendaFacil::Set.new
biblioteca = Biblioteca.new
livros.each do |livro|
  biblioteca.adiciona(Livro.new(livro[:tit],
                                livro[:aut],
                                livro[:pag],
                                livro[:val],
                                livro[:categ],
                                livro[:isbn]))
end
puts '*** Executando o método livros_por_categoria com bloco (Biblioteca) ***'
biblioteca.midias_por_categoria :web do |midia|
  puts "Título: #{midia.titulo} - Categoria: #{midia.categoria}"
end
# Matodo nao apresentara nenhuma resposta
# pois nao foi passado o bloco como argumento
puts '*** Executando o método livros_por_categoria sem bloco(Biblioteca) ***'
puts biblioteca.midias_por_categoria(:dba)

imprime_livro_no_console = lambda do |livro|
  puts "Título: #{livro.titulo} - Categoria: #{livro.categoria}"
end
puts '*** Executando o método livros_por_categoria lambda (Biblioteca) ***'
biblioteca.midias_por_categoria(:tdd, &imprime_livro_no_console)

puts '***** Executando o método total (Relatorio) *****'
relatorio = Relatorio.new(biblioteca)
puts "Valor Total: #{relatorio.total}"

puts '***** Executando o método titulos (Biblioteca) *****'
puts relatorio.titulos

puts '***** Executando o métodos herdados da class Midia *****'
livro = Livro.new('TDD com Ruby', 'Marcio Silva', 395, 69.90, :tdd, '8957')
dvd = DVD.new('Linux para desenvolvedores', 98.90, :linux)
dvd.extend FormatadorMoeda
puts "Livro. Título: #{livro.titulo} - Valor: #{livro.valor}"
puts "DVD. Título: #{dvd.titulo} - Valor: #{dvd.valor}"
puts "Livro. Título: #{livro.titulo} - Vl desconto: #{livro.valor_com_desconto}"
puts "Livro. Título: #{livro.titulo} - Vl formatado: #{livro.valor_formatado}"
puts "DVD. Título: #{dvd.titulo} - Vl formatado: #{dvd.valor_formatado}"
puts "DVD. Título: #{dvd.titulo} - Vl desconto: #{dvd.valor_com_desconto}"

puts 'Invocando o valor_com_desconto da Classe Midia'
midia = Midia.new
puts midia.valor_com_desconto

puts 'Classe CD'
windows = CD.new 'Windows 95', 239.9, :sistemas_operacionais
p windows
puts windows

biblioteca_r = Biblioteca.new
biblioteca.adiciona(Revista.new('MundoR', 10.9))
biblioteca.adiciona(DVD.new('Windows para desenvolvedores', 101.99, :windows))

puts 'Biblioteca de revista'
biblioteca_r.each { |b| puts b.titulo }
puts biblioteca_r.midias_por_categoria(:windows)

puts '************ CAPITULO 8 *************'

windows = DVD.new 'Windows 7 for Dummies', 98.9, :sistemas_operacionais

puts "DVD #{windows.valor_formatado}"
puts "DVD com desconto #{windows.valor_com_desconto_formatado}"

mundo_j = Revista.new 'Mundo J', 10.9
puts "Valor original Revista: #{mundo_j.valor}"
mundo_j.valor = 15.50
mundo_j.save

mundo_r = Revista.new 'Mundo R', 10.9
mundo_r.save

mundo_j2 = Revista.find 1
p mundo_j2.valor

mundo_j2.destroy

begin
  Revista.find 42
rescue DocumentNotFound => erro
  p erro
end
