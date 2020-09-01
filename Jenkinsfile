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
  	
    stage('Terraform Init') {
      dir('dev') {
      sh 'terraform init -reconfigure'	
      }
    }
  
    stage('Terraform Validate') {
       dir('dev') {
       sh 'terraform validate'
       }
    }
   
    stage('Terraform Plan') {
      dir('dev') {
      sh 'terraform plan -out=plan'
      }
    }

    stage('Run Pytest') {
      dir('test') {
      sh ' echo pytest'	
      }

    }
    stage('Terraform Apply') {
      dir('dev'){
      sh 'terraform apply plan'	
      }

    }
}    