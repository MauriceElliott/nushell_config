# env.nu - Nushell Environment Configuration
# Translated from Fish shell configuration

# Host-specific configuration
let hostname = (hostname | str trim)

if $hostname == "KB-GH85FB4" {
    # _kblaptop.fish configuration
    $env.PATH = ($env.PATH | prepend "/root/go/bin")
    $env.PATH = ($env.PATH | prepend "/home/mauricelliott/.local/bin")
}

if $hostname == "eighthcircle" {
    # _eighthcircle.fish configuration
    # Note: Swiftly environment files would need to be sourced manually
    # or converted to Nushell format if they exist
    
    # Playdate SDK
    $env.PLAYDATE_SDK_PATH = $"($env.HOME)/PlaydateSDK"
    $env.PATH = ($env.PATH | prepend $"($env.PLAYDATE_SDK_PATH)/bin")
    $env.PDSIM = $"($env.PLAYDATE_SDK_PATH)/bin/PlaydateSimulator"
}

if $hostname == "ninthCircle" {
    # _9thcircle.fish configuration
    $env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin")
    
    # Playdate SDK
    $env.PLAYDATE_SDK_PATH = $"($env.HOME)/Developer/PlaydateSDK"
    $env.PATH = ($env.PATH | prepend $"($env.PLAYDATE_SDK_PATH)/bin")
    $env.PDSIM = $"($env.PLAYDATE_SDK_PATH)/bin/Playdate Simulator.app/Contents/MacOS/Playdate Simulator"
}

# Source local variables if they exist
# Note: Due to Nushell's parse-time restrictions, this needs to be a literal path
# If you have local_variables.nu, uncomment the line below:
# source ~/.config/nushell/local_variables.nu
