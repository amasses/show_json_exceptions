require 'rails'

module ShowJsonExceptions
	class Railtie < Rails::Railtie
		initializer "show_json_exceptions.config_middleware" do |app|
			app.middleware.insert_after ActionDispatch::ShowExceptions, ShowJsonExceptions::Middleware
			app.middleware.delete ActionDispatch::ShowExceptions
		end
	end
end