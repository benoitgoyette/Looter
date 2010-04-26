desc "starts the rails server"
task :server do
  system "#{Rails.root}/script/rails server"
end

desc "starts the rails console"
task :console do
  system "#{Rails.root}/script/rails console"
end

namespace :db do
  desc "starts the rails db console"
  task :console do
    system "#{Rails.root}/script/rails dbconsole"
  end
end
  