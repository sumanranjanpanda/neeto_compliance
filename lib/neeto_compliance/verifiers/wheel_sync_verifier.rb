# frozen_string_literal: true

module NeetoCompliance
  class WheelSyncVerifier
    FILES = [
          ".editorconfig",
          ".eslintrc.js",
          ".nvmrc",
          ".prettierrc.js",
          ".rubocop.yml",
          ".vscode/extensions.json",
          ".vscode/settings.json"
    ]

    def process
      are_files_in_sync_with_wheel?
    end

    private

    def are_files_in_sync_with_wheel?
      error_files = []
      FILES.each do |file|
        !latest?(file) && (error_files << file)
      end

      unless error_files.empty?
        puts '-' * 80
        puts "Update these files from https://github.com/bigbinary/wheel: \n\n#{error_files.join("\n")} \n".to_red_color
        puts '-' * 80
      end

      error_files.empty?
    end

    def latest?(file)
      remote_file = "https://raw.githubusercontent.com/bigbinary/wheel/master/#{file}"

      system("curl -s #{remote_file} | diff #{file} -")
    end
  end
end