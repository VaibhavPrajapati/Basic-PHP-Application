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
        sh './vendor/bin/phpunit --colors tests'
    }
    }
}
