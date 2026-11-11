-- Drop existing tables if re-running
drop table if exists public.professional_rosters cascade;
drop table if exists public.professional_profiles cascade;
drop table if exists public.modules_data cascade;
drop table if exists public.tenants cascade;

-- Enable necessary extensions
create extension if not exists "uuid-ossp";

-- 1. Tenants Table (Primary User Profiles & Tiers)
create table public.tenants (
    id uuid references auth.users on delete cascade primary key,
    first_name text not null,
    middle_name text,
    last_name text not null,
    city text not null,
    state text not null,
    role text not null default 'customer',
    tier integer not null default 0,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. Questionnaire Modules Data Table (Modules 1.0 through 25.0)
create table public.modules_data (
    id uuid default uuid_generate_v4() primary key,
    tenant_id uuid references public.tenants(id) on delete cascade not null,
    module_number numeric(4,1) not null,
    payload jsonb not null default '{}'::jsonb,
    updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
    constraint unique_tenant_module unique (tenant_id, module_number)
);

-- 3. Professional Profiles Table
create table public.professional_profiles (
    id uuid references auth.users on delete cascade primary key,
    upid text unique not null,
    professional_type text not null,
    first_name text not null,
    last_name text not null,
    email text not null,
    phone text,
    website text,
    bio text,
    certifications text,
    hourly_rate numeric(10,2),
    retainer_rate numeric(10,2),
    billing_interval text check (billing_interval in ('monthly', 'annual')),
    external_payment_url text not null,
    subscription_active boolean not null default false,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 4. Professional Client Roster & Assignments Table
create table public.professional_rosters (
    id uuid default uuid_generate_v4() primary key,
    professional_id uuid references public.professional_profiles(id) on delete cascade not null,
    tenant_id uuid references public.tenants(id) on delete cascade not null,
    assigned_at timestamp with time zone default timezone('utc'::text, now()) not null,
    constraint unique_prof_client unique (professional_id, tenant_id)
);

-- 5. Enable Row Level Security (RLS)
alter table public.tenants enable row level security;
alter table public.modules_data enable row level security;
alter table public.professional_profiles enable row level security;
alter table public.professional_rosters enable row level security;

-- 6. RLS Policies
create policy "Users can CRUD own tenant data" on public.tenants for all using (auth.uid() = id);
create policy "Users can CRUD own module data" on public.modules_data for all using (auth.uid() = tenant_id);
create policy "Anyone can view active professionals" on public.professional_profiles for select using (subscription_active = true);
create policy "Professionals can update own profile" on public.professional_profiles for update using (auth.uid() = id);
create policy "Professionals can view assigned rosters" on public.professional_rosters for select using (auth.uid() = professional_id);
