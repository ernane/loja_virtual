class DVD < Midia
  def self.formata_moeda
    def valor_formatado
      bar = ->(y) { "R$ #{y}" }
      bar.call(@valor)
    end

    def valor_com_desconto_formatado
      bar = ->(y) { "R$ #{y}" }
      bar.call(valor_com_desconto)
    end
  end

  formata_moeda

  def initialize(titulo, valor, categoria)
    super()
    @titulo = titulo
    @valor = valor
    @categoria = categoria
  end

  def to_s
    %( Título: #{@titulo}, Valor: #{@valor} )
  end
end
