# Docker Secrets Documentation

This document describes the required Docker secrets necessary for deployment of the 
Water Watcher application.

---

## Secrets

### 1. `postgres_password`
- **Purpose:** Superuser password used exclusively during initialization.
- **Used by:** postgres-db service to initialize PostgreSQL database.
- **Notes:**  
  - Must be created in Docker Swarm before deploying the stack:  
    ```bash
    echo "your_db_password_here" | docker secret create postgres_password -
    ```
  - Keep this secret secure; do not expose it in version control.

---

### 2. `springboot_db_password`
- **Purpose:** Non-superuser password for backend app authentication.
- **Used by:** spring-backend service.
- **Notes:**  
  - Create the secret in Swarm before deployment:  
    ```bash
    echo "your_db_password_here" | docker secret create springboot_db_password -
    ```
  - Keep this secret secure; do not expose it in version control.

---

### 3. `certbot_email`
- **Purpose:** Email address for Let's Encrypt notifications and certificate renewal.  
- **Used by:** Certbot container/service.  
- **Notes:**  
  - Required for SSL certificate management.  
  - Example creation command:  
    ```bash
    echo "your_email@example.com" | docker secret create certbot_email -
    ```

---
