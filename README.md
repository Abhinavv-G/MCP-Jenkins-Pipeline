# MCP-Integrated Jenkins CI/CD Pipeline

An AI-driven CI/CD pipeline where Cursor AI communicates with Jenkins 
through a Model Context Protocol (MCP) server to autonomously trigger 
builds, run tests, containerize applications, and deploy to Kubernetes 
— without manual pipeline interaction.

## Why This Is Different
Traditional CI/CD requires manual pipeline configuration and triggering.
This project lets an AI agent (Cursor) control Jenkins programmatically 
via MCP, making the entire DevOps workflow AI-orchestrated.

## Architecture
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/b8394991-b8c4-499d-9a03-3075415885a1" />

## Pipeline Flow
Cursor AI → MCP Server → Jenkins → Docker Build → pytest → 
Docker Hub → Kubernetes (Minikube)

## Tech Stack
| Layer | Tool |
|---|---|
| AI Agent | Cursor AI |
| Protocol | MCP (Model Context Protocol) |
| CI/CD | Jenkins |
| Containerization | Docker |
| Orchestration | Kubernetes (Minikube) |
| Language | Python |
| Registry | Docker Hub |
| Source Control | GitHub |

## What the Pipeline Does
1. Cursor AI sends instructions to Jenkins via MCP Server
2. Jenkins triggers build and runs automated tests
3. Dynamic image generation and validation during test phase
4. Docker image built and pushed to registry
5. Deployed to Kubernetes cluster via Minikube

## Key Concepts
- AI ↔ DevOps toolchain integration via MCP
- Autonomous pipeline orchestration without manual triggers
- Container lifecycle management from build to deployment
- Kubernetes pod scheduling and service exposure
