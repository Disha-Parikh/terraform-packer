	pipeline {
	 agent any

	 stages {
	 stage('checkout') {
	 steps {
	 git branch: 'master', url: 'https://github.com/Disha-Parikh/terraform-packer.git'}
	 }

	 stage("Provision infrastructure") {
	 steps {
         script{
	    sh "pwd"
	    sh "cd packer"
	    sh "packer build -var 'ami_name_prefix=http-benchmarking' template.json"
	    sh "cd /var/lib/jenkins/workspace/terraform_packer/terraform"
	    sh "terraform init"
            sh "terraform plan -out=plan"
            sh 'terraform apply plan'


            }

         }
        }
	 }

	 post
	 {
	    always{

            script{
              def userinput = input(
                id: 'userInput', message: 'Do you want to destroy existing infrastructure?', parameters: [
                [$class: 'TextParameterDefinition', defaultValue: 'yes', description: 'Environment', name: 'Opinion']
               ])
                echo (userinput)

                if(userinput=="yes"){
                                         sh 'terraform destroy -auto-approve'
                            }
                else{
                    echo "Infrastructure stands as it is!"
                }

	    }
	    }
	 }



	 }



