#!/usr/bin/env ruby
# frozen_string_literal: true

branch_name = `git rev-parse --abbrev-ref HEAD`
regexp_str = '^(feat|fix|docs|release|hotfix)/'
matched = Regexp.new(regexp_str).match?(branch_name)
unless matched
  puts 'BRANCH NAMING POLICY:'
  puts '  see https://docs.google.com/document/d/1IRgB9pwL7yRC6SLLwiySBQZ2ZV0mpKiJo0j7UU7m9ew/edit?usp=sharing'
  puts "  #{regexp_str}"
  exit 1
end

# TODO: conventional commit enforcement here?
exit 0
