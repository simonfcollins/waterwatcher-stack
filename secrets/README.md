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
    exho "password" | docker secret create springboot_db_password -
    ```

---

### 3. `cloudflared_creds`
- **Purpose:** Cloudflared tunnel credentials to authenticate tunnel connection.
- **Used by:** Cloudflared service in the ingress stack.
- **Notes:**  
  - Auto generated and saved to ~/.cloudflared/ with the following command:
    ```bash
        cloudflared tunnel create <tunnel_name>
    ```
  - Must be created in Docker Swarm before deploying the stack: 
    ```bash
    docker secret create cloudflared_creds ~/.cloudflared/<tunnel_uuid>.json
    ```
  - Encrypt or otherwise secure the original credentials file after this secret has been created.

---
