 node {
    stage('Checkout') {
     git 'https://github.com/rbizzell44/aspen.git'
    }

    environment {
    	// Service Account to execute Terraform Code
    	SERVICE_ACCOUNT = credentials('cuit-terraform-project')
    	GOOGLE_PROJECT_ID = 'cuit-terraform-project'
    }

    

    stage('Set Terraform path') {
  	 def tfHome = tool name: 'Terraform'
     env.PATH = "${tfHome}:${env.PATH}"
     sh 'terraform -version'
     sh 'echo $SERVICE_ACCOUNT'
     sh 'echo $GOOGLE_PROJECT_ID'
    
    }
  	
    stage('Provision infrastructure') {
      dir('dev') {
      sh 'terraform init -reconfigure'
      sh 'terraform validate'
      sh 'terraform plan -out=plan'
     // sh 'terraform destroy -auto-approve'
      sh 'terraform apply plan'
    }  

    }
}


