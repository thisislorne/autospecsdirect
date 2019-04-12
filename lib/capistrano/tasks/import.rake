namespace :genius do
  desc 'run import genius thor task'
  task :optimise_keywords do
    on roles(:all) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :thor, 'genius:optimise_keywords'
        end
      end
    end
  end
end
