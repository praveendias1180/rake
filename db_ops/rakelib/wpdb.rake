namespace :wpdb do
    time_now = Time.new.strftime("%Y-%m-%d-%H-%M-%S")

    # rake wpdb:create_db["wp_test_db"]
    task :create_db, [:db_name] do | t, args |
        sh "mysql -u praveen -p -e 'create database `#{args.db_name}` character set utf8'"
    end

    # rake wpdb:show_tables["wp_test_db"]
    task :show_tables, [:db_name] do | t, args |
        sh "mysql -u praveen -p -e 'use `#{args.db_name}`; show tables'"
    end

    # rake wpdb:drop_table[wp_test_db,wp_users]
    task :drop_table, [:db_name, :table_name] do | t, args |
        sh "mysql -u praveen -p -e 'use `#{args.db_name}`; drop table `#{args.table_name}`;'"
    end

    # rake wpdb:describe_table[wp_test_db,wp_users]
    task :describe_table, [:db_name, :table_name] do | t, args |
        sh "mysql -u praveen -p --table -e 'use `#{args.db_name}`; describe `#{args.table_name}`;' > backups/wp_users_describe_#{time_now}.txt"
    end

    # rake wpdb:insert_user_table["wp_test_db"]
    task :insert_user_table, [:db_name] do | t, args |
        sh "mysql -u praveen -p #{args.db_name} < sql/create-wp-user-table.sql"
    end

    # rake wpdb:insert_user["wp_test_db"]
    task :insert_user, [:db_name] do | t, args |
        sh "mysql -u praveen -p #{args.db_name} < sql/create-wp-user.sql"
    end

    # rake wpdb:select_table[wp_test_db,wp_users]
    task :select_table, [:db_name, :table_name] do | t, args |
        sh "mysql -u praveen -p --table -e 'use `#{args.db_name}`; select * from `#{args.table_name}`;' > backups/wp_users_#{time_now}.txt"
    end
end