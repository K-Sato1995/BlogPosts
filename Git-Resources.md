# References

## Dealing With Merge Conflicts 
- [Dealing With Merge Conflicts](https://www.git-tower.com/learn/git/ebook/en/command-line/advanced-topics/merge-conflicts)

## git push の取り消し方法 
- [git push の取り消し方法 | WWWクリエイターズ](http://www-creators.com/archives/2020)

## Put commits together
- [rebase -i でコミットをまとめる - Qiita](https://qiita.com/takke/items/3400b55becfd72769214)

## Check out remote branch onto your local pc
- [リモートのgitブランチをローカルにチェックアウトする - setoya-blog](https://www.setoya-blog.com/entry/2012/11/04/132746)

```
$ git checkout -b other_branch origin/other_branch
```
## Git Command Aliases 

```
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
```

## Untrack already tracked filed

- [My Post about it](https://k-sato1995.github.io/blog/untrack-already-tracked-files-in-your-git-repository)

## Git Reset 

```
--soft: uncommit changes, changes are left staged (index).
--hard: uncommit + unstage + delete changes, nothing left.
--mixed (default): uncommit + unstage changes, changes are left in working tree.
```


## Git Tags 
- [Git Basics - Tagging](https://git-scm.com/book/en/v2/Git-Basics-Tagging)

```
# Show all tags
$ git tag
# Create a tag 
$ git tag -a v1.4 -m "my version 1.4"
# Create a tag with a specific commit hash 
$  git tag -a v1.2 9fceb02 -m 'my version 0.1.0'
# Show the tag data along with the commit that was tagged 
$ git show v1.4
# Sharing a tag
$ git push origin v1.5
# Sharing tags 
$ git push origin --tags
# Deleting tags 
$ git tag -d v1.4
# Delete a remote tag
$ git push origin --delete <tagname>
```
