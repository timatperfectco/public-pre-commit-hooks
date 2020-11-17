#!/usr/bin/env ruby
# frozen_string_literal: true

branch_name = `git rev-parse --abbrev-ref HEAD`
regexp_str = '^(feat|fix|docs|release|hotfix)/'
if branch_name != ~ Regexp.new(regexp_str)
  puts 'BRANCH NAMING POLICY:'
  puts '  see https://docs.google.com/document/d/1IRgB9pwL7yRC6SLLwiySBQZ2ZV0mpKiJo0j7UU7m9ew/edit?usp=sharing'
  puts "  #{regexp_str}"
  exit 1
end

exit 0
