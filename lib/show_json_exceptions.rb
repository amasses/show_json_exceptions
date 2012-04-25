require "show_json_exceptions/version"
require 'show_json_exceptions/railtie' if defined?(Rails)

require 'action_dispatch/http/request'

module ShowJsonExceptions
  class Middleware < ActionDispatch::ShowExceptions
  def render_exception(env, exception)
    log_error(exception)
    exception = original_exception(exception)

    request = ActionDispatch::Request.new(env)
    exception_data = ["Exception: #{exception.message}"]

    if @consider_all_requests_local || request.local?
      exception_data << {backtrace: exception.backtrace}
    end

    render status_code(exception), {
            successful: false,
            result: {},
            error_messages: exception_data
    }.to_json
  rescue Exception => failsafe_error
    $stderr.puts "Error during failsafe response: #{failsafe_error}\n  #{failsafe_error.backtrace * "\n  "}"
    FAILSAFE_RESPONSE
  end

  def render_json(status, body)
    [status, {'Content-Type' => "application/json; charset=#{Response.default_charset}", 'Content-Length' => body.bytesize.to_s}, [body]]
  end

  end
end