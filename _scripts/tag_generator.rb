#!/usr/bin/env ruby

require 'yaml'
require 'fileutils'

post_dir = "_posts/"
tag_dir = "tag/"

filenames = Dir.glob(File.join(post_dir, "*.md"))

all_tags = []

filenames.each do |filename|
  relevant_lines = []
  crawl = false
  File.open(filename).each_line do |line|
    if line == "---\n"
      crawl = !crawl
      next
    end
    next if !crawl
    relevant_lines << line
  end
  yaml = relevant_lines.join("\n")
  tags = YAML.load(yaml)["tags"]
  all_tags += tags
end

FileUtils.rm_rf(Dir.glob(File.join(tag_dir, "*.md")))

all_tags.uniq.each do |tag|
  tag_filename = File.join(tag_dir, "#{tag}.md")
  File.open(tag_filename, "w") do |f|
    content = "---\nlayout: tagpage\ntitle: \"Tag: #{tag}\"\ntag: #{tag}\ntagpage: true\nrobots: noindex\n---\n"
    f << content
  end
end

puts "Tags generated: #{all_tags.uniq.count}"