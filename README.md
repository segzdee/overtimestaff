# Overtimestaff Platform

The Overtimestaff Platform is a comprehensive application for managing staffing in the hospitality industry.

## Project Setup

1. **Clone the Repository**
   ```bash
   git clone git@github.com:segzdee/overtimestaff.git
   cd overtimestaff
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Configure Environment**
   - Copy `vault.json` (from `vault.json.example` or a secure source) to your local environment.
   - Ensure `.gitignore` includes `vault.json` to protect sensitive info.

4. **Development**
   ```bash
   npm run dev
   ```
   This starts the Next.js development server on [http://localhost:3000](http://localhost:3000).

5. **Build for Production**
   ```bash
   npm run build
   ```

6. **Start (Production)**
   ```bash
   npm run start
   ```

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
