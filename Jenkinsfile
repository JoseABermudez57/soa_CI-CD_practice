pipeline {
    
    agent any
    
    stages {
        stage('Build') {
            steps {
                def imageId = sh(script: 'docker images -q soa-deploy:latest', returnStdout: true).trim()
                if (imageId != "") {
                    def contenerdorId = sh(script: 'docker ps -q -f name=soa-deploy-test', returnStdout: true).trim()
                    if (contenerdorId != "") {
                        sh "docker stop soa-deploy-test"
                        sh "docker rm soa-deploy-test"  
                        sh "docker rmi soa-deploy:latest"
                    } else {
                        sh "docker rmi soa-deploy:latest"
                    }
                }
                echo 'Building image docker...'
                sh "docker build -t soa-deploy:latest ."                
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing server...'
                sh 'npm install'
                sh 'npm install --production'
                sh 'npm install mocha'
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh 'npm test'
                }
        }
        
        stage('Deploy') {
            
            steps {
                script {
                    def imageId = sh(script: 'docker images -q soa-deploy:latest', returnStdout: true).trim()
                    if (imageId != "") {
                        def contenerdorId = sh(script: 'docker ps -q -f name=soa-deploy-test', returnStdout: true).trim()
                        if (contenerdorId != "") {
                            sh "docker stop soa-deploy-test"
                            sh "docker rm soa-deploy-test"
                            sh "docker rmi soa-deploy:latest"
                        } else {
                            sh "docker rmi soa-deploy:latest"
                        }
                    }
                    echo 'Building image docker...'
                    sh "docker build -t soa-deploy:latest ."
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing ...'
                sh 'npm install'
                sh 'npm install --production'
                sh 'npm install mocha'
                catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                    sh 'npm test'
                }
            }
        }
    }
}


post {
        success {
            script {
                def containerRunning = sh(script: 'docker ps -q -f name=soa-deploy-test', returnStdout: true).trim()
                if (containerRunning) {
                    sh "docker stop soa-deploy-test"
                    sh "docker rm soa-deploy-test"
                }
                sh "docker run -d -p 3000:3000 --name soa-deploy-test soa-deploy:latest"
            }
        }
        failure {
            echo 'Build failed. No deployment will be done.'
        }
    }
}