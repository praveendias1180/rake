# rake world:go_to_store

namespace :world do
    task :go_to_store do
        p "World: Going to the Store in a Rake File"
    end
end

task :go_to_store do
    p "Normal: Going to the Store in a Rake File"
end