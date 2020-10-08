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
        stage("confirm deploy") {
            steps {
                input "deploy to production?"
            }
        }
    }
}

def publishRobot() {
    step([
        $class : 'RobotPublisher',
        outputPath : 'test',
        outputFileName : "*.xml",
        disableArchiveOutput : false,
        passThreshold : 100,
        unstableThreshold: 95.0,
        otherFiles : "*.png",
    ])
}
