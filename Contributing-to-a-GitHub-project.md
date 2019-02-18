# Introduction 
 This is a simple guide for beginners to make a Pull Request and contribute to a GitHub project. 

# Setting up a remote and local environment
 First of all, go to the page of the project you want to contribute to and click the `fork` button which is placed at the upper right corner of the page. This will create a copy of the repository in your own GitHub account. 
 Secondly, you need to create a copy of the project locally on your pc. Go to the page of the project in your account again and get the clone with SSH and run the command below.

```console
$ git clone git@github.com:AccountName/NameOfTheProject.git
```
 Thirdly, change the directory to the project that you've just created.

```console
$ cd NameOfTheProject
```
 Lastly, you need to create a new remote that points to the original project. Go to the page of the project again and find the `SSH clone URL` and use it to create the new remote (upstream) by running the command below.

```console	
$ git remote add upstream git@github.com:AccountName/NameOfTheProject.git
```

 If you followed all the steps above, you now have two remotes for this project.

1. `origin`: This remote points to ==your GitHub fork of the project==. You can __read and write__ to this remote.
- `upstream`: This remote points to the ==original project’s GitHub repository==. You can __only read__ from this remote.

# Create a Pull Request
 First and foremost, make sure the branch that you make a new branch from is up-to-date.  For instance, if you want to create a new branch from the master branch for your PR, you can run commands below.

```console
$ git checkout master
$ git pull upstream master && git push origin master ## Pull from the original project's repository and push it to the clone on your account.
$ git checkout -b NameOfNewBranch 
````
 After your work on your new branch, commit your work and push it to the `origin` remote.

```console
$ git push origin NameOfNewBranch 
```
 Lastly, you can create a `PR` by pressing the green button saying `Compare & pull request`.

If you need more information regarding this matter, check [Here](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/)

# Resources
[firstcontributions](https://github.com/firstcontributions/first-contributions)
[The beginner's guide to contributing to a github-project](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/)

