BRANCH=$1
REMOTE_HOST=$2
USER_NAME=$3

scp -i ~/.ssh/id_rsa -r ~/build/$BRANCH $USER_NAME@$REMOTE_HOST:/home/$USER_NAME/
