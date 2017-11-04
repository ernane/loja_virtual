module ActiveFile
  def save
    @new_record = false
    File.open("db/revistas/#{@id}.yml", 'w') do |file|
      file.puts serialize
    end
  end

  def destroy
    unless @destroyed || @new_record
      @destroyed = true
      FileUtils.rm "db/revistas/#{@id}.yml"
    end
  end

  module ClassMethods
    def find(id)
      unless File.exist?("db/revistas/#{id}.yml")
        raise DocumentNotFound, "Arquivo #{id} não encontrado.", caller
      end
      YAML.load File.open("db/revistas/#{id}.yml", 'r')
    end

    def next_id
      Dir.glob('db/revistas/*.yml').size + 1
    end

    def field(name)
      @fields ||= []
      @fields << name
      get = %{
          def #{name}
            @#{name}
          end
      }
      set = %{
          def #{name}=(valor)
            @#{name}=valor
          end
      }
      class_eval get
      class_eval set
    end
  end

  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      attr_reader :id, :destroyed, :new_record

      def initialize(parameters = {})
        @id = self.class.next_id
        @destroyed = false
        @new_record = true

        parameters.each do |key, value|
          instance_variable_set "@#{key}", value
        end
      end
    end
  end

  private

  def serialize
    YAML.dump self
  end
end
