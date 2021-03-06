# frozen_string_literal: true

require_relative 'neeto_compliance/version'
require_relative 'neeto_compliance/verifiers/wheel_sync_verifier'

class String
  def to_red_color
    "\e[31m#{self}\e[0m" 
  end
end
  
module NeetoCompliance
  class Error < StandardError; end

  class Runner
    def process
      verifiers = [WheelSyncVerifier]

      results = verifiers.map do |verifier| 
        verifier.new.process
      end

      results.all? ? exit(0) : exit(1)
    end
  end
end
