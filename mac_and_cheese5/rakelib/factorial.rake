# rake factorial N=5
task :factorial do
    n = (ENV['N'] || 10).to_i
    fact = 1
    (1..n).each do |i|
        fact = fact * i
    end
    puts "Factorial of #{n} is #{fact}"
end