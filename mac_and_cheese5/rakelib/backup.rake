task :backup do
    mkdir_p "deep/backup"
    cp "Rakefile", "deep/backup/Rakefile"
    cp_r "rakelib/", "deep/backup"
end