class Revista
  attr_reader :titulo, :id
  attr_accessor :valor

  def initialize(titulo, valor)
    @titulo = titulo
    @valor = valor
    @id = next_id
    @destroyed = false
    @new_record = true
  end

  def save
    @new_record = false
    File.open("db/revistas/#{@id}.yml", 'w') do |file|
      file.puts serialize
    end
  end

  def self.find(id)
    unless File.exist?("db/revistas/#{id}.yml")
      raise DocumentNotFound, "Arquivo #{id} não encontrado.", caller
    end
    YAML.load File.open("db/revistas/#{id}.yml", 'r')
  end

  def destroy
    # verificar se o objeto nao foi removido anteriormente
    # e se o objeto nao e um novo registro
    unless @destroyed || @new_record
      @destroyed = true
      FileUtils.rm "db/revistas/#{@id}.yml"
    end
  end

  private

  def serialize
    YAML.dump self
  end

  def next_id
    Dir.glob('db/revistas/*.yml').size + 1
  end
end
