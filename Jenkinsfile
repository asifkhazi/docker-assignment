pipeline {
	agent {label "new-node"}
	environment {
		ECR_Login=credentials('ECR_Login')
                ECR_Repo="myecrrepo"
                ECR_URI=credentials('ECR_URI')
	}
	stages {
		stage ('SCM Checkout Stage') {
			steps {
				git branch: 'main', url: 'https://github.com/asifkhazi/docker-assignment.git'
			}
		}
		stage ('Build Satge') {
			steps {
				sh 'docker build -t ${ECR_URI}/${ECR_Repo}:${BUILD_NUMBER} .'
			}
		}
		stage ('Push Stage') {
			steps {
				sh '${ECR_Login}'
       			        sh 'echo "Login Succeded"'
				sh 'docker puch ${ECR_URI}/${ECR_Repo}:${BUILD_NUMBER}'
			}
		}
		stage ('Deploy Satge') {
			steps {
				sh 'docker run -d --name cont-${BUILD_NUMBER} -p 8080:8080 ${ECR_URI}/${ECR_Repo}:${BUILD_NUMBER}'
			}
		}
	}	
}
