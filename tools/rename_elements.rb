# -*- coding: utf-8 -*-
# Program do zmiany nazw elementów ConvML w plikach tekstowych

require 'nokogiri'

def create_rename_hash
  doc = Nokogiri::XML(File.open("../xslt/convml_update_10to12.xslt"))
  rename_hash = {}
  renames = doc.xpath("//ren:element", 'ren' => 'http://entertech.com.pl/xslt/rename')
  renames.each {|r| rename_hash[r["from"]] = r["to"] }
  rename_hash
end

def rename_elements(rename_hash, file_in, file_out=file_in + ".out", prefix="=")
  f_str = ""
  File.open(file_in, "rb") do |f|
    f_str = f.read
  end

  puts "#{file_in} encoding: #{f_str.encoding}"

  rename_hash.keys.sort.reverse.each do |k|
    f_str.gsub!(prefix + k, prefix + rename_hash[k])
  end

  File.open(file_out, "wb") do |f|
    f.puts f_str
  end
end

FILES = ["polish.lng", "english.lng"]

rh = create_rename_hash
FILES.each { |fn| rename_elements(rh, fn) }
