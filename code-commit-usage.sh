sudo yum update -y
sudo yum install git -y

#IAM - attach following to user: arn:aws:iam::aws:policy/AWSCodeCommitFullAccess
#IAM - create access key & download
#IAM - generate credentials for "HTTPS Git credentials for AWS CodeCommit"

aws configure

aws codecommit create-repository --repository-name RepoFromCLI --repository-description "My demonstration repository"

#create text.txt file in repo through AWS console and "commit"

#Code Commit - Copy <HTTPS Clone URL>

git clone <HTTPS Clone URL> #credentials from "HTTPS Git credentials for AWS CodeCommit"

ls
cd RepoFromCLI
ls

nano test.txt #edit file

git add test.txt #add file to push list

git commit -m "added test.txt" #commit with comments (using default username & email)

git log #check repo's log

git push -u origin main #push to main branch

#in case of issues:

git status -z -u #show active / current repos cloned on the system (and maybe monitored folders)

git reset #clear list above
