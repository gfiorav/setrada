Rails.application.routes.draw do
  scope('api') do
    scope('v1') do
      scope('readers/:username') do
        resources(:dictionaries) do
          resources(:translations)
        end
      end
    end
  end
end
