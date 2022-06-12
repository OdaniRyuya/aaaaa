task :load_models do
  say "Loading application environment..."
  Rake::Task[:environment].invoke

  say "Loading code in search of Active Record models..."
  begin
    Rails.application.eager_load!
    ...
end
