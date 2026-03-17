#  Production DevOps CI/CD Pipeline

##  Project Overview

This project demonstrates an end-to-end DevOps pipeline where application code is automatically built, containerized, and deployed using modern DevOps tools.

---

##  Architecture

GitHub → Jenkins → Docker → Kubernetes → Application

---

##  Tools & Technologies

* AWS (EC2)
* Terraform (Infrastructure as Code)
* Jenkins (CI/CD)
* Docker (Containerization)
* Kubernetes (Deployment & Scaling)
* GitHub (Version Control)

---

##  What This Project Does

1. Developer pushes code to GitHub
2. Jenkins automatically triggers pipeline
3. Docker image is built
4. Application is deployed to Kubernetes
5. Application becomes accessible

---

##  How to Run Locally

### Step 1: Build Docker Image

docker build -t devops-app .

### Step 2: Run Container

docker run -p 5000:5000 devops-app

### Step 3: Deploy to Kubernetes

kubectl apply -f k8s/

---

##  Project Structure

* app/ → Application code
* terraform/ → Infrastructure setup
* k8s/ → Kubernetes deployment files
* Jenkinsfile → CI/CD pipeline
* Dockerfile → Container setup

---


