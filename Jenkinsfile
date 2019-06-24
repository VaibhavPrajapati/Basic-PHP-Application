pipeline {
    agent any

    stages {
        stage('Get code from SCM') {
            steps {
                checkout([$class: 'GitSCM',
				branches: [[name: '*/*']],
				doGenerateSubmoduleConfigurations: false,
				extensions: [],
				submoduleCfg: [],
				userRemoteConfigs: [[url: 'https://github.com/VaibhavPrajapati/Basic-PHP-Application.git']]])	
            }
        }
        stage('Composer Install') {
        sh 'composer install'
		}
          stage("PHPLint") {
		    when {
        branch 'master'
    }
    steps {
         sh './vendor/bin/phpunit --colors tests'
    }
 
    
  }
		  
    }
}
