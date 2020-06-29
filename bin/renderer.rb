 class Renderer
  attr_reader :template, :binding_klass

  def initialize(template, bind)
    @template = File.open(template, 'rb', &:read)
    @bind = bind
  end

  def render
    ERB.new(@template).result(@bind)
  end
end
