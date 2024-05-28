 pipeline {
    agent any

    //tools {
        // Install the Maven version configured as "M3" and add it to the path.
        //maven "M3"
    //}

    stages {
        stage('Obtener código') {
            steps {
                // Get some code from a GitHub repository
                git clone 'https://github.com/gamiMTZ/ejemplopipeline.git'

                // Run Maven on a Unix agent.
                //sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            //post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
               // success {
               //     junit '**/target/surefire-reports/TEST-*.xml'
               //     archiveArtifacts 'target/*.jar'
               // }
            //}
        }

        stage('Compilar código'){
            steps {
                echo 'Inicio de compilación del código'
                javac Programa.java
                echo 'Fin de compilación del código'
                echo 'Ejecución del código en pyhton'
                python3 Programa.py
            }
        }

        stage("Ejecución"){
            steps {
                echo 'Ejecutando programa'
                java Programa.java
            }
        }
    }
}
