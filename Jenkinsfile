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
	    sh "cd /var/lib/jenkins/workspace/terraform_packer/packer"
	    sh "/usr/local/bin/packer validate template.json"
	    sh "packer build -var 'ami_name_prefix=http-benchmarking' template.json > /tmp/packer_out.log"
	    sh "echo 'Hopefully I am build an ami' "
	    sh "sleep 6"
	    sh "cd /var/lib/jenkins/workspace/terraform_packer/terraform"
	    sh "/usr/local/bin/terraform init"
            sh "/usr/local/bin/terraform plan -out=plan"
            sh '/usr/local/bin/terraform apply plan'


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



