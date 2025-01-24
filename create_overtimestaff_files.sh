#!/usr/bin/env bash

# --- Create package.json ---
cat <<EOF > package.json
{
  "name": "overtimestaff-platform",
  "version": "1.0.0",
  "description": "Overtimestaff Platform Application for hospitality staffing.",
  "main": "index.js",
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "eslint . --ext .js,.jsx,.ts,.tsx",
    "test": "jest"
  },
  "dependencies": {
    "next": "latest",
    "react": "latest",
    "react-dom": "latest",
    "supabase-js": "^2.0.0",
    "redis": "^4.5.1"
  },
  "devDependencies": {
    "@types/node": "^18.0.0",
    "@types/react": "^18.0.0",
    "@types/react-dom": "^18.0.0",
    "typescript": "^5.0.0",
    "eslint": "^8.0.0",
    "jest": "^29.0.0",
    "@types/jest": "^29.0.0"
  },
  "repository": {
    "type": "git",
    "url": "git@github.com:segzdee/overtimestaff.git"
  },
  "author": "OvertimeStaffDev",
  "license": "MIT"
}
EOF

# --- Create vault.json ---
cat <<EOF > vault.json
{
  "SUPABASE": {
    "URL": "https://xyzcompany.supabase.co",
    "API_KEY": "supabase-service-role-or-anon-key"
  },
  "REDIS": {
    "HOST": "redis-12345.c265.us-east-1-2.ec2.redislabs.com",
    "PORT": "6379",
    "PASSWORD": "yourRedisPassword"
  },
  "OTHER_SENSITIVE_INFO": "Add any other sensitive info here"
}
EOF

# --- Create .gitignore ---
cat <<EOF > .gitignore
# Node modules
node_modules/

# Next.js build output
.next/
out/
build/

# Environment files
.env
.env.local
.env.*.local
*.env

# Vault/secrets
vault.json
vault.*.json

# Logs
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# OS specific
.DS_Store
Thumbs.db

# Editor specific
.vscode/
*.swp
*.swo

# Docker override
docker-compose.override.yml
docker-compose.prod.yml
Dockerfile.dev
EOF

# --- Create README.md ---
cat <<EOF > README.md
# Overtimestaff Platform

The Overtimestaff Platform is a comprehensive application for managing staffing in the hospitality industry.

## Project Setup

1. **Clone the Repository**
   \`\`\`bash
   git clone git@github.com:segzdee/overtimestaff.git
   cd overtimestaff
   \`\`\`

2. **Install Dependencies**
   \`\`\`bash
   npm install
   \`\`\`

3. **Configure Environment**
   - Copy \`vault.json\` (from \`vault.json.example\` or a secure source) to your local environment.
   - Ensure \`.gitignore\` includes \`vault.json\` to protect sensitive info.

4. **Development**
   \`\`\`bash
   npm run dev
   \`\`\`
   This starts the Next.js development server on [http://localhost:3000](http://localhost:3000).

5. **Build for Production**
   \`\`\`bash
   npm run build
   \`\`\`

6. **Start (Production)**
   \`\`\`bash
   npm run start
   \`\`\`

## Features
- Integration with Supabase for auth and data management.
- Redis for caching and session handling.
- Next.js 13+ for server-rendered and client-side pages.
- Automated scripts for linting and testing.

## Contributing
- Fork this repo, then create a new branch for your feature.
- Submit a pull request once your changes are tested and stable.

## License
[MIT](LICENSE)
EOF

echo "Done! The files (package.json, vault.json, .gitignore, and README.md) have been created."
