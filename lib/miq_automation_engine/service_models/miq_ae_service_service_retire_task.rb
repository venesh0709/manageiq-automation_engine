module MiqAeMethodService
  class MiqAeServiceServiceRetireTask < MiqAeServiceMiqRequestTask
    def statemachine_task_status
      ar_method do
        if %w(finished).include?(@object.state)
          @object.status.to_s.downcase == 'error' ? 'error' : 'ok'
        else
          'retry'
        end
      end
    end
  end
end
