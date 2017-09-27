class Biblioteca
  def initialize
    @livros = {}
    @banco_de_arquivos = BancoDeArquivos.new
  end

  def adiciona(livro)
    @livros[livro.categoria] ||= []
    @livros[livro.categoria] << livro
    @banco_de_arquivos.salva livro
  end

  def livros
    @livros.values.flatten
  end

  def livros_por_categoria(categoria)
    @livros[categoria].each do |livro|
      yield livro if block_given?
    end
  end
end
