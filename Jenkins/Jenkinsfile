pipeline {
  agent any

  options {
    disableConcurrentBuilds()
    timestamps()
  }

  environment {
    APP_NAME = 'devops-app'
    K8S_NAMESPACE = 'default'
    IMAGE_TAG = "${APP_NAME}:${BUILD_NUMBER}"
    MINIKUBE_PROFILE = 'minikube'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Image (Minikube Docker)') {
      steps {
        bat '''
@echo off
if not exist Dockerfile (
  echo Dockerfile not found in workspace.
  exit /b 1
)
minikube start -p %MINIKUBE_PROFILE% --driver=docker
kubectl config use-context %MINIKUBE_PROFILE%
docker build -t %IMAGE_TAG% .
minikube image load %IMAGE_TAG% -p %MINIKUBE_PROFILE%
'''
      }
    }

    stage('Run Tests') {
      steps {
        bat '''
@echo off
docker run --rm %IMAGE_TAG% pytest test.py
'''
      }
    }

    stage('Deploy to Minikube') {
      steps {
        bat '''
@echo off
kubectl apply -f k8s\\deployment.yaml
kubectl apply -f k8s\\service.yaml
kubectl set image deployment/%APP_NAME% %APP_NAME%=%IMAGE_TAG% -n %K8S_NAMESPACE%
kubectl scale deployment/%APP_NAME% --replicas=1 -n %K8S_NAMESPACE%
kubectl rollout status deployment/%APP_NAME% -n %K8S_NAMESPACE% --timeout=180s
'''
      }
    }

    stage('Verify One Pod Running') {
      steps {
        bat '''
@echo off
for /f %%i in ('kubectl get deploy %APP_NAME% -n %K8S_NAMESPACE% -o jsonpath^={.status.readyReplicas}') do set READY=%%i
if not "%READY%"=="1" (
  echo Expected exactly 1 ready replica, got %READY%
  exit /b 1
)
kubectl get pods -n %K8S_NAMESPACE% -l app=%APP_NAME%
'''
      }
    }
  }

  post {
    success {
      echo 'Minikube deployment completed with 1 ready pod.'
    }
    failure {
      echo 'Pipeline failed. Check stage logs for details.'
    }
  }
}
