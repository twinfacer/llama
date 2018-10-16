class Llama::DirProcessor < Llama::AbstractProcessor
  def process!
    content.sort.each do |name|
      entry_path = File.join(source, name)
      target_path = File.join(target, name)
      if File.directory?(entry_path)
        Dir.mkdir(target_path)
        Llama::DirProcessor.new(entry_path, target_path, project_name).process!
      else
        Llama::FileProcessor.new(entry_path, target_path, project_name).process!
      end
    end
  end

  def content
    Dir.entries(source) - ['.', '..', '.git']
  end

end
