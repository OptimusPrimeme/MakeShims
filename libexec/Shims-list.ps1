. $psscriptroot/../Config/ShimConfig.ps1
# (ls G:\software\Global_shims -Exclude *-Shims* | select  -u BaseName).BaseName #ls结果的对象有basename这个属性,可以去除后缀之前的重名
#  ls G:\software\Global_shims -Exclude *-Shims* | select  -u -ExpandProperty BaseName
ls $shimdir -Exclude *-Shims* | foreach -MemberName BaseName|Get-Unique