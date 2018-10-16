module Llama
  class Template
    attr_accessor :template_name

    def initialize(template_name)
      @template_name = template_name
    end

    def render!(output_path, project_name)
      fetch_template
      Llama::DirProcessor.new(template_path, output_path, project_name).process!
    end

    private

    def fetch_template
      `rm -rf #{template_path}`
      print "  => [fetching template] #{template_name}\n".green
      `git clone #{repo_path} #{template_path} 2>&1 1>/dev/null`
    end

    def repo_path
      "git@github.com:#{template_name}.git"
    end

    def template_path
      File.expand_path("~/.llama/templates/#{template_name.split('/').last}")
    end

  end
end
