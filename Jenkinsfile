// pipeline {
//     agent {
//         docker {
//             image 'oadetiba/cyru8-flask-app:latest'
//         }
//     }
//     stages {
//         stage('Verify') {
//             steps {
//                 echo "${env.GIT_BRANCH}"
//                 sh(script: """
//                 printenv
//                 ls -l '$WORKSPACE'
//                 """)
//            }
//         }

pipeline {
   agent any

   stages {
        stage('Verify Branch') {
            steps {
                echo "${env.GIT_BRANCH}"
           }
        }
        stage('Docker Build') {
            steps {
                sh(script: 'pwd')
                sh(script: """
                ls -l '$WORKSPACE'
                docker build -t pycontainter-demo .
                docker images -a
                docker ps
                """)
           }
        }
        stage('Start test app') {
            steps {
                sh(script: """
                    docker run -d -p 5000:5000 pycontainter-demo
                    docker ps -a
                    ./scripts/test_container.sh
                    """)
            }
        }
        // stage('Start test app') {
        //     steps {
        //         sh(script: """
        //             docker-compose up -d
        //             docker ps -a
        //             docker-compose ps
        //             ./scripts/test_container.sh
        //             """)
        // }
        post {
            success {
                echo "App started successfully :)"
            }
            failure {
                echo "App failed to start :("
                }
            }
        }
        // stage('Run Tests') {
        //     steps {
        //         sh(script: """
        //             echo "Test passed!"
        //             pytest ./tests/test_sample.py
        //             """)
                 
        //     }
        // }
        // stage('Stop test app') {
        //     steps {
        //         sh(script: """
        //         docker-compose down
        //         """)
        //     }
        // }
        // stage("Push Container") {
        //     steps {
        //         echo "Workspace is $WORKSPACE"
        //         dir("$WORKSPACE/azure-vote") {
        //             script {
        //                 docker.withRegistry('', 'DockerHub') {
        //                     def image = docker.build('oadetiba/igp-voting-app')
        //                     echo "Please proceed to push the image..."
        //                     image.push()
        //                 }
        //             }
        //         }
        //     }
        //}
        //Trivy: https://github.com/aquasecurity/trivy
        //stage('Scan Containers for Vulnerabilities with Trivy') {
        //    steps {
        //        sh(script: """
        //        trivy oadetiba/jenkins-course
        //        """)
        //    }
        //}
        //stage('Scan container with anchore for Vulnerability and Policy Compliance') {
        //    steps {
        //        echo "oadetiba/jenkins-course" > anchore_images
        //        anchore name: "anchore_images"
        //    }
        //}
    }
}