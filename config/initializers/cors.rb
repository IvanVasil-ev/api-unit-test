Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: %w(Authorization),
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
      expose: %w(Authorization),
      max_age: 600
  end
end
