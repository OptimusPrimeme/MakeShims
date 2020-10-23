param($cmd)


. $psscriptroot\lib\commands



$commands = commands
if (@($null, '--help', '/?') -contains $cmd -or $args[0] -contains '-h') { exec 'help' $args }
elseif ($commands -contains $cmd) { exec $cmd $args }
else { "shims: '$cmd' isn't a shims command. See 'shims help'."; exit 1 }
