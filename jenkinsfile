pipeline {
    agent any
    environment {
        IMAGE_NAME = 'lucky050/tiktok-clone'
        IMAGE_TAG = '2.0'
        GITHUB_URL = 'https://github.com/Lucky059/TikTok-Clone.git'
    }
    stages {
        stage('Get App Code') {
            steps {
                echo 'Getting the Application Source Code'
                git branch: 'master', url: GITHUB_URL
            }
        }
        stage('Build Image') {
            steps {
                echo 'Building the Docker image'
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }
        stage('Docker Login and Push Image') {
            steps {
                echo 'Logging in and pushing Docker image to repository'
                
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'dockerhubUser',
                    passwordVariable: 'dockerhubPass'
                )]) {
                    sh '''
                        echo ${dockerhubPass} | docker login -u ${dockerhubUser} --password-stdin
                        docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    '''
                }
            }
        }
    }
    post {
        always {
            echo 'Logging out of Docker'
            sh 'docker logout'
        }
    }
}
