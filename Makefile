.PHONY: go everybody post refresh repost timeline

everybody:
	./follow-everybody.bash

go: everybody refresh timeline

post:
	git commit -m $(p) --allow-empty
	git vain
	git push

refresh:
	git fetch --all

repost:
	git cherry-pick $(p)

timeline-graph:
	git log --graph --all --decorate --oneline

timeline:
	git rev-list --all --remotes --pretty | less

timeline-short:
	git log --format="format:%Cred%cd %Cblue%h %Cgreen%cn%Creset: %s" --all --date=iso-local
