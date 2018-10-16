module Llama
  class Project
    attr_accessor :name, :template

    def initialize(name, template_name)
      @name = name
      @template = Llama::Template.new(template_name)
    end

    def write_template!
      template.render!(path, name)
    end

    def path
      File.join(Dir.pwd, name)
    end
  end
end
