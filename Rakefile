task :default => [:test]

# Testuje schemę
task :test do
  Dir.chdir("test") do
    rake
  end
end

# Buduje i wysyła na serwer dokumentację
task :deploy do
  Dir.chdir("doc") do
    rake "deploy"
  end
end


def rake(*args)
  ruby "-S", "rake", *args
end
