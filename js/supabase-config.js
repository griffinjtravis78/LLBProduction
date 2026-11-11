import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm'

const SUPABASE_URL = 'https://fcinvuixymytouzgvzzi.supabase.co'
const SUPABASE_ANON_KEY = 'sb_publishable_2Nlp24a78oacWnjh2Iq8dQ_Q9L-wC52'

export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  auth: {
    flowType: 'pkce',
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: true
  }
})
