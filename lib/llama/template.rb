module Llama
  class Template
    attr_accessor :template_name, :repo_path

    def initialize(template)
      if template.include?('.git')
        @template_name = template.match(/\/(.+)\.git$/)[1]
        @repo_path = template
      else
        @template_name = template.split('/').last
        @repo_path = "git@github.com:#{template_name}.git"
      end
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

    def template_path
      File.expand_path("~/.llama/templates/#{template_name}")
    end
  end
end
