# What is MCP?

MCP (Multi-Container Pipeline) is a CI/CD approach where different stages of a Jenkins pipeline run inside isolated containers. This improves consistency, scalability, and reliability during application deployment.

Jenkins MCP is used to:

- Build the Python application
- Run tests
- Create Docker images
- Deploy the application to Kubernetes

Using MCP helps avoid dependency conflicts and ensures the same environment is used across development, testing, and production.


# MCP Workflow

GitHub → Jenkins → Docker Build → Container Registry → Kubernetes


# Benefits of MCP

- Isolated build environments
- Faster and reliable deployments
- Easy scalability
- Consistent runtime environments
- Better security and portability

---

# Technologies Used

- Jenkins
- Python
- Docker
- Kubernetes
- GitHub

<img width="999" height="512" alt="p1" src="https://github.com/user-attachments/assets/36737470-0071-402f-aa50-92cc3691d0b7" />

