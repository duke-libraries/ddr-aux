module DdrAux
  class ApiConstraints

    attr_reader :version, :default

    def initialize(version:, default: false)
      @version = version
      @default = default
    end

    def matches?(request)
      default || has_accept_version_header?(request)
    end

    private

    def has_accept_version_header?(request)
      request.headers["Accept"].include?("application/vnd.ddr-aux.v#{version}")
    end

  end
end
