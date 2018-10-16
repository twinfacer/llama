require 'erb'

class Llama::FileProcessor < Llama::AbstractProcessor
  def process!
    target_path = target.gsub('@PROJECT_NAME@', project_name)
    local_path = target_path.gsub("#{Dir.pwd}/", '')
    print "  => [creating] #{local_path}\n".green
    File.open(target_path, 'w+') do |file|
      file.write(process_content(File.read(source)))
    end
  end
  private

  def process_content(str)
    app_name = project_name.split('_').map(&:capitalize).join('')
    ERB.new(str).result(binding)
  end
end
