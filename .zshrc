
alias charles="_JAVA_OPTIONS="-Xmx8192M" charles"

upd() {
    sudo apt update
    sudo apt upgrade
}

gitall() {
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}
