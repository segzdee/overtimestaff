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
