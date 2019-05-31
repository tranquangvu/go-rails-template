require 'rack-mini-profiler'

Rack::MiniProfilerRails.initialize!(Rails.application) if Rails.env.development?
