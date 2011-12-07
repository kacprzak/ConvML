require 'nokogiri'
doc = Nokogiri::XML(File.open("xslt/convml_update_10to12.xslt"))

rename_hash = {}
renames = doc.xpath("//ren:element", 'ren' => 'http://entertech.com.pl/xslt/rename')
renames.each {|r| rename_hash[r["from"]] = r["to"] }

puts rename_hash
puts rename_hash.keys.sort {|a,b| b.length <=> a.length}
#puts rename_hash

File.open('polish.lng', "r") do |f|
  pol_str = f.read
  rename_hash.each do |k, v|
    pol_str.gsub!(k, v)
  end
  File.open('polish2.lng', "w") do |out|
    out.puts pol_str
  end
end
