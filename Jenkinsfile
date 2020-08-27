 node {
  stage('Checkout') {
    git 'https://github.com/rbizzell44/aspen.git'
  }

  stage('Say ECHO') {
    sh "echo 23"
  }
}
        
  stage('Set Terraform path') {
  	steps {
    def tfHome = tool name: 'Terraform'
    env.PATH = "${tfHome}:${env.PATH}"
  	}
  	sh 'terraform -version'
    
    }

