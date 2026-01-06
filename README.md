# Jenkins CI Pipeline with SonarQube, Docker & Email Notifications
# Project Overview
  This project demonstrates a complete Continuous Integration (CI) pipeline implemented using Jenkins, SonarQube, and Docker on a local Windows machine.

The pipeline automatically pulls source code from GitHub, performs static code analysis using SonarQube, enforces Quality Gates, builds a Docker image only when the Quality Gate passes, and sends email notifications on build success or failure.

All sensitive information (tokens, passwords, credentials) is securely managed using Jenkins Credentials, with no hardcoded secrets.

# 🛠️ Tools & Technologies

Jenkins – CI automation server

GitHub – Source code repository

SonarQube (Docker-based) – Static code analysis

SonarScanner – Jenkins-managed analysis tool

Docker – Container image build

SMTP (Gmail) – Email notifications

Windows OS – Local execution environment
# ⚙️ Environment Setup (Summary)

Jenkins installed on Windows

Docker Desktop installed and running

SonarQube running as a Docker container on port 9000

Jenkins plugins installed:

Git

Pipeline

SonarQube Scanner

Credentials

Email Extension

SonarQube container:
# docker run -d --name sonarqube -p 9000:9000 sonarqube:lts

# 📁 Repository Structure
.
├── index.html        # Sample application file
├── Dockerfile        # Docker image definition
├── Jenkinsfile       # Jenkins CI pipeline
└── README.md         # Documentation

# CI Pipeline Workflow
GitHub
  ↓
Jenkins Checkout
  ↓
SonarQube Analysis
  ↓
Quality Gate Check
  ↓ (PASS only)
Docker Image Build
  ↓
Email Notification


# Architecture Diagram
+-------------+
|   GitHub    |
| (Source)    |
+------+------+ 
       |
       v
+--------------+        +--------------------+
|   Jenkins    |------->|    SonarQube        |
| (CI Server)  |        | (Docker Container) |
+------+-------+        +---------+----------+
       |                          |
       |<----- Quality Gate ------+
       |
       v
+--------------+
|   Docker     |
| Image Build  |
+------+-------+
       |
       v
+--------------+
| Email Alert  |
| (SMTP)       |
+--------------+

# 🔐 Jenkins Credentials Used

All credentials are stored securely in Jenkins Credentials Store:

GitHub Credentials – Secure repository access

SonarQube Token – Jenkins ↔ SonarQube authentication

SMTP Credentials – Gmail App Password for email alerts

👉 No credentials are hardcoded in the Jenkinsfile.

# 🧩 Jenkins Pipeline Stages

# Checkout Code

  Pulls source code from GitHub.

# SonarQube Analysis

Runs static code analysis using SonarScanner.

# Quality Gate Enforcement

Pipeline waits for SonarQube Quality Gate result.

 Pipeline fails automatically if Quality Gate = ERROR.

# Docker Image Build

Docker image is built only if Quality Gate passes.

# Email Notifications

Email sent on SUCCESS or FAILURE with build details.

# ✅ Conclusion

This project delivers a production-style CI pipeline that:

Enforces code quality using SonarQube

Prevents bad code from being containerized

Automates Docker image creation

Notifies users via email

Follows real-world DevOps best practices


