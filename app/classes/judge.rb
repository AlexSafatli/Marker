class Judge

  def initialize command, inputs, outputs
    @command = (command if command.is_a? String) || ''
    @inputs = (inputs if inputs.is_a? Array) || []
    @outputs = (outputs if outputs.is_a? Array) || []
    raise "Incompatible array sizes" unless @inputs.count == @outputs.count
    @tests = Array.new @inputs.count
  end

  def run
    @inputs.each_with_index(&:test)
  end

  private

  def command index
    "diff <(echo '#{@inputs[index]}') <(echo '#{@inputs[index]}' | #{@command})"
  end

  def test index, input
    IO.popen command(index) do |out|
      @tests[index] = out.gets
    end
  end

end