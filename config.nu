$env.config = ($env.config | upsert history {
    max_size: 1000000
    sync_on_enter: true
    file_format: "plaintext"
})

$env.config = ($env.config | upsert show_banner false)

# Fix terminal rendering issues
$env.config = ($env.config | upsert shell_integration {
    osc133: false
})

$env.config = ($env.config | upsert cursor_shape {
    vi_insert: line
    vi_normal: block
})

source ~/.config/nushell/zoxide.nu

alias hx = helix
alias cd = z
alias ls = eza --icons=always
alias ll = ls -la
alias gist = git status
alias gip = git pull origin HEAD and git fetch
alias cls = clear

# Custom Functions
def audl [url: string, outdir: string] {
    if ($url | is-empty) or ($outdir | is-empty) {
        print "Usage: audl <url> <output-folder>"
        return
    }
    
    mkdir $outdir
    
    yt-dlp --cookies-from-browser firefox -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o $"($outdir)/%(title)s.%(ext)s" $url
}

def dcon [...args] {
    devcontainer exec --workspace-folder . ...$args
}

def gitdeb [message?: string] {
    git add .
    
    if ($message | is-empty) {
        git commit --fixup HEAD
    } else {
        git commit -m $message
    }
    
    git push origin HEAD
}

def ripl [find: string, replace: string] {
    let files = (rg $find -l | lines)
    
    for file in $files {
        sed -i $"s/($find)/($replace)/g" $file
    }
}

echo ""
fastfetch
echo ""
