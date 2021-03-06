load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

class Capistrano::Configuration

  ##
  # Print an informative message with asterisks.
  def inform(message)
    puts "#{'*' * (message.length + 4)}"
    puts "* #{message} *"
    puts "#{'*' * (message.length + 4)}"
  end

  ##
  # Read a file and evaluate it as an ERB template.
  # Path is relative to this file's directory.
  def render_erb_template(filename)
    template = File.read(filename)
    result   = ERB.new(template).result(binding)
  end

  ##
  # Run a command and return the result as a string.
  #
  # TODO May not work properly on multiple servers.
  def run_and_return(cmd)
    output = []
    run cmd do |ch, st, data|
      output << data
    end
    return output.to_s
  end

end

namespace :deploy do
  desc "Create mod_rails restart file"
  task :restart, :roles => :app do
    run "touch #{release_path}/tmp/restart.txt"
  end

  #  SETUP tasks
  desc "Create shared/config directories and config files."
  task :create_shared_config do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/initializers"
    run "mkdir -p #{shared_path}/db/sphinx"

    # Copy database.yml if it doesn't exist.
    result = run_and_return "ls #{shared_path}/config"
    unless result.match(/database\.yml/)
      contents = render_erb_template(File.dirname(__FILE__) + "/config/database.yml")
      put contents, "#{shared_path}/config/database.yml"
      inform "Please edit database.yml in the shared directory."
    end

    # Copy smtp_gmail.rb if it doesn't exist.
    result = run_and_return "ls #{shared_path}/initializers"
    unless result.match(/smtp_gmail\.rb/)
      contents = render_erb_template(File.dirname(__FILE__) + "/config/initializers/smtp_gmail.rb.example")
      put contents, "#{shared_path}/initializers/smtp_gmail.rb"
      inform "Please edit smtp_gmail.rb in the /initializers directory."
    end

    # Copy keys.rb if it doesn't exist.
    result = run_and_return "ls #{shared_path}/initializers"
    unless result.match(/keys\.rb/)
      contents = render_erb_template(File.dirname(__FILE__) + "/config/initializers/keys.rb.example")
      put contents, "#{shared_path}/initializers/keys.rb"
      inform "Please edit keys.rb in the /initializers directory."
    end
  end
  after "deploy:setup", "deploy:create_shared_config"

  # after:update_code
  desc "Copy all config files from shared to release"
  task :copy_config_files do
    run "cp #{shared_path}/config/* #{release_path}/config/"
    run "cp #{shared_path}/initializers/* #{release_path}/config/initializers/"
  end
  after "deploy:update_code", "deploy:copy_config_files"

  # create custom maintenence page
  namespace :web do
    desc "Serve up a custom maintenance page."
    task :disable, :roles => :web do
      require 'erb'
      on_rollback { run "rm #{shared_path}/system/maintenance.html" }
      reason = ENV['REASON']
      deadline = ENV['UNTIL']
      template = File.read("app/views/layouts/maintenance.html.erb")
      page = ERB.new(template).result(binding)
      put page, "#{shared_path}/system/maintenance.html", :mode => "0755"
    end
  end

  # desc "Reindex and restart sphinx"
  # task :sphinx_in do
  #   run "ln -s  #{shared_path}/db/sphinx #{release_path}/db/sphinx"  
  #   run "cd #{release_path}; rake ts:rebuild RAILS_ENV=#{rails_env}"
  # end
  # after "deploy:update_code", "deploy:sphinx_in"

  before "deploy:update_code", 'deploy:web:disable'
  after "deploy:restart", 'deploy:web:enable'

  desc "Update the crontab file"
  task :update_crontab, :roles => :db do
    run "cd #{release_path} && RAILS_ENV=production whenever --update-crontab #{application}"
  end
  after "deploy:symlink", "deploy:update_crontab"

  desc "Install scripts"
  task :install_scripts do
    run "cp #{release_path}/lib/nix_scripts/delayed_job_monitor.sh ~/"
    run "chmod 775 ~/delayed_job_monitor.sh"
    run "cp #{release_path}/lib/nix_scripts/ar_mailer_monitor.sh ~/"
    run "chmod 775 ~/ar_mailer_monitor.sh"
    run "cp #{release_path}/lib/nix_scripts/log_rotate.sh ~/"
    run "chmod 775 ~/log_rotate.sh"
  end
  after "deploy:update_code", "deploy:install_scripts"
  
  after "deploy:install_scripts", "deploy:cleanup"  
end

namespace :delayed_job do
  desc "Stop the delayed_job process"
  task :stop, :roles => :app do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} script/delayed_job stop"
  end
  desc "Start the delayed_job process"
  task :start, :roles => :app do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} script/delayed_job start"
  end
  desc "Restart the delayed_job process"
  task :restart, :roles => :app do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} script/delayed_job restart"
  end
end

after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"

