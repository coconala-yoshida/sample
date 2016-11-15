def execute_command(command)
  command_result = ''
  IO.popen(command, :err => [:child, :out]).each { |line| command_result << line }
  command_result
end

RESPONSES = {
  :checkout_master_01 => "Switched to branch 'master'",
  :checkout_master_02 => "Already on 'master'",
  :pull_origin_master => "Already up-to-date."
}

command_result = execute_command('git checkout master')
if (!command_result.include?(RESPONSES[:checkout_master_01]) && !command_result.include?(RESPONSES[:checkout_master_02]))
  raise "failed to switch to master branch"
end
