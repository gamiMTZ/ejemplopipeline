pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('gamiMTZ-Docker-creds') // Replace with your Docker Hub credentials ID
        DOCKERHUB_REPO = 'gamimtz/my-jenkins-images'
    }

    stages {
        stage('Obtener código') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url: 'https://github.com/gamiMTZ/ejemplopipeline.git'
            }
        }

        stage('Compilar código Java') {
            steps {
                echo 'Inicio de compilación del código Java'
                // Check if javac is available
                sh 'which javac'
                // Compile Java program
                sh 'javac Programa.java'
                echo 'Fin de compilación del código Java'
            }
        }

        /*stage('Ejecución código Python') {
            steps {
                echo 'Ejecución del código en Python'
                // Check if python3 is available
                sh 'which python3'
                // Run Python script
                sh 'python3 Programa.py'
            }
        }*/

        stage('Test') {
            steps {
                script {
                    //busca el método mostrarEnConsola en Programa.java
                    def result = sh(script: 'grep -q "mostrarEnConsola()" Programa.java', returnStatus: true)
                    if (result != 0) {
                        error('Method mostrarEnConsola() not found in Programa.java')
                    } else {
                        echo 'Method mostrarEnConsola() found in Programa.java'
                    }
                }
            }
        }

        stage('Ejecución código Java') {
            steps {
                echo 'Ejecutando programa Java'
                // Run the compiled Java program
                sh 'java Programa'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("${env.DOCKERHUB_REPO}:${env.BUILD_NUMBER}")
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed.'
        }
        success {
            echo 'Pipeline succeeded.'
        }
    }
}
