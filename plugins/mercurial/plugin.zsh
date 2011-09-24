# autoload comp
fpath=( ~/.zsh/plugins/mercurial/comp $fpath )
autoload -U ~/.zsh/plugins/mercurial/comp/*(:t)

# mercurial zeesh plugin
alias hgi='hg id -n -b -t'
alias hgs='hg status'
alias hga='hg add -v'
alias hgr='hg rm -f -v'
alias hgpl='hg pull'
alias hgps='hg push'
alias hgf='hg fetch'
alias hgu='hg up'
_hg_commit(){
    if [[ $# == 0 ]]; then
        echo 'commit message missing'
    else
        local ci_message=''
        for i; do
            ci_message="$ci_message $i"
        done
        hg ci -m "$ci_message"
    fi
}
alias hgc='noglob _hg_commit'
alias hgcp='hg ci && hg push'
alias hgm='hg merge'
alias hgl='hg log'
alias merge_local='hg --config ui.merge=internal:local merge'
alias merge_other='hg --config ui.merge=internal:other merge'

function bb(){
    hg $1 bb $@[2,-1]
}

function repose-create(){
    ssh hg "./create_repo.py $@"
}
