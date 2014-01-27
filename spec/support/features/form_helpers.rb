module Features
  module FormHelpers
    def within_form(form_prefix, &block)
      completion_helper = FormCompletionHelper.new(form_prefix, self)
      yield completion_helper
    end
  end
end
