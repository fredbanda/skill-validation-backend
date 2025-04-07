Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"  # Fine for a temporary testing app
    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      expose: [ "Content-Disposition" ]  # Important for Active Storage
  end
end
