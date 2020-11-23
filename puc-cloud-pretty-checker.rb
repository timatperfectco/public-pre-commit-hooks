#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open3'
js_ts_files = ARGV.filter do |filename|
  filename =~ /(\.ts|\.js)$/
end
command = 'node node_modules/eslint/bin/eslint.js -c ./.eslintrc.js --ext .ts '\
          '--ext .js --fix --max-warnings=0 '\
          "\"#{js_ts_files.join(' ')}\""
stdout, stderr, status = Open3.capture3(command)
exit_code = status.exitstatus
puts stderr if exit_code != 0
exit exit_code
