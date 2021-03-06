module Linkable
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    def default_url_options
      ActionMailer::Base.default_url_options
    end

    def md_link(text = name)
      url_method = "#{self.class.to_s.underscore}_url"
      id ? "[#{text}](#{send(url_method, self, only_path: false)})" : "#{text}"
    end
  end
end
