task :default do
  exec("rerun -x -c -p '**/*.cr' crystal run src/tr5.cr");
end

task :test do
  exec("rerun -p '**/*.cr' crystal run spec/all_spec.cr");
end