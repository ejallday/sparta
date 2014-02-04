shared_examples 'a restricted-access controller' do |options|
  actions = options[:for]
  actions.each do |action_name|
    action = ProtectedAction.for_name(action_name)
    describe "#{action.http_verb} ##{action_name}" do
      it 'redirecs to the sign_in_path' do
        send(action.http_verb, action_name, action.request_options)
        expect_redirect_to_sign_in
      end

      it 'displays flash error message' do
        send(action.http_verb, action_name, action.request_options)
        expect_unauthorized_flash_message
      end
    end
  end
end
