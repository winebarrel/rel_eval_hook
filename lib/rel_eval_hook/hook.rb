module RelEvalHook::Hook
  if ActiveRecord::VERSION::MAJOR < 5
    def to_a; records0(proc { super }); end
  else
    def records; records0(proc { super }); end
  end

  def records0(super_proc)
    if @records_hook
      @records_hook.call(super_proc)
    else
      super_proc.call
    end
  end

  def on_eval(&block)
    @records_hook = block
    self
  end
end
