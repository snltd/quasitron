lib-dir := ".lib"
fennel-version := "1.6.1"
docsetdir := env("HOME") / ".local/share/fennel-ls/docsets"

default:
    @just --list
    
# Play the game
play:
    love .

# Run unit tests
test:
    fennel --add-fennel-path ".lib/?.fnl" test/run.fnl

# Install all tooling
set-me-up: get-fennel get-docset get-faith

# Install fennel
get-fennel: _lib-dir
    curl -o "{{lib-dir}}/fennel.lua" https://fennel-lang.org/downloads/fennel-{{fennel-version}}.lua

# Install Love2d docset for your language server
get-docset:
    mkdir -p {{docsetdir}}
    curl -o "{{docsetdir}}/love2d.lua" https://p.hagelb.org/docsets/love2d.lua

# Install the faith testing framework
get-faith: _lib-dir
    curl -o "{{lib-dir}}/faith.fnl" https://git.sr.ht/~technomancy/faith/blob/main/faith.fnl

_lib-dir:
    mkdir -p {{lib-dir}}
