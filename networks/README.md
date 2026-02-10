# Docker Networks Documentation

This document describes the Docker overlay networks used by the application.  
Networks are used to control communication between services in the Docker Swarm and to enforce security boundaries between internal and external traffic.

---

## Networks

### 1. `internal`
- **Driver:** `overlay`
- **Scope:** Docker Swarm
- **Internal:** Yes (`--internal`)
- **Purpose:**  
  Used for **internal service-to-service communication only**.
- **Used by:**  
  - NGINX  
  - Backend services  
  - Certbot services  
- **Notes:**  
  - Containers on this network cannot access the public internet directly.
  - External access is blocked by design for security reasons.
  - Ideal for databases, internal APIs, and private services.

**Creation command:**
```bash
docker network create \
  --driver overlay \
  --internal \
  internal
```

### 2. `external`
- **Driver:** `overlay`
- **Scope:** Docker Swarm
- **Internal:** No 
- **Purpose:**  
  Allows services to initiate **outbound internet connections**.
- **Used by:**  
  - Certbot (Let’s Encrypt communication)
  - Spring Boot
  - HRRR Service
  - Any service that needs external API access
- **Notes:**  
  - Services attached to this network can reach the internet.
  - Should be attached only to services that require external connectivity.

**Creation command:**
```bash
docker network create \
  --driver overlay \
  outbound
```

