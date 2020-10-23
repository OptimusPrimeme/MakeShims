param($apps)
. $psscriptroot/../Config/ShimConfig.ps1

foreach ($app in $apps){# 用数组来接收任意参数
    if(test-path -path "$shimdir\*$app*"){
        $targets = (ls -path "$shimdir\"| ? {$_.Name -like  "*$app*"})# 右侧返回的对象存放在数组中,用$targets接收
        write-host "$(($targets|select -u BaseName).BaseName) exist"
        $ans = read-host -p "Confirm to delete?(y/N)"
        if($ans -ceq "y") # c case-sensitive大小写敏感
        {
            write-host "Deleting..."
            foreach ($target in $targets){
                rm $shimdir\$target
            }
            
        }
    }
    else
    {
        write-host "$app not found"
    }
    
}
