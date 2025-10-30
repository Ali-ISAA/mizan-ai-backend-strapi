# Git Setup Guide

Follow these steps to connect your local Strapi Docker project to GitHub.

## Prerequisites

- Git installed on your machine
- GitHub account with access to the repository

## Step-by-Step Commands

### Step 1: Initialize Git Repository

```bash
cd C:\Personal\Projects\strapi_docker
git init
```

### Step 2: Add Remote Repository

```bash
git remote add origin https://github.com/Ali-ISAA/mizan-ai-backend-strapi.git
```

### Step 3: Verify Remote Connection

```bash
git remote -v
```

Expected output:
```
origin  https://github.com/Ali-ISAA/mizan-ai-backend-strapi.git (fetch)
origin  https://github.com/Ali-ISAA/mizan-ai-backend-strapi.git (push)
```

### Step 4: Check Current Branch

```bash
git branch
```

If you're not on 'main' branch, create and switch to it:

```bash
git branch -M main
```

### Step 5: Check What Will Be Committed

```bash
git status
```

You should see:
- ✅ docker-compose.yml
- ✅ Dockerfile
- ✅ entrypoint.sh
- ✅ .env (should be in .gitignore - NOT listed)
- ✅ .gitignore
- ✅ README.md
- ✅ .dockerignore
- ❌ Volumes/ (should NOT be listed - ignored)

### Step 6: Add All Files

```bash
git add .
```

### Step 7: Create Initial Commit

```bash
git commit -m "Initial commit: Strapi Docker setup with PostgreSQL"
```

### Step 8: Push to GitHub

```bash
git push -u origin main
```

If the repository already has content, you might need to force push (only do this if the repo is empty):

```bash
git push -u origin main --force
```

## Verify on GitHub

Go to: https://github.com/Ali-ISAA/mizan-ai-backend-strapi

You should see:
- docker-compose.yml
- Dockerfile
- entrypoint.sh
- .gitignore
- .dockerignore
- README.md
- GIT_SETUP.md (this file)

**Important: .env file should NOT be visible** (it contains secrets)

## Future Commits

After making changes:

```bash
# Check what changed
git status

# Add specific files or all changes
git add .

# Commit with a message
git commit -m "Your commit message here"

# Push to GitHub
git push
```

## Troubleshooting

### Authentication Issues

If prompted for credentials, you may need to:

1. **Use Personal Access Token** (recommended):
   - Go to GitHub Settings → Developer settings → Personal access tokens
   - Generate new token with 'repo' permissions
   - Use token as password when prompted

2. **Or configure Git credentials**:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

### Repository Not Empty Error

If you get an error about the repository not being empty:

```bash
git pull origin main --allow-unrelated-histories
# Resolve any conflicts
git push -u origin main
```

### Check Remote URL

```bash
git remote get-url origin
```

### Change Remote URL (if needed)

```bash
git remote set-url origin https://github.com/Ali-ISAA/mizan-ai-backend-strapi.git
```

## Security Checklist

Before pushing, verify these files are NOT staged:
- ❌ .env (contains secrets)
- ❌ Volumes/ folder (contains database data)
- ❌ node_modules/ (if generated locally)

Check with:
```bash
git status
```

If .env appears in the list, run:
```bash
git rm --cached .env
git commit -m "Remove .env from tracking"
```
