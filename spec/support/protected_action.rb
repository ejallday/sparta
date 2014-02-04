module ProtectedAction
  def self.for_name(action_name)
    ACTIONS.find do |klass|
      klass.supports_action?(action_name)
    end
  end

  class Action
    def self.http_verb
      :get
    end

    def self.supports_action?(action)
      action == supported_action
    end
  end

  class ProtectedMemberAction < Action
    def self.request_options
      { id: Faker::Number.number(2) }
    end
  end

  class ProtectedNonMemberAction < Action
    def self.request_options
      {}
    end
  end

  class ProtectedCreateAction < ProtectedNonMemberAction
    def self.supported_action
      :create
    end

    def self.http_verb
      :post
    end
  end

  class ProtectedDestroyAction < ProtectedMemberAction
    def self.supported_action
      :destroy
    end

    def self.http_verb
      :delete
    end
  end

  class ProtectedEditAction < ProtectedMemberAction
    def self.supported_action
      :edit
    end
  end

  class ProtectedIndexAction < ProtectedNonMemberAction
    def self.supported_action
      :index
    end
  end

  class ProtectedNewAction < ProtectedNonMemberAction
    def self.supported_action
      :new
    end
  end

  class ProtectedShowAction < ProtectedMemberAction
    def self.supported_action
      :show
    end
  end

  class ProtectedUpdateAction < ProtectedMemberAction
    def self.supported_action
      :update
    end

    def self.http_verb
      :put
    end
  end

  ACTIONS = [
    ProtectedCreateAction,
    ProtectedDestroyAction,
    ProtectedEditAction,
    ProtectedIndexAction,
    ProtectedNewAction,
    ProtectedShowAction,
    ProtectedUpdateAction
  ]
end
