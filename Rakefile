task :default => [:test]

task :test do
  Dir.chdir("test") do
    rake
  end
end

def rake(*args)
  ruby "-S", "rake", *args
end
