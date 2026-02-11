# config.nu - Nushell Configuration
# Translated from Fish shell configuration

# History configuration
$env.config = ($env.config | upsert history {
    max_size: 1000000
    sync_on_enter: true
    file_format: "plaintext"
})

# Disable greeting
$env.config = ($env.config | upsert show_banner false)

# Fix terminal rendering issues
$env.config = ($env.config | upsert use_ansi_coloring true)
$env.config = ($env.config | upsert render_right_prompt_on_last_line false)
$env.config = ($env.config | upsert buffer_editor null)
$env.config = ($env.config | upsert shell_integration {
    osc2: false
    osc7: false
    osc8: false
    osc9_9: false
    osc133: false
    osc633: false
    reset_application_mode: false
})
$env.config = ($env.config | upsert cursor_shape {
    vi_insert: line
    vi_normal: block
})

# Initialize zoxide
source ~/.config/nushell/zoxide.nu

# Initialize fzf (using fzf keybindings for Nushell)
# Note: fzf integration in Nushell is different from Fish
# You may need to set up keybindings manually or use a Nushell fzf wrapper

# Aliases
alias hx = helix
alias cd = z
# alias ls = eza --icons=always
# alias ll = ls -la
alias gist = git status
alias gip = git pull origin HEAD and git fetch
alias cls = clear

# Custom Functions

# audl - YouTube audio downloader
def audl [url: string, outdir: string] {
    if ($url | is-empty) or ($outdir | is-empty) {
        print "Usage: audl <url> <output-folder>"
        return
    }
    
    mkdir $outdir
    
    yt-dlp --cookies-from-browser firefox -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o $"($outdir)/%(title)s.%(ext)s" $url
}

# dcon - Devcontainer exec wrapper
def dcon [...args] {
    devcontainer exec --workspace-folder . ...$args
}

# gitdeb - Git workflow shortcut
def gitdeb [message?: string] {
    git add .
    
    if ($message | is-empty) {
        git commit --fixup HEAD
    } else {
        git commit -m $message
    }
    
    git push origin HEAD
}

# ripl - Find and replace across files
def ripl [find: string, replace: string] {
    let files = (rg $find -l | lines)
    
    for file in $files {
        sed -i $"s/($find)/($replace)/g" $file
    }
}
