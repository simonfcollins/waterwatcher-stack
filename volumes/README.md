# Docker Volumes Documentation

This document describes the Docker volumes used by the application.  
Volumes are used to persist data outside of containers so that data is not lost when containers are recreated.

---

## Volumes

### 1. `certbot-etc`
- **Purpose:** Stores Certbot configuration files, certificates, and keys.  
- **Used by:** Certbot container/service for SSL certificate management.  
- **Notes:**  
  - Persistent across Certbot container updates.
  - Do **not** delete unless you want to remove all SSL certificates.

---

### 2. `certbot-web`
- **Purpose:** Temporary volume used for the webroot challenge when obtaining SSL certificates.  
- **Used by:** Certbot container/service during the certificate verification process.  
- **Notes:**  
  - Can be safely recreated; its contents are not critical long-term.

---

### 3. `postgres-data`
- **Purpose:** Stores PostgreSQL database data files.  
- **Used by:** Postgres container/service.  
- **Notes:**  
  - Persistent across container restarts or recreations.
  - Backup this volume regularly to avoid data loss.

---

### 4. `hrrr-data`
- **Purpose:** Stores High Resolution Rapid Refresh (HRRR) meteorological forecast datasets in the zarr format.
- **Used by:** hrrr-service (read-only), hrrr-client (read/write).
- **Notes:**  
  - Can be safely recreated. 

---

## Usage Instructions

1. To create the volumes manually (if needed):
```bash
docker volume create certbot-etc
docker volume create certbot-web
docker volume create pgdata
docker volume create hrrr-data
