module FormatadorMoeda
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
    end
  end
end
