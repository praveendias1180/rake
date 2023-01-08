namespace :db do
    username = 'praveen'
    time_now = Time.new.strftime("%Y-%m-%d-%H-%M-%S")

    task :print_dir do
        sh "pwd"
    end

    task :list_dbs_ do
        sh "mysql -u #{username} -p -e 'show databases;'"
    end

    # rake db:list_dbs
    task :list_dbs do
        mkdir_p "backups"
        sh "mysql -u #{username} -p --table -e 'show databases;' > backups/dbtables-#{time_now}.txt"
    end

    task :dump_db, [:db_name] do |t, args|
        mkdir_p "backups"
        system("mysqldump -u #{username} -p #{args.db_name} > backups/#{args.db_name}-backup-#{time_now}.sql")
    end

    # rake db:clear_backup
    task :clear_backup do
        sh "rm -rf backups/*.txt"
    end

    task :run do
        Rake::Task["db:list_dbs"].reenable
        Rake::Task["db:list_dbs"].invoke
    end
end