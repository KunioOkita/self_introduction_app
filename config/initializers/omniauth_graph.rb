require "microsoft_graph_auth"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :microsoft_graph_auth,
           ENV["AZURE_APP_ID"].present? ? ENV["AZURE_APP_ID"] : Rails.application.credentials.ad[:app_id],
           ENV["AZURE_APP_SECRET"].present? ? ENV["AZURE_APP_SECRET"] : Rails.application.credentials.ad[:app_secret],
           scope: ENV["AZURE_SCOPES"].present? ? ENV["AZURE_SCOPES"] : Rails.application.credentials.ad[:scopes]
end
