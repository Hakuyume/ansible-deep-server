export LANG=en_US.utf8

if [[ -z $TMUX ]]; then
    if $(tmux has-session); then
        exec tmux attach
    else
        exec tmux -f {{ prefix }}/tmux.conf
    fi
fi

source {{ prefix }}/share/git/completion/git-completion.bash
source {{ prefix }}/share/git/completion/git-prompt.sh
PS1='[\u@\h \W$(__git_ps1)]\$ '

export PYTHONIOENCODING=utf8
if [[ -n $PYTHONVENV ]]; then
    source $PYTHONVENV/bin/activate
    pip install -U \
        cython \
        matplotlib \
        mock \
        nose \
        pillow \
        pip \
        setuptools
    export MPLBACKEND=agg
fi
function venv(){
    local PYTHONVENV=$(mktemp --tmpdir -d XXXXXXXX)
    python3 -m venv --system-site-packages $PYTHONVENV
    PYTHONVENV=$PYTHONVENV bash
    rm -r $PYTHONVENV
}

CUDA_PATH={{ prefix }}/cuda
if echo $PATH | grep -v $CUDA_PATH > /dev/null; then
    export PATH="$CUDA_PATH/bin:$PATH"
fi
export LD_LIBRARY_PATH="$CUDA_PATH/lib64"
