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
		   when {
                    not {
                    anyOf {
                      branch 'master';
                      branch 'hotfix'
                  }
                 }
                }
            steps {
                sh './vendor/bin/phpunit --colors tests'
            }
        }
	    }
    }
