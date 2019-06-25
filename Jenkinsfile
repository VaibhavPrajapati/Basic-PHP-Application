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
		 steps {
        		sh 'composer install'
			}
		}
          stage("PHPLint") {
		   if (env.BRANCH_NAME != 'development' && env.BRANCH_NAME != 'hotfix') {
        echo 'This is not master or staging'
    }
		     
    }
	  }
    }


