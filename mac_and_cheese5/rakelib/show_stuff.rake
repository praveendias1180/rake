# export STUFF=xyz
# rake show_stuff

desc "Show ENV Stuff"

task :show_stuff do
    puts "STUFF = #{ENV['STUFF']}"
end

desc "Show all ENV"
task :show_all do
    p ENV
end

# ONE_TIME="only this time" rake show_one[ONE_TIME]
desc "Show all ENV"
task :show_one, [:name] do |t, args|
    p ENV[args.name]
end