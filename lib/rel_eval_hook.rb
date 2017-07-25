require 'active_support/lazy_load_hooks'

require 'rel_eval_hook/version'

ActiveSupport.on_load(:active_record) do
  require 'rel_eval_hook/hook'
  ActiveRecord::Relation.prepend(RelEvalHook::Hook)
end
