if status is-interactive
end

# alias 

function l
    exa $argv
end

function ls
    exa $argv
end

function cd
    z $argv
end

function ..
    cd ..
end
function ....
    cd ../..
end

function ......
    cd ../../../
end

function ........
    cd ../../../../
end

function fishconfig
    nvim ~/.config/fish/config.fish
end

set -Ux EDITOR nvim
set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8

starship init fish | source
zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
