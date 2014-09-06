task :churn => [] do
  sh 'bundle exec churn'
end

task :lili => [] do
  sh 'bundle exec lili .'
end

task :lint => [
  :churn,
  :lili
] do
end
