# Added to your config\initializers file
Infusionsoft.configure do |config|
  config.api_url = 'ns166.infusionsoft.com' # example infused.infusionsoft.com
  config.api_key = '5smwxpjtzn25dhnq9csnf4w9'
  config.api_logger = Logger.new("#{Rails.root}/log/infusionsoft_api.log") # optional logger file
end
