#!/bin/bash

# -----------------------------------
# OVERTIMESTAFF PLATFORM: Setup Script
# -----------------------------------

# Define variables
LOCAL_REPO_PATH="/Users/macbookpro/Desktop/overtimestaff"
GIT_SSH_URL="git@github.com:segzdee/overtimestaff.git"
COMMIT_MESSAGE="Organize project structure and add placeholders"

# Navigate to the local repository
cd "$LOCAL_REPO_PATH" || {
  echo "Error: Unable to navigate to $LOCAL_REPO_PATH"
  exit 1
}

# ---------- Create Folder Structure ----------

# Client
mkdir -p app/client
mkdir -p app/client/dashboard
mkdir -p app/client/shifts
mkdir -p app/client/payments
mkdir -p app/client/disputes
mkdir -p app/client/ratings

# Staff
mkdir -p app/staff
mkdir -p app/staff/dashboard
mkdir -p app/staff/shifts
mkdir -p app/staff/payments
mkdir -p app/staff/disputes
mkdir -p app/staff/ratings

# Agency
mkdir -p app/agency
mkdir -p app/agency/dashboard
mkdir -p app/agency/shifts
mkdir -p app/agency/payments
mkdir -p app/agency/disputes
mkdir -p app/agency/ratings

# Shared Folders
mkdir -p components
mkdir -p lib/supabase
mkdir -p lib/redis
mkdir -p lib/payments
mkdir -p lib/shifts
mkdir -p lib/disputes
mkdir -p lib/notifications
mkdir -p lib/auth
mkdir -p lib/compliance
mkdir -p lib/analytics
mkdir -p hooks
mkdir -p middleware
mkdir -p public
mkdir -p styles
mkdir -p utils
mkdir -p tests

# ---------- Create Placeholder Files ----------

# 1. Client Landing Page
if [ ! -f app/client/page.tsx ]; then
  cat <<EOF > app/client/page.tsx
import React from 'react';

const ClientLandingPage = () => {
  return (
    <div>
      <h1>Welcome, Client!</h1>
      {/* Add your client landing page content here */}
    </div>
  );
};

export default ClientLandingPage;
EOF
fi

# 2. Staff Landing Page
if [ ! -f app/staff/page.tsx ]; then
  cat <<EOF > app/staff/page.tsx
import React from 'react';

const StaffLandingPage = () => {
  return (
    <div>
      <h1>Welcome, Staff!</h1>
      {/* Add your staff landing page content here */}
    </div>
  );
};

export default StaffLandingPage;
EOF
fi

# 3. Agency Landing Page
if [ ! -f app/agency/page.tsx ]; then
  cat <<EOF > app/agency/page.tsx
import React from 'react';

const AgencyLandingPage = () => {
  return (
    <div>
      <h1>Welcome, Agency!</h1>
      {/* Add your agency landing page content here */}
    </div>
  );
};

export default AgencyLandingPage;
EOF
fi

# 4. Placeholder page.tsx files for dashboard, shifts, payments, disputes, ratings
#    We'll do this for each of the three user types: Client, Staff, Agency

# Helper function to create a page.tsx if it doesn't exist
create_placeholder_page() {
  local FILE_PATH=$1
  local TITLE=$2

  if [ ! -f "$FILE_PATH" ]; then
    cat <<EOF > "$FILE_PATH"
import React from 'react';

const Page = () => {
  return (
    <div>
      <h1>$TITLE</h1>
      {/* Add your $TITLE content here */}
    </div>
  );
};

export default Page;
EOF
  fi
}

# -- Client sub-pages
create_placeholder_page "app/client/dashboard/page.tsx" "Client Dashboard"
create_placeholder_page "app/client/shifts/page.tsx" "Client Shifts"
create_placeholder_page "app/client/payments/page.tsx" "Client Payments"
create_placeholder_page "app/client/disputes/page.tsx" "Client Disputes"
create_placeholder_page "app/client/ratings/page.tsx" "Client Ratings"

# -- Staff sub-pages
create_placeholder_page "app/staff/dashboard/page.tsx" "Staff Dashboard"
create_placeholder_page "app/staff/shifts/page.tsx" "Staff Shifts"
create_placeholder_page "app/staff/payments/page.tsx" "Staff Payments"
create_placeholder_page "app/staff/disputes/page.tsx" "Staff Disputes"
create_placeholder_page "app/staff/ratings/page.tsx" "Staff Ratings"

# -- Agency sub-pages
create_placeholder_page "app/agency/dashboard/page.tsx" "Agency Dashboard"
create_placeholder_page "app/agency/shifts/page.tsx" "Agency Shifts"
create_placeholder_page "app/agency/payments/page.tsx" "Agency Payments"
create_placeholder_page "app/agency/disputes/page.tsx" "Agency Disputes"
create_placeholder_page "app/agency/ratings/page.tsx" "Agency Ratings"

# 5. Supabase Client
cat <<EOF > lib/supabase/client.ts
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || '';
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_KEY || '';

const supabase = createClient(supabaseUrl, supabaseKey);

export default supabase;
EOF

# 6. Sample Button component
if [ ! -f components/Button.tsx ]; then
  cat <<EOF > components/Button.tsx
import React from 'react';

interface ButtonProps {
  onClick: () => void;
  children: React.ReactNode;
}

const Button: React.FC<ButtonProps> = ({ onClick, children }) => {
  return (
    <button onClick={onClick} className="btn">
      {children}
    </button>
  );
};

export default Button;
EOF
fi

# 7. Sample useAuth hook
if [ ! -f hooks/useAuth.ts ]; then
  cat <<EOF > hooks/useAuth.ts
import { useEffect, useState } from 'react';
import supabase from '../lib/supabase/client';

const useAuth = () => {
  const [user, setUser] = useState<any>(null);

  useEffect(() => {
    const session = supabase.auth.session();
    setUser(session?.user ?? null);

    const { data: authListener } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null);
    });

    return () => {
      authListener?.unsubscribe();
    };
  }, []);

  return user;
};

export default useAuth;
EOF
fi

# ---------- Git Operations ----------

# Add changes
git add .

# Commit
git commit -m "$COMMIT_MESSAGE"

# Push to main branch
git push "$GIT_SSH_URL" main
