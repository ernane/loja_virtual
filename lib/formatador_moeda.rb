module FormatadorMoeda
  # Modulo que guarda os metodos de classe
  module ClassMethods
    def formata_moeda(*variaveis_e_metodos)
      variaveis_e_metodos.each do |name|
        define_method("#{name}_formatado") do
          valor = if respond_to?(name)
                    send(name)
                  else
                    instance_variable_get("@#{name}")
                  end
          "R$ #{valor}"
        end
        # metodo que retorna valor por extenso em reais
        define_method("#{name}_por_extenso") do
          valor = if respond_to?(name)
                    send(name)
                  else
                    instance_variable_get("@#{name}")
                  end
          valor.por_extenso_em_reais
        end
      end
    end
  end

  # hook method que e executado quando incluimos o modulo
  # dentro de alguma classe, recebendo no argumento
  # classe_que_incluiu_modulo o objeto Class que
  # representa a classe que incluiu o modulo
  def self.included(classe_que_incluiu_modulo)
    classe_que_incluiu_modulo.extend ClassMethods
  end
end
