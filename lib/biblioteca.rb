class Biblioteca
  include Enumerable

  def initialize
    @banco_de_arquivos = BancoDeArquivos.new
  end

  def adiciona(midia)
    salva midia do
      midias << midia 
    end if midia.kind_of? Midia
  end

  def midias_por_categoria(categoria)
    midias.select { |midia| midia.categoria == categoria }.each do |midia|
      yield midia if block_given?
    end
  end

  def midias
    @midias ||= @banco_de_arquivos.carrega
  end

  # método each que possibilita que os outros métodos
  # do módulo Enumerable funcionem em uma
  # instância de Biblioteca
  def each
    midias.each { |midia| yield midia }
  end

  private

  def salva(midia)
    @banco_de_arquivos.salva midia
    yield
  end
end
