pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                checkout([
                    $class: 'GitSCM',
				    branches: [[name: '*/*']],
		            doGenerateSubmoduleConfigurations: false,
	         	    extensions: [],
                    submoduleCfg: [],
			        userRemoteConfigs: [[url: 'https://github.com/VaibhavPrajapati/Basic-PHP-Application.git']]
                ])					
			    withDockerContainer('composer') {
			        script {
				        echo "install compose.json"
                        sh 'composer install --prefer-source'				
			        }					
                }
            }
        }
        stage('Test') {
            when {
                expression {
                    GIT_BRANCH ==~ /.*master|.*feature|.*development|.*hotfix/
                }
            }
            steps {
			    script {
				    echo "Running Test cases"
			     	sh './vendor/bin/phpunit --colors tests'				
			    }    
            }
        }
		stage('CodeAnalysis') {
            when {
                expression {
                    GIT_BRANCH ==~ /.*master|.*feature|.*development|.*hotfix/
                }
            }
            steps {			
			    script {
                    scannerHome = tool name: 'sonar-scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                }                
                withSonarQubeEnv('sonar-server') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
		stage('StoreArtifact') {
            when {
                expression {
                    GIT_BRANCH ==~ /.*master|.*feature|.*development|.*hotfix/
                }
            }
            steps {
			    script{
			    	echo "Store Artifact in local workspace"
				    sh 'tar -cvf ${BUILD_NUMBER}.tar  .'
                    archiveArtifacts '*.tar'
			    }
            }
        }
    }
}