class Biblioteca
  def initialize
    @livros = {}
    @banco_de_arquivos = BancoDeArquivos.new
  end

  def adiciona(livro)
    salva livro do
      @livros[livro.categoria] ||= []
      @livros[livro.categoria] << livro
    end
  end

  def livros
    @livros.values.flatten
  end

  def livros_por_categoria(categoria)
    @livros[categoria].each do |livro|
      yield livro if block_given?
    end
  end

  private

  def salva(livro)
    @banco_de_arquivos.salva livro
    yield
  end
end
