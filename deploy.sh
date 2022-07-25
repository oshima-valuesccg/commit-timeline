REPOSITORY_NAME="committimeline"
ECR_NAME="034119254429.dkr.ecr.ap-northeast-1.amazonaws.com"
ECR_REPOSITORY_NAME="${ECR_NAME}/${REPOSITORY_NAME}"

docker build --platform=linux/amd64 . -t ${REPOSITORY_NAME}:latest

aws --profile bouquet ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin ${ECR_NAME}

docker tag ${REPOSITORY_NAME}:latest ${ECR_REPOSITORY_NAME}:latest

docker push ${ECR_REPOSITORY_NAME}:latest