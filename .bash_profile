[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# https://raw.github.com/jimeh/git-aware-prompt
#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#source $GITAWAREPROMPT/main.sh

#export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
