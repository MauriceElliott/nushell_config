let hostname = (hostname | str trim)

if $hostname == "KB-GH85FB4" {
    $env.PATH = ($env.PATH | prepend "/root/go/bin")
    $env.PATH = ($env.PATH | prepend "/home/mauricelliott/.local/bin")
}

if $hostname == "eighthcircle" {
    $env.PLAYDATE_SDK_PATH = $"($env.HOME)/PlaydateSDK"
    $env.PATH = ($env.PATH | prepend $"($env.PLAYDATE_SDK_PATH)/bin")
    $env.PDSIM = $"($env.PLAYDATE_SDK_PATH)/bin/PlaydateSimulator"
}

if $hostname == "ninthCircle" {
    $env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin")

    $env.PLAYDATE_SDK_PATH = $"($env.HOME)/Developer/PlaydateSDK"
    $env.PATH = ($env.PATH | prepend $"($env.PLAYDATE_SDK_PATH)/bin")
    $env.PDSIM = $"($env.PLAYDATE_SDK_PATH)/bin/Playdate Simulator.app/Contents/MacOS/Playdate Simulator"
}

