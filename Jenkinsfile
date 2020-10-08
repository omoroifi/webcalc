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
    }
}
