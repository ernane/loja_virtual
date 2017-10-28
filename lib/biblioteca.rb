class Biblioteca
  include Enumerable

  def initialize
    @banco_de_arquivos = BancoDeArquivos.new
  end

  def adiciona(midia)
    salva midia do
      midias << midia
    end
  end

  def midias_por_categoria(categoria)
    m = midias.select do |midia|
      midia.categoria == categoria if midia.respond_to? :categoria
    end
    m.each do |midia|
      yield midia if block_given?
    end
  end

  def midias
    @midias ||= @banco_de_arquivos.carrega
  end

  # metodo each que possibilita que os outros metodos
  # do modulo Enumerable funcionem em uma
  # instancia de Biblioteca
  def each
    midias.each { |midia| yield midia }
  end

  private

  def salva(midia)
    @banco_de_arquivos.salva midia
    yield
  end
end
