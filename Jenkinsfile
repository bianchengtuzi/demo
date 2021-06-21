pipeline{
  agent any
  tools{
    maven 'maven'
  }
  stages(){
//     stage("项目信息"){
//      steps{
//        script{
//          openshift.withCluster(){
//            openshift.withProject(){
//              echo "项目名称: ${openshift.project()}"
//            }
//          }
//        }
//      }
//     }
    stage("项目信息"){
      steps{
        script{
//           openshift.withCluster(){
//             openshift.withProject(){
              echo openshift.project()
//             }
//           }
        }
      }
    }
    stage("打包"){
      steps{
        script{
          sh 'mvn clean package'
          //sh "mvn clean package -Popenshift" 
          echo "hello,pipeline"
        }
      }
    }
    stage("构建"){
      steps{
          sh 'rm -rf builds && mkdir builds && cp Dockerfile builds && cp target/jeesite.war builds'
          sh 'oc start-build jeesite-pipeline-bc2 --from-dir builds --follow -n jeesite-pipeline'
//           sh 'oc new-app harbor-cicd.apps.com/library/jeesite-app:v5 --name jeesite-pipeline-dc-1 --allow-missing-imagestream-tags=true --insecure-registry=true -n jeesite-pipeline'
//           sh  'oc start-build jeesite-pipeline-bc --from-dir builds --follow -n jeesite-pipeline'
//           openshiftBuild(namespace: 'jeesite-pipeline', bldCfg: 'jeesite-pipeline-bc', showBuildLogs: 'true')
      }
    }
    stage("部署"){
       steps{
          echo "Deployment"
//           sh 'oc new-app harbor-cicd.apps.com/library/jeesite-app:v5 --name jeesite-pipeline-dc-1 --allow-missing-imagestream-tags=true --insecure-registry=true -n jeesite-pipeline'
       }
    }
  }
}
