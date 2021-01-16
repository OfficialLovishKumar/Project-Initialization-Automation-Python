import sys
import os
from github import Github

# To create access token in github
# Go to https://github.com/settings/tokens/
# And create a token for yourself
user = Github("youraccesstoken").get_user()

projectName = sys.argv[0]
pathOfProject = f"/home/anonymous/Programming/Projects/{projectName}"

with open(f"Readme.md", 'w') as f:
    f.write(f"# {sys.argv[0]}\n\n")
    f.write("## Questions")

repoName = sys.argv[1]
repoDescription = sys.argv[2]

repo = user.create_repo(repoName, repoDescription)

# I am using SSH you can also use HTTP in the url below
os.system(f"git remote add origin git@github.com:OfficialLovishKumar/{repoName}.git")
os.system("git push -u origin master")
