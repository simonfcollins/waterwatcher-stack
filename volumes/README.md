# Docker Volumes Documentation

This document describes the Docker volumes used by the application.  
Volumes are used to persist data outside of containers so that data is not lost when containers are recreated.

---

## Volumes

### 1. `postgres-data`
- **Purpose:** Stores PostgreSQL database data files.  
- **Used by:** Postgres container/service.  
- **Notes:**  
  - Persistent across container restarts or recreations.
  - Backup this volume regularly to avoid data loss.

---

### 2. `hrrr-data`
- **Purpose:** Stores High Resolution Rapid Refresh (HRRR) meteorological forecast datasets in the zarr format.
- **Used by:** hrrr-service (read-only), hrrr-client (read/write).
- **Notes:**  
  - Can be safely recreated. 

---

## Usage Instructions

1. To create the volumes manually (if needed):
```bash
docker volume create pgdata
docker volume create hrrr-data
```