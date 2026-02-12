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
  - Must be created in Docker Swarm before deploying the stack: 
    ```bash
    echo "your_db_password_here" | docker secret create springboot_db_password -
    ```
  - Keep this secret secure; do not expose it in version control.

---

### 3. `cloudflared_creds`
- **Purpose:** <tunnel_uuid>.json credential file for verifying .
- **Used by:** Cloudflared service in the ingres stack.
- **Notes:**  
  - Auto generated and saved to ~/.cloudflared/ with the following command:
    ```bash
        cloudflared tunnel create <tunnel_name>
    ```
  - Must be created in Docker Swarm before deploying the stack: 
    ```bash
    docker secret create cloudflared_creds ~/.cloudflared/<tunnel_uuid>.json
    ```
  - Keep this secret secure; do not expose it in version control.
  - Encrypt or otherwise secure the original credentials file after this secret has been created.

---
