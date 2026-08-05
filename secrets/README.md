# Docker Secrets Documentation

This document describes the required Docker secrets necessary for deployment of the 
Water Watcher application. All secrets should be kept secure and not exposed in 
version control.

---

## Secrets

### 1. `postgres_password`
- **Purpose:** Superuser password used exclusively during initialization.
- **Used by:** postgres-db service to initialize PostgreSQL database.
- **Notes:**  
  - Must be created in Docker Swarm before deploying the stack:  
    ```bash
    echo "password" | docker secret create postgres_password -
    ```

---

### 2. `springboot_db_password`
- **Purpose:** Non-superuser password for backend app authentication.
- **Used by:** spring-backend service.
- **Notes:**  
  - Must be created in Docker Swarm before deploying the stack: 
    ```bash
    echo "password" | docker secret create springboot_db_password -
    ```

---
