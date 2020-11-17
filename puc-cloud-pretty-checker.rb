#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open3'
js_ts_files = ARGV.filter do |filename|
  filename =~ /(\.ts|\.js)$/
end
command = 'node node_modules/eslint/bin/eslint.js -c ./.eslintrc.js --ext .ts '\
          '--ext .js --fix --max-warnings=0 '
command += "\"#{js_ts_files.join(' ')}\"" unless js_ts_files.empty?
stdout, stderr, status = Open3.capture3(command)
exit_code = status.exitstatus
puts stdout
if stderr != ''
  puts 'STDERR:'
  puts stderr
end
exit exit_code
