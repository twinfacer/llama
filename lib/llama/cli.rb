require 'thor'
require 'llama'

module Llama
  class CLI < Thor
    desc 'new PROJECT_NAME', 'Creates new scaffold.'
    method_option :template, aliases: '-t', required: true, desc: 'Template repo to use as base for scaffolding'
    method_option :force, aliases: '-f', type: :boolean, default: false, desc: 'Force overwrite project directory if one exist.'
    def new(name)
      project = Llama::Project.new(name, options.template)
      if Dir.exist?(project.path) && !options.force
        puts "#{project.path} already exists! Use --force to overwrite".red
      else
        `rm -rf #{project.path}`
        Dir.mkdir(project.path)
        project.write_template!
      end
    end
  end
end
