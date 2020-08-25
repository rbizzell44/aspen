pipeline {
	agent none
       environment {
          	GOOGLE_APPLICATION_CREDENTIALS = credentials('terraform-auth')
          	GOOGLE_PROJECT_ID      = 'cloudbuild-gitops'
        }

	stages {
      stage('Checkout') {
        steps {
        	checkout scm
        	sh 'echo $GOOGLE_APPLICATION_CREDENTIALS'
        	sh 'echo $GOOGLE_PROJECT_ID'
		}
	}
	   // Get the Terraform tool.
	  stage('Set Terraform path') {
	   	steps {
	   	    def tfHome = tool name: 'Terrform', type: 'com.cloudbees.jenkins.plugins.customtools.CustomTool'
	   	    env.PATH = "${tfHome}:${env.PATH}"
	   	    sh 'terraform  --version' 

	   	}
	}

	  stage('Provision infrastructure') {
	  	steps {
	  	    dir('dev')
	        sh 'terraform init'		
	  	
	  	}
	}
}	    	    

}




	    
 

