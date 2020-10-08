pipeline {
    agent {
        label "python3"
    }
    stages {
        stage("static analysis") {
            parallel {
                stage("flake8") {
                    steps {
                        sh("flake8 src/*.py")
                    }
                }
                stage("rflint") {
                    steps {
                        sh("python3 -m rflint test/*.robot")
                    }
                }
            }
        }
        stage("deploy to staging") {
            steps {
                sshagent(['deploy-key']) {
                    sh("./ci/deploy.sh web_test")
                }
            }
        }
        stage("acceptance tests") {
            steps {
                sh("test/run.sh web_test")
            }
            post {
                always {
                    publishRobot()
                }
            }
        }
    }
}
