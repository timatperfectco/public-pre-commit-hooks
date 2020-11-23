#!/usr/bin/env ruby
# frozen_string_literal: true

require 'open3'
js_ts_files = ARGV.filter do |filename|
  filename =~ /(\.ts|\.js)$/
end
if js_ts_files.empty?
  exit 0
else
  command = 'node node_modules/eslint/bin/eslint.js -c ./.eslintrc.js --fix '\
            "--max-warnings=0 #{js_ts_files.join(' ')}"
  stdout, stderr, status = Open3.capture3(command)
  exit_code = status.exitstatus
  puts stdout
  if stderr != ''
    puts 'STDERR:'
    puts stderr
  end
  exit exit_code
end
