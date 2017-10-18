class Relatorio
  def initialize(biblioteca)
    @biblioteca = biblioteca
  end

  def total
    @biblioteca.midias.map(&:valor).inject(:+)
  end

  def titulos
    @biblioteca.map(&:titulo)
  end
end
