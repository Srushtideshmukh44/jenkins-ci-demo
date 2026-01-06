# Jenkins CI Pipeline with SonarQube, Docker & Email Notifications
# Project Overview
  This project demonstrates a complete Continuous Integration (CI) pipeline implemented using Jenkins, SonarQube, and Docker on a local Windows machine.

The pipeline automatically pulls source code from GitHub, performs static code analysis using SonarQube, enforces Quality Gates, builds a Docker image only when the Quality Gate passes, and sends email notifications on build success or failure.

All sensitive information (tokens, passwords, credentials) is securely managed using Jenkins Credentials, with no hardcoded secrets.
