# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::Base
      include Pundit
      protect_from_forgery with: :null_session

      before_action :restrict_access, except: [:routing_error]
      before_action :set_locale
      attr_reader :current_user

      rescue_from Exception, with: :handling_exceptions
      rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
      rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
      rescue_from ::Pundit::NotAuthorizedError, with: :render_no_permission

      def routing_error
        raise ::V1::Exceptions::RoutingError.new(request.method, params[:path])
      end

      private
        def restrict_access
          @current_user = User.from_authentication_token(auth_token)

          raise ::V1::Exceptions::AuthenticationError.new, "authentication error" if @current_user.nil? || @current_user.access_locked?
        end

        def auth_token
          pattern = /^Token /
          header  = request.authorization
          header.gsub(pattern, "") if header && header.match(pattern)
        end

        def handling_exceptions(e)
          exception = if e.is_a?(::V1::Exceptions::Error)
            e
          else
            Rails.logger.error { "Internal Server Error: #{e.message} #{e.backtrace.join("\n")}" }

            ::V1::Exceptions::InternalServerError.new(e)
          end

          render_errors(exception)
        end

        def render_parameter_missing(e)
          render_errors ::V1::Exceptions::ParameterMissingError.new(e.param)
        end

        def render_record_not_found(e)
          render_errors ::V1::Exceptions::RecordNotFoundError.new(e.message, params)
        end

        def render_record_invalid(e)
          render_errors ::V1::Exceptions::RecordInvalidError.new(e.record)
        end

        def render_no_permission(e)
          render_errors ::V1::Exceptions::NoPermissionError.new(e.query.to_s.delete("?"))
        end

        def render_errors(e)
          render json: e, status: e.status and return
        end

        def set_locale
          I18n.locale = params[:locale]
        rescue
          I18n.locale = I18n.default_locale
        end
    end
  end
end
