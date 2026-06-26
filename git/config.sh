## Set Git on Windows to NOT convert to CRLF
git config --global core.autocrlf false

## Set Git aliases
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.sync-main "!git fetch upstream && git checkout main && git reset --hard upstream/main && git push origin main"
git config --global alias.pushf "push origin HEAD"
git config --global alias.c "commit"
git config --global alias.revert-last "!git revert HEAD --no-edit && git push"
git config --global alias.feature "!f() { BRANCH=\${1:-\$(hostname)-\$(date +%m-%d-%H-%M)}; git sync-main && git push origin main --force && git checkout -b \$BRANCH && git push -u origin \$BRANCH; }; f"
git config --global alias.undo-last "reset --soft HEAD~1"
git config --global alias.unstage-last "reset HEAD~1"
