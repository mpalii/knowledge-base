## GIT notes:

### 1. Installation and configuration
* Download and install [GIT](https://git-scm.com/download "Git - Downloads")
* To configure SSH  connection with remote repository follow the next steps: 
	- Execute next command to generate SSH pair of public and private keys:  
	`ssh-keygen -t rsa -C "username@email.com"`  
	`ssh-keygen -t ed25519 -C "username@email.com"`  
	- Files **id_rsa** and **id_rsa.pub** will be generated in *~/.ssh* folder
	- Send public key **id_rsa.pub** to repository owner
* Configure contributor information:
	- Configure username and email on global level:  
	`git config --global user.name "globalUserFirstName globalUserLastName"`  
	`git config --global user.email "globalUser@email.com"`
	- To set custom user name and email for specific project move to the project folder and set values:  
	`git config --local user.name "localUserFirstName localUserLastName"`  
	`git config --local user.email "localUser@email.com"`  
	or without `--local` flag  
	`git config user.name "localUserFirstName localUserLastName"`  
	`git config user.email "localUser@email.com"`

### 2. Common commands
* [git-clone](https://git-scm.com/docs/git-clone "Git - git-clone Documentation"). Clone remote repository into an appropriate directory on a local machine:  
`git clone git@github.com:username/demo-repository.git` copy remote repository to local folder
* [git-status](https://git-scm.com/docs/git-status "Git - git-status Documentation"). Show the working tree status:  
`git status`
* [git-remote](https://git-scm.com/docs/git-remote "Git - git-remote Documentation"). Manage set of tracked repositories:  
`git remote`  
`git remote --verbose`  
`git remote remove <name>`  
`git remote add <name> <url>`  
`git remote show <name>`  
* [git-log](https://git-scm.com/docs/git-log "Git - git-log Documentation"). Show commit log:  
`git log`  
`git log --graph --all --oneline --decorate`
* [git-add](https://git-scm.com/docs/git-add "Git - git-add Documentation"). Add file contents to the index:  
`git add <pathspec>`  
`git add *`
* [git-commit](https://git-scm.com/docs/git-commit "Git - git-commit Documentation"). Record changes to the repository:  
`git commit -m <message>`  
`git commit --amend`  
`git commit --amend --no-edit`  
`git commit --amend -m <message>`
* [git-branch](https://git-scm.com/docs/git-branch "Git - git-branch Documentation"). List, create, or delete branches:  
`git branch`  
`git branch <branchname>`
`git branch --all`  
`git branch --remotes`  
`git branch --delete <fully merged branch>`  
`git branch --delete --force <branch>`  
`git branch --delete --remotes <name>/<remote branch name>`
* [git-checkout](https://git-scm.com/docs/git-checkout "Git - git-checkout Documentation"). Switch branches or restore working tree files:  
`git checkout <branch>`  
`git checkout <tag>`  
`git checkout <commit>`  
`git checkout -- <filename>` восстановление до последней известной git версии  
`git checkout .`  
`git checkout -b <branchname>`  
* [git-push](https://git-scm.com/docs/git-push "Git - git-push Documentation"). Update remote refs along with associated objects:  
`git push`  
`git push --force`  
`git push --tags`  
* [git-fetch](https://git-scm.com/docs/git-fetch "Git - git-fetch Documentation"). Download objects and refs from another repository:  
`git fetch`  
`git fetch <name>`  
* [git-merge](https://git-scm.com/docs/git-merge "Git - git-merge Documentation"). Join two or more development histories together:  
`git merge`  
`git merge <branch>`  
`git merge --no-ff`  
* [git-pull](https://git-scm.com/docs/git-pull "Git - git-pull Documentation"). Fetch from and integrate with another repository or a local branch:  
`git pull`  
* [git-gui](https://git-scm.com/docs/git-gui "Git - git-gui Documentation"). A portable graphical interface to Git:  
`git gui`  
`git gui&`  
* [gitk](https://git-scm.com/docs/gitk/ "Git - gitk Documentation"). The Git repository browser:  
`gitk`  
`gitk&`  
* [git-show](https://git-scm.com/docs/git-show "Git - git-show Documentation"). Show various types of objects:  
`git show <object>`  
`git show -s --pretty=raw <object>`  
* [git-ls-tree](https://git-scm.com/docs/git-ls-tree "Git - git-ls-tree Documentation"). List the contents of a tree object:  
`git ls-tree <tree-ish>`  
`git ls-tree -r <tree-ish>`  
* [git-clean](https://git-scm.com/docs/git-clean "Git - git-clean Documentation"). Remove untracked files from the working tree:  
`git clean -xdf <filename>`  
* [git-reset](https://git-scm.com/docs/git-reset "Git - git-reset Documentation"). Reset current HEAD to the specific state:  
`git reset -- <filename>`  
`git reset HEAD~2`  
`git reset HEAD^^`  
`git reset --soft HEAD~1`  
`git reset --mixed HEAD~1`  
`git reset --hard HEAD~1`  
* [git-revert](https://git-scm.com/docs/git-revert "Git - git-reset Documentation"). Revert some existing commits:  
`git revert <commit>`  
* [git-rebase](https://git-scm.com/docs/git-rebase "Git - git-rebase Documentation"). Reapply commits on top of another base tip:  
`git rebase <branch>`  
* [git-cherry-pick](https://git-scm.com/docs/git-cherry-pick "Git - git-cherry-pick Documentation"). Apply the changes introduced by some existing commits:  
`git cherry-pick <commit>`  
* [git-tag](https://git-scm.com/docs/git-tag "Git - git-tag Documentation"). Create, list, delete or verify a tag object signed with GPG:  
`git tag <tagname>`  
`git tag --list`  
* [git-stash](https://git-scm.com/docs/git-stash "Git - git-stash Documentation"). Stash the changes in a dirty working directory away:  
`git stash save <message>`  
`git stash list`  
`git stash pop <stash>`  
`git stash apply <stash>`  
`git stash drop <stash>`  


![alt text](https://i.imgur.com/oodiCnB.png)
