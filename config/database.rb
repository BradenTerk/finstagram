configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  set :database, {
    adapter: "sqlite3",
    database: "db/db.sqlite3"
  }

  # Load all models from app/models, using autoload instead of require
    postgres://tcxstshtydades:f0757598f1144b6377d0d3389d869361e77a3170f2f1503e7e91ca506892f529@ec2-54-159-175-113.compute-1.amazonaws.com:5432/dds7qklcvuke32
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
