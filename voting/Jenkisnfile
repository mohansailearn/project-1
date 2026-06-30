pipeline
{
    agent any
    stages
    {
        stage('Download')
        {
            steps
            {
                git 'https://github.com/IntelliqDevops/voting.git'
            }
        }
        stage('Build docker images')
        {
            steps
            {
                sh 'cd /var/lib/jenkins/workspace/EndtoEndProject/vote;docker build -t intelliqit/votingapp .'
            
                sh 'cd /var/lib/jenkins/workspace/EndtoEndProject/result;docker build -t intelliqit/resultapp .'
                
                sh 'cd /var/lib/jenkins/workspace/EndtoEndProject/worker;docker build -t intelliqit/workerapp .'
            }
        }
        stage('Push docker images')
        {
            steps
            {
                sh 'docker push intelliqit/votingapp'
                sh 'docker push intelliqit/workerapp'
                sh 'docker push intelliqit/resultapp'
            }
        }
        stage('Deploy to qa servers as containers')
        {
            steps
            {
                sh 'ssh ubuntu@172.31.37.185  ansible-playbook project.yml -b'
            }
        }
        stage('Download and run selenium scripts')
        {
            steps
            {
                git 'https://github.com/IntelliqDevops/FunctionalTesting.git'
                sh 'java -jar /var/lib/jenkins/workspace/EndtoEndProject/testing.jar'
                
            }
        }
        stage('Deploy into k8s cluster')
        {
            steps
            {
                sh 'ssh ec2-user@172.31.44.135 kubectl apply -f voting/k8s-specifications/'
            }
        }
    }
}
