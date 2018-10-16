class Llama::AbstractProcessor
  attr_accessor :source, :target, :project_name

  def initialize(source, target, project_name)
    @source = source
    @target = target
    @project_name = project_name
  end

  def process!
    raise NonImplementedError, 'subclasses must implement #process !'
  end
end
