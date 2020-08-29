function __fish_okta_complete_profiles
  cat ~/.aws/config | grep -e "\[[^(okta)]" | awk -F'[] []' '{print $3}'
end

function __fish_complete_okta_subcommand
  set -l tokens (commandline -opc) (commandline -ct)
  set -l index (contains -i -- -- (commandline -opc))
  set -e tokens[1..$index]
  complete -C"$tokens"
end

set -l okta_commands add exec help login version
complete -f -c aws-okta -n "not __fish_seen_subcommand_from $okta_commands" -a add -d 'add your okta credentials'
complete -f -c aws-okta -n "not __fish_seen_subcommand_from $okta_commands" -a exec -d 'exec will run the command specified with aws credentials set in the environment'
complete -f -c aws-okta -n "not __fish_seen_subcommand_from $okta_commands" -a help -d 'help about any command'
complete -f -c aws-okta -n "not __fish_seen_subcommand_from $okta_commands" -a login -d 'login will authenticate you through okta and allow you to access your AWS environment through a browser'
complete -f -c aws-okta -n "not __fish_seen_subcommand_from $okta_commands" -a version -d 'print version'

complete -f -c aws-okta -n "__fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from (__fish_okta_complete_profiles)" -a "(__fish_okta_complete_profiles)"

complete -f -c aws-okta -n "__fish_seen_subcommand_from (__fish_okta_complete_profiles); and not __fish_seen_subcommand_from --" -a "--"

complete -c aws-okta -n "contains -- -- (commandline -opc)" -x -a "(__fish_complete_okta_subcommand)"
