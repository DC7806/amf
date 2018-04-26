env :PATH, ENV['PATH']
set :output, 'log/cron.log'
## sitemap automation
every 1.day, at: '00:00 am' do
  rake "-s sitemap:refresh"
end