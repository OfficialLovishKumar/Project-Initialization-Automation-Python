#! /usr/bin/zsh

# n = any natural number
# $n = argument passed at number n in the terminal

# Python
# $1 -> Project name
# $2 -> Repository name
# $3 -> Repository discription
# $4 -> Language

# Django
# $1 -> Project name
# $2 -> Repository name
# $3 -> Repository discription
# $4 -> Language
# $5 -> App name

# Flutter
# $1 -> Project name
# $2 -> Repository name
# $3 -> Repository discription
# $4 -> Language

# You can add the languages of your choice and automate the process

# Here -z means is null

# if [ argument 1 passed is null ]
if [ -z $1 ]
then 
    echo "Please provide a project name"
elif [ -z $2 ]
then 
    echo "Please provide a repository name"
elif [ -z $3 ]
then 
    echo "Please provide a repository discription"
# if [ argument 4 passed is not null]
elif [ ! -z $4 ]
then
    # Converting 4 argument to lower case 
    if [ ${4:l} == "python" ]
    then  
        echo "Creating project for python"
        echo "Creating Project $1"
        cd 
        cd "/home/anonymous/Programming/Projects"
        mkdir $1
        cd "$1"
        touch README.md
        touch main.py
        git init
        # Passing arguments to python script
        python3 "/home/anonymous/Programming/Projects/Project Initialization Automation/main.py" $1 $2 $3 ${4:l}
        git add .
        git commit -m "Initial Commit" 
        echo "Happy Coding"
        code .
        fi
    elif [ ${4:l} == "django" ]
    then  
        echo "Creating project for django"
        echo "Creating Project $1"
        cd 
        cd "/home/anonymous/Programming/Projects"
        mkdir $1
        cd "$1"
        git init
        touch README.md
        django-admin startproject .
        if [ ! -z $5 ]
        then 
            python3 manage.py startapp $5
        else
            python3 manage.py startapp app
        fi
        git add .
        git commit -m "Initial Commit"
        python3 "/home/anonymous/Programming/Projects/Project Initialization Automation/main.py" $1 $2 $3 ${4:l}
        echo "Happy Coding"
        code .
        python3 manage.py runserver
    elif [ ${4:l} == "flutter" ]
    then
        echo "Creating project for flutter"
        echo "Creating Project $1"
        echo
        cd 
        cd "/home/anonymous/Programming/Projects"
        mkdir $1
        cd "$1"
        git init
        touch README.md
        flutter create $1
        git add .
        git commit -m "Initial Commit"
        python3 "/home/anonymous/Programming/Projects/Project Initialization Automation/main.py" $1 $2 $3 ${4:l}
        echo "Happy Coding"
        code .
        cd 
        cd "/home/anonymous/Android/Sdk/emulator"
        ./emulator -avd Pixel_3a_API_30_x86
else   
    echo "Creating Project $1"
    cd 
    cd "/home/anonymous/Programming/Projects"
    mkdir $1
    cd "$1"
    git init
    touch README.md
    git add .
    git commit -m "Initial Commit"
    python3 "/home/anonymous/Programming/Projects/Project Initialization Automation/main.py" $1 $2 $3 
    echo "Happy Coding"
    code .
fi