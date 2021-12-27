    node {
            stage ('Cleanup') {
                writeFile file: 'cleanup.sh', text:
                "rm -rf pipelinef"
                 sh "bash cleanup.sh"
            }
             
            stage ('Scm checkout') {
                git branch: 'main', url: 'https://github.com/myronovich/demo3'
                "git clone --branch main https://github.com/myronovich/demo3 main"
            }
            stage ('Npm install') {
                writeFile file: 'install.sh', text: 
                "cd /var/lib/jenkins/workspace/pipelinef\nnpm install"
                 sh "bash install.sh"
            }
            stage ('Npm build') {
                writeFile file: 'npmbuild.sh', text: 
                "cd /var/lib/jenkins/workspace/pipelinef\nnpm run build\ncd build\nmkdir dev\nmv static dev"
                 sh "bash npmbuild.sh"
            }
            stage ('Docker Build') {
                writeFile file: 'build.sh', text: 
                "cd /var/lib/jenkins/workspace/pipelinef\ndocker build . -t us.gcr.io/gcp101233-lv61301devops/646/newteachfront:build-$BUILD_NUMBER"
                sh "bash build.sh"
            }
            stage ('Docker Push') {
                writeFile file: 'push.sh', text:
                "docker push us.gcr.io/gcp101233-lv61301devops/646/newteachfront:build-$BUILD_NUMBER/frontend:latest"
                sh "bash push.sh"
            }
        }
