pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                git 'https://github.com/paulahakeem/APP_USED_FOR_ITI_DEVOPS_PROJECT.git'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                docker login -u ${USERNAME} -p ${PASSWORD}
                docker build . -f dockerfile -t paulahakeem/finalapp:v3 --network host
                docker push paulahakeem/finalapp:v3
                """
                }
            }
        }
         stage('CD') {
            steps {
                git 'https://github.com/paulahakeem/APP_USED_FOR_ITI_DEVOPS_PROJECT.git'
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                sh """
                pwd
                ls
                kubectl apply -f /var/jenkins_home/workspace/backend2/deploy.yaml
                kubectl apply -f /var/jenkins_home/workspace/backend2/lb.yaml
                """
                }
            }
        }
    }
}
