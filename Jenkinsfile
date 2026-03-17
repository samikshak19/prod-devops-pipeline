pipeline {  
	agent any  
		  stages {    
			  stage('Clone Repository') {      
				  steps {        
					  git 'https://github.com/samikshak19/prod-devops-pipeline.git', branch: 'main', credentialsId: 'Jenkins-git'      
					  steps  {  
						  git (url: 'https://github.com/samikshak19/prod-devops-pipeline.git',    
							   branch: 'main',    credentialsId: 'Jenkins-git')            
							      }    
				  }    
				  stage('Build Docker Image') {      
					  
					  steps {        sh 'docker build -t devops-app .'   
							} 
				  }    
				  
				  stage('Run Container') {      
					  
					  steps {        
						  sh 'docker run -d -p 5001:5001 devops-app'      
					}    
				  }  
			  }
		  }

