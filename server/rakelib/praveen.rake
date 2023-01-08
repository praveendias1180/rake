=begin
rake praveen:clean_testing
rake praveen:composer_i
=end

namespace :praveen do
    # rake praveen:clean_testing
    desc "Clean testing directory"
    task :clean_testing do
        rm_rf "testing"
        puts "Removed testing directory"
    end

    # rake praveen:composer_i
    desc "Run composer install"
    task :composer_i => [:copy_composer_json, :update_env] do
        Dir.chdir("testing") do
            sh "composer require praveendias1180/pdf"
        end
    end

    task :create_testing_dir do
        mkdir_p "testing"
        puts "Created a testing/ directory"
    end

    task :change_to_testing => [:create_testing_dir] do
        Dir.chdir("testing") do
            touch "index.php"
        end
    end

    task :copy_composer_json => [:change_to_testing] do
        cp "composer.json.backup", "testing/composer.json"
    end



    task :copy_env do
        cp ".env", "testing/.env"
    end

    task :update_env => [:copy_env] do
        env_file = "testing/.env"
        env = File.read(env_file)
        filtered_env = env.gsub('http://localhost:8888','https://mysite.com')
        File.open(env_file, "w") do |f|
            f.write(filtered_env)
        end
        puts filtered_env
    end
end