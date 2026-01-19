--
-- PostgreSQL database dump
--

\restrict KT73vqqjTHyKNirYtTG8Xh4VpzEBJ0TFYFAQtnGngxWoR3MXSgu9YChQfjE0QnV

-- Dumped from database version 16.11 (Debian 16.11-1.pgdg13+1)
-- Dumped by pg_dump version 16.11 (Debian 16.11-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AR_Tenants; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."AR_Tenants" (
    id integer NOT NULL,
    business_name character varying(255) DEFAULT 'Joe''s Plumbing & Heating'::character varying,
    twilio_name character varying(255) DEFAULT '+17088474211'::character varying,
    business_config json DEFAULT '{"location":{"city":"Orland Park, IL","service_radius_miles":25},"hours":{"mon_fri":"8am-6pm","weekend":"Emergency Only"},"services":[{"name":"Drain Cleaning","price":"$199 flat rate"},{"name":"Water Heater","price":"Starts at $1200"},{"name":"Emergency Dispatch","price":"$129 dispatch fee"}],"emergency_rules":{"contact_name":"Joe","sms_alert_number":"+17085550000"}}'::json,
    snapshots integer
);


ALTER TABLE public."AR_Tenants" OWNER TO directus;

--
-- Name: AR_Tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."AR_Tenants_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."AR_Tenants_id_seq" OWNER TO directus;

--
-- Name: AR_Tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."AR_Tenants_id_seq" OWNED BY public."AR_Tenants".id;


--
-- Name: AR_Tenants_niche_snapshots; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."AR_Tenants_niche_snapshots" (
    id integer NOT NULL,
    "AR_Tenants_id" integer,
    niche_snapshots_id integer
);


ALTER TABLE public."AR_Tenants_niche_snapshots" OWNER TO directus;

--
-- Name: AR_Tenants_niche_snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."AR_Tenants_niche_snapshots_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."AR_Tenants_niche_snapshots_id_seq" OWNER TO directus;

--
-- Name: AR_Tenants_niche_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."AR_Tenants_niche_snapshots_id_seq" OWNED BY public."AR_Tenants_niche_snapshots".id;


--
-- Name: ai_calls; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.ai_calls (
    id integer NOT NULL,
    lead_id character varying(255),
    caller_phone character varying(255),
    caller_input text,
    ai_response text,
    sync_status character varying(255),
    client_response integer,
    created_at timestamp without time zone
);


ALTER TABLE public.ai_calls OWNER TO directus;

--
-- Name: ai_calls_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.ai_calls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ai_calls_id_seq OWNER TO directus;

--
-- Name: ai_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.ai_calls_id_seq OWNED BY public.ai_calls.id;


--
-- Name: audience_profiles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.audience_profiles (
    id integer NOT NULL,
    name character varying(255),
    age_range character varying(255),
    reading_level character varying(255),
    pain_points text,
    goals text,
    notes text,
    industries character varying(255),
    sources character varying(255),
    trend_score integer,
    meta json,
    last_seen_at timestamp without time zone
);


ALTER TABLE public.audience_profiles OWNER TO directus;

--
-- Name: audience_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.audience_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audience_profiles_id_seq OWNER TO directus;

--
-- Name: audience_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.audience_profiles_id_seq OWNED BY public.audience_profiles.id;


--
-- Name: banned_phrases; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.banned_phrases (
    id integer NOT NULL,
    phrase character varying(255),
    replacement_hint character varying(255),
    create_at timestamp without time zone
);


ALTER TABLE public.banned_phrases OWNER TO directus;

--
-- Name: banned_phrases_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.banned_phrases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banned_phrases_id_seq OWNER TO directus;

--
-- Name: banned_phrases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.banned_phrases_id_seq OWNED BY public.banned_phrases.id;


--
-- Name: business_intel_reports; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.business_intel_reports (
    id integer NOT NULL,
    primary_keyword text,
    location text,
    engine text,
    payload json,
    summary text,
    sentiment_score real
);


ALTER TABLE public.business_intel_reports OWNER TO directus;

--
-- Name: business_intel_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.business_intel_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.business_intel_reports_id_seq OWNER TO directus;

--
-- Name: business_intel_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.business_intel_reports_id_seq OWNED BY public.business_intel_reports.id;


--
-- Name: content_outputs; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.content_outputs (
    id integer NOT NULL,
    request_id integer,
    title character varying(255),
    slug character varying(255),
    meta_title character varying(255),
    meta_description text,
    summary text,
    outline_markdown text,
    body_markdown text,
    seo_score integer,
    body_html character varying(255),
    published_url character varying(255),
    schema_json json,
    faqs json,
    short_form_snippets json
);


ALTER TABLE public.content_outputs OWNER TO directus;

--
-- Name: content_outputs_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.content_outputs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.content_outputs_id_seq OWNER TO directus;

--
-- Name: content_outputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.content_outputs_id_seq OWNED BY public.content_outputs.id;


--
-- Name: content_requests; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.content_requests (
    id integer NOT NULL,
    status character varying(255),
    topic character varying(255),
    primary_keyword character varying(255),
    location character varying(255),
    content_type character varying(255),
    source character varying(255),
    auto_published boolean DEFAULT false,
    style json,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    forget_audience integer,
    style_persona_id integer,
    industry uuid,
    sub_industry integer
);


ALTER TABLE public.content_requests OWNER TO directus;

--
-- Name: content_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.content_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.content_requests_id_seq OWNER TO directus;

--
-- Name: content_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.content_requests_id_seq OWNED BY public.content_requests.id;


--
-- Name: content_silos; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.content_silos (
    id integer NOT NULL,
    silo_id uuid,
    name character varying(255),
    industry character varying(255),
    root_topic character varying(255),
    site_id uuid,
    created_at timestamp without time zone
);


ALTER TABLE public.content_silos OWNER TO directus;

--
-- Name: content_silos_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.content_silos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.content_silos_id_seq OWNER TO directus;

--
-- Name: content_silos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.content_silos_id_seq OWNED BY public.content_silos.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO directus;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO directus;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO directus;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO directus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO directus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text,
    searchable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_fields OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO directus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO directus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO directus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO directus;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO directus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO directus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL,
    role uuid
);


ALTER TABLE public.directus_permissions OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO directus;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid,
    ip_access text,
    admin_access boolean DEFAULT false,
    app_access boolean DEFAULT true
);


ALTER TABLE public.directus_roles OWNER TO directus;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO directus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json,
    visual_editor_urls json,
    project_id uuid,
    mcp_enabled boolean DEFAULT false NOT NULL,
    mcp_allow_deletes boolean DEFAULT false NOT NULL,
    mcp_prompts_collection character varying(255) DEFAULT NULL::character varying,
    mcp_system_prompt_enabled boolean DEFAULT true NOT NULL,
    mcp_system_prompt text,
    project_owner character varying(255),
    project_usage character varying(255),
    org_name character varying(255),
    product_updates boolean,
    project_status character varying(255),
    ai_openai_api_key text,
    ai_anthropic_api_key text,
    ai_system_prompt text
);


ALTER TABLE public.directus_settings OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO directus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO directus;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json,
    text_direction character varying(255) DEFAULT 'auto'::character varying NOT NULL
);


ALTER TABLE public.directus_users OWNER TO directus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO directus;

--
-- Name: experience_snippets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.experience_snippets (
    id integer NOT NULL,
    snippet_text text,
    tags json,
    created_at timestamp without time zone,
    snippet_category character varying(255),
    industry_id integer,
    sub_industry_id uuid,
    persona_id uuid,
    create_at timestamp without time zone
);


ALTER TABLE public.experience_snippets OWNER TO directus;

--
-- Name: experience_snippets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.experience_snippets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.experience_snippets_id_seq OWNER TO directus;

--
-- Name: experience_snippets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.experience_snippets_id_seq OWNED BY public.experience_snippets.id;


--
-- Name: fact_candidates; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.fact_candidates (
    id integer NOT NULL,
    request_id uuid,
    source_url character varying(255),
    fact_text text,
    type character varying(255),
    source_authority character varying(255),
    jurisdiction character varying(255),
    study_year integer,
    published_at timestamp without time zone,
    meta json
);


ALTER TABLE public.fact_candidates OWNER TO directus;

--
-- Name: fact_candidates_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.fact_candidates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fact_candidates_id_seq OWNER TO directus;

--
-- Name: fact_candidates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.fact_candidates_id_seq OWNED BY public.fact_candidates.id;


--
-- Name: image_assets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.image_assets (
    id integer NOT NULL,
    title character varying(255),
    source_type character varying(255),
    url character varying(255),
    alt_text character varying(255),
    caption character varying(255),
    filename character varying(255),
    license_info text,
    meta json,
    created_at timestamp without time zone,
    request_id integer,
    slot character varying(255),
    purpose character varying(255)
);


ALTER TABLE public.image_assets OWNER TO directus;

--
-- Name: image_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.image_assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.image_assets_id_seq OWNER TO directus;

--
-- Name: image_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.image_assets_id_seq OWNED BY public.image_assets.id;


--
-- Name: industries; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.industries (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255),
    slug character varying(255),
    active boolean DEFAULT true,
    description text
);


ALTER TABLE public.industries OWNER TO directus;

--
-- Name: intel_debug; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.intel_debug (
    id integer NOT NULL,
    "sourceUrl" text,
    "businessWebsiteRoot" text,
    "rawPayload" text,
    "createAt" timestamp without time zone,
    business text
);


ALTER TABLE public.intel_debug OWNER TO directus;

--
-- Name: intel_debug_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.intel_debug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intel_debug_id_seq OWNER TO directus;

--
-- Name: intel_debug_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.intel_debug_id_seq OWNED BY public.intel_debug.id;


--
-- Name: intel_provenance; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.intel_provenance (
    id integer NOT NULL,
    business text,
    field_name text,
    value text,
    source text,
    confidence integer,
    raw_input text,
    last_verified timestamp without time zone
);


ALTER TABLE public.intel_provenance OWNER TO directus;

--
-- Name: intel_provenance_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.intel_provenance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intel_provenance_id_seq OWNER TO directus;

--
-- Name: intel_provenance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.intel_provenance_id_seq OWNED BY public.intel_provenance.id;


--
-- Name: kb_chunks; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.kb_chunks (
    id integer NOT NULL,
    doc_id text,
    niche_slug text,
    chunk_test text,
    embedding text
);


ALTER TABLE public.kb_chunks OWNER TO directus;

--
-- Name: kb_chunks_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.kb_chunks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kb_chunks_id_seq OWNER TO directus;

--
-- Name: kb_chunks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.kb_chunks_id_seq OWNED BY public.kb_chunks.id;


--
-- Name: kb_documents; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.kb_documents (
    id integer NOT NULL,
    title text,
    niche_slug character varying(255),
    city_slug text,
    source_type text,
    source_url text,
    tags text,
    raw_text text,
    visibility text,
    checksum text
);


ALTER TABLE public.kb_documents OWNER TO directus;

--
-- Name: kb_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.kb_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kb_documents_id_seq OWNER TO directus;

--
-- Name: kb_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.kb_documents_id_seq OWNED BY public.kb_documents.id;


--
-- Name: keyword_opportunities; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.keyword_opportunities (
    id integer NOT NULL,
    keyword text,
    volume integer,
    difficulty integer,
    opportunity_score real,
    status character varying(255)
);


ALTER TABLE public.keyword_opportunities OWNER TO directus;

--
-- Name: keyword_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.keyword_opportunities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.keyword_opportunities_id_seq OWNER TO directus;

--
-- Name: keyword_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.keyword_opportunities_id_seq OWNED BY public.keyword_opportunities.id;


--
-- Name: knowledge_base; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.knowledge_base (
    id integer NOT NULL,
    file uuid,
    status character varying(255),
    sync_status character varying(255),
    document_type character varying(255),
    client_id integer,
    title character varying(255),
    type character varying(255),
    file_id uuid,
    extracted_data json,
    content text
);


ALTER TABLE public.knowledge_base OWNER TO directus;

--
-- Name: knowledge_base_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.knowledge_base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.knowledge_base_id_seq OWNER TO directus;

--
-- Name: knowledge_base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.knowledge_base_id_seq OWNED BY public.knowledge_base.id;


--
-- Name: learning_queue; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.learning_queue (
    id integer NOT NULL,
    created_at timestamp without time zone,
    niche_slug text,
    question text,
    proposed_answer text,
    evidence_chunks text,
    status text
);


ALTER TABLE public.learning_queue OWNER TO directus;

--
-- Name: learning_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.learning_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.learning_queue_id_seq OWNER TO directus;

--
-- Name: learning_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.learning_queue_id_seq OWNED BY public.learning_queue.id;


--
-- Name: niche_snapshots; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.niche_snapshots (
    id integer NOT NULL,
    niche_name character varying(255),
    urgency_level json,
    industry_vocabulary json,
    default_tools json,
    system_prompt_base text
);


ALTER TABLE public.niche_snapshots OWNER TO directus;

--
-- Name: niche_snapshots_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.niche_snapshots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.niche_snapshots_id_seq OWNER TO directus;

--
-- Name: niche_snapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.niche_snapshots_id_seq OWNED BY public.niche_snapshots.id;


--
-- Name: seo_audit; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.seo_audit (
    id integer NOT NULL,
    domain text,
    "auditDate" timestamp without time zone,
    "contentScore" real,
    "performanceScore" real,
    "localSeoScore" real,
    "technicalScore" real,
    "overallScore" real,
    "entityClarityScore" real,
    "aiFactScore" real,
    "informationCompletenessScore" real,
    "adwordsOpportunityScore" real,
    "localRankOpportunityScore" real,
    "voiceScore" real,
    "aiVisibilityScore" real,
    "aiContentCompletenessScore" real,
    "missingAIDataPoints" real,
    "entityConfusionRisk" real,
    "valueIntentValueScore" real,
    "localSearchOpportunityScore" real,
    "nearMeRankingScore" real,
    "dealOpportunityScore" real,
    "multiModalOpportunityScore" real,
    "hasMetaTitle" boolean,
    "hasMetaDescription" boolean,
    "hasOgTags" boolean,
    "hasTwitterCards" boolean,
    "hasSchemaLD" boolean,
    "hasRobotsTXT" boolean,
    "hasSiteMap" boolean,
    "hasSSL" boolean,
    "hasMobileFriendly" boolean,
    "hasAltTags" boolean,
    "hasH1H2Structure" boolean,
    "missingPages" boolean,
    "missingSocialProfile" boolean,
    "missingImageAltTags" boolean,
    "missingVideoContent" boolean,
    "missingAudioContent" boolean,
    "wordCount" integer,
    "imageCount" integer,
    "brokenLinks" integer,
    "internalLinks" real,
    "externalLinks" integer,
    "primaryKeyword" text,
    "missingKeywordOpportunities" text,
    "opportunitySummary" text,
    "cityKeywordGaps" text,
    "rawMetrics" text,
    "rawContentScan" text,
    "relatedServicePages" text,
    "relatedCityPages" text,
    "internalLinkOpportunities" text,
    "conversionOpportunitySummary" text,
    "buyerIntenKeywords" text,
    "nearMeKeywords" text,
    "openNowKeywords" text,
    "localDiscountKeywords" text,
    "serviceIntentKeywords" text,
    "neighborhoodKeywords" text,
    "cityIntentGaps" text,
    "geoCoverageGaps" text,
    "localCompetitionGap" character varying(255),
    "categoryKeywords" text,
    "dealIntentKeywords" text,
    "recommendedImagePrompts" text,
    "recommendedAudioTopics" text,
    "recommendedVideoTopics" text,
    business text,
    "metaScore" real
);


ALTER TABLE public.seo_audit OWNER TO directus;

--
-- Name: seo_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.seo_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seo_audit_id_seq OWNER TO directus;

--
-- Name: seo_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.seo_audit_id_seq OWNED BY public.seo_audit.id;


--
-- Name: seo_enrichment; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.seo_enrichment (
    id integer NOT NULL,
    business text,
    summary_short text,
    summary_long text,
    keywords text,
    "servicePageIntro" text,
    "servicePageDetails" text,
    "localLandingPageIntro" text,
    "categoryLandingPageIntro" text,
    "cityLandingKeywords" text,
    "spokenAnswerSnippet" text,
    "conversationalFAQ" text,
    "voiceKeywords" text,
    "localVoiceSnippet" text,
    "aiOverviewSnippet" text,
    "aiLocalRecommendationSnippet" text,
    "aiServiceExplanation" text,
    "aiComparisonSnippet" text,
    "schemaEntitySummary" text,
    "aiQuestionAnswerPairs" text,
    "structuredAnswerBlocks" text,
    "aiFriendlyFacts" text,
    "nearMeSnippet" text,
    "buyerIntentSnippet" text
);


ALTER TABLE public.seo_enrichment OWNER TO directus;

--
-- Name: seo_enrichment_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.seo_enrichment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seo_enrichment_id_seq OWNER TO directus;

--
-- Name: seo_enrichment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.seo_enrichment_id_seq OWNED BY public.seo_enrichment.id;


--
-- Name: silo_nodes; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.silo_nodes (
    id integer NOT NULL,
    silo_id uuid,
    node_type character varying(255),
    title character varying(255),
    target_keyword character varying(255),
    parent_node_id uuid,
    content_request_id uuid,
    status character varying(255),
    topic_id uuid
);


ALTER TABLE public.silo_nodes OWNER TO directus;

--
-- Name: silo_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.silo_nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.silo_nodes_id_seq OWNER TO directus;

--
-- Name: silo_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.silo_nodes_id_seq OWNED BY public.silo_nodes.id;


--
-- Name: sub_industries; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.sub_industries (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    description text,
    active boolean DEFAULT true,
    industry uuid
);


ALTER TABLE public.sub_industries OWNER TO directus;

--
-- Name: sub_industries_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.sub_industries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sub_industries_id_seq OWNER TO directus;

--
-- Name: sub_industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.sub_industries_id_seq OWNED BY public.sub_industries.id;


--
-- Name: target_cities; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.target_cities (
    id integer NOT NULL,
    city_name text,
    state text,
    status character varying(255)
);


ALTER TABLE public.target_cities OWNER TO directus;

--
-- Name: target_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.target_cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.target_cities_id_seq OWNER TO directus;

--
-- Name: target_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.target_cities_id_seq OWNED BY public.target_cities.id;


--
-- Name: target_services; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.target_services (
    id integer NOT NULL,
    name text,
    category text
);


ALTER TABLE public.target_services OWNER TO directus;

--
-- Name: target_services_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.target_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.target_services_id_seq OWNER TO directus;

--
-- Name: target_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.target_services_id_seq OWNED BY public.target_services.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    sub_industry_id uuid,
    topic_name character varying(255),
    keyword_root character varying(255),
    description text,
    active boolean DEFAULT true
);


ALTER TABLE public.topics OWNER TO directus;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topics_id_seq OWNER TO directus;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: trend_topics; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.trend_topics (
    id integer NOT NULL,
    topic character varying(255),
    topic_id uuid,
    industry_id uuid,
    sub_industry_id uuid,
    trend_score integer,
    meta json,
    last_seen_at timestamp without time zone,
    create_at timestamp without time zone,
    updated_at character varying(255),
    source character varying(255),
    status character varying(255)
);


ALTER TABLE public.trend_topics OWNER TO directus;

--
-- Name: trend_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.trend_topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trend_topics_id_seq OWNER TO directus;

--
-- Name: trend_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.trend_topics_id_seq OWNED BY public.trend_topics.id;


--
-- Name: viral_patterns; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.viral_patterns (
    id integer NOT NULL,
    name character varying(255),
    description text,
    prompt_template text,
    content_type character varying(255),
    industry_scope character varying(255)
);


ALTER TABLE public.viral_patterns OWNER TO directus;

--
-- Name: viral_patterns_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.viral_patterns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.viral_patterns_id_seq OWNER TO directus;

--
-- Name: viral_patterns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.viral_patterns_id_seq OWNED BY public.viral_patterns.id;


--
-- Name: writing_personas; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.writing_personas (
    id integer NOT NULL,
    name character varying(255),
    description text,
    style_notes text,
    default_industries json,
    active boolean DEFAULT true
);


ALTER TABLE public.writing_personas OWNER TO directus;

--
-- Name: writing_personas_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.writing_personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.writing_personas_id_seq OWNER TO directus;

--
-- Name: writing_personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.writing_personas_id_seq OWNED BY public.writing_personas.id;


--
-- Name: AR_Tenants id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."AR_Tenants" ALTER COLUMN id SET DEFAULT nextval('public."AR_Tenants_id_seq"'::regclass);


--
-- Name: AR_Tenants_niche_snapshots id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."AR_Tenants_niche_snapshots" ALTER COLUMN id SET DEFAULT nextval('public."AR_Tenants_niche_snapshots_id_seq"'::regclass);


--
-- Name: ai_calls id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.ai_calls ALTER COLUMN id SET DEFAULT nextval('public.ai_calls_id_seq'::regclass);


--
-- Name: audience_profiles id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.audience_profiles ALTER COLUMN id SET DEFAULT nextval('public.audience_profiles_id_seq'::regclass);


--
-- Name: banned_phrases id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.banned_phrases ALTER COLUMN id SET DEFAULT nextval('public.banned_phrases_id_seq'::regclass);


--
-- Name: business_intel_reports id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.business_intel_reports ALTER COLUMN id SET DEFAULT nextval('public.business_intel_reports_id_seq'::regclass);


--
-- Name: content_outputs id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_outputs ALTER COLUMN id SET DEFAULT nextval('public.content_outputs_id_seq'::regclass);


--
-- Name: content_requests id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_requests ALTER COLUMN id SET DEFAULT nextval('public.content_requests_id_seq'::regclass);


--
-- Name: content_silos id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_silos ALTER COLUMN id SET DEFAULT nextval('public.content_silos_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: experience_snippets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.experience_snippets ALTER COLUMN id SET DEFAULT nextval('public.experience_snippets_id_seq'::regclass);


--
-- Name: fact_candidates id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.fact_candidates ALTER COLUMN id SET DEFAULT nextval('public.fact_candidates_id_seq'::regclass);


--
-- Name: image_assets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.image_assets ALTER COLUMN id SET DEFAULT nextval('public.image_assets_id_seq'::regclass);


--
-- Name: intel_debug id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.intel_debug ALTER COLUMN id SET DEFAULT nextval('public.intel_debug_id_seq'::regclass);


--
-- Name: intel_provenance id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.intel_provenance ALTER COLUMN id SET DEFAULT nextval('public.intel_provenance_id_seq'::regclass);


--
-- Name: kb_chunks id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.kb_chunks ALTER COLUMN id SET DEFAULT nextval('public.kb_chunks_id_seq'::regclass);


--
-- Name: kb_documents id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.kb_documents ALTER COLUMN id SET DEFAULT nextval('public.kb_documents_id_seq'::regclass);


--
-- Name: keyword_opportunities id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.keyword_opportunities ALTER COLUMN id SET DEFAULT nextval('public.keyword_opportunities_id_seq'::regclass);


--
-- Name: knowledge_base id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.knowledge_base ALTER COLUMN id SET DEFAULT nextval('public.knowledge_base_id_seq'::regclass);


--
-- Name: learning_queue id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.learning_queue ALTER COLUMN id SET DEFAULT nextval('public.learning_queue_id_seq'::regclass);


--
-- Name: niche_snapshots id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.niche_snapshots ALTER COLUMN id SET DEFAULT nextval('public.niche_snapshots_id_seq'::regclass);


--
-- Name: seo_audit id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seo_audit ALTER COLUMN id SET DEFAULT nextval('public.seo_audit_id_seq'::regclass);


--
-- Name: seo_enrichment id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seo_enrichment ALTER COLUMN id SET DEFAULT nextval('public.seo_enrichment_id_seq'::regclass);


--
-- Name: silo_nodes id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.silo_nodes ALTER COLUMN id SET DEFAULT nextval('public.silo_nodes_id_seq'::regclass);


--
-- Name: sub_industries id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.sub_industries ALTER COLUMN id SET DEFAULT nextval('public.sub_industries_id_seq'::regclass);


--
-- Name: target_cities id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.target_cities ALTER COLUMN id SET DEFAULT nextval('public.target_cities_id_seq'::regclass);


--
-- Name: target_services id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.target_services ALTER COLUMN id SET DEFAULT nextval('public.target_services_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: trend_topics id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.trend_topics ALTER COLUMN id SET DEFAULT nextval('public.trend_topics_id_seq'::regclass);


--
-- Name: viral_patterns id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.viral_patterns ALTER COLUMN id SET DEFAULT nextval('public.viral_patterns_id_seq'::regclass);


--
-- Name: writing_personas id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.writing_personas ALTER COLUMN id SET DEFAULT nextval('public.writing_personas_id_seq'::regclass);


--
-- Data for Name: AR_Tenants; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."AR_Tenants" (id, business_name, twilio_name, business_config, snapshots) FROM stdin;
3	Joe's Plumbing & Heating	+17088474211	{"location":{"city":"Orland Park, IL","service_radius_miles":25},"hours":{"mon_fri":"8am-6pm","weekend":"Emergency Only"},"services":[{"name":"Drain Cleaning","price":"$199 flat rate"},{"name":"Water Heater","price":"Starts at $1200"},{"name":"Emergency Dispatch","price":"$129 dispatch fee"}],"emergency_rules":{"contact_name":"Joe","sms_alert_number":"+17085550000"}}	2
4	Leads Grow Revenue	+17088474211	{"location":{"city":"Orland Park, IL","service_radius_miles":25},"hours":{"mon_fri":"8am-6pm","weekend":"Emergency Only"},"services":[{"name":"Drain Cleaning","price":"$199 flat rate"},{"name":"Water Heater","price":"Starts at $1200"},{"name":"Emergency Dispatch","price":"$129 dispatch fee"}],"emergency_rules":{"contact_name":"Joe","sms_alert_number":"+17085550000"}}	6
\.


--
-- Data for Name: AR_Tenants_niche_snapshots; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."AR_Tenants_niche_snapshots" (id, "AR_Tenants_id", niche_snapshots_id) FROM stdin;
\.


--
-- Data for Name: ai_calls; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.ai_calls (id, lead_id, caller_phone, caller_input, ai_response, sync_status, client_response, created_at) FROM stdin;
\.


--
-- Data for Name: audience_profiles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.audience_profiles (id, name, age_range, reading_level, pain_points, goals, notes, industries, sources, trend_score, meta, last_seen_at) FROM stdin;
\.


--
-- Data for Name: banned_phrases; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.banned_phrases (id, phrase, replacement_hint, create_at) FROM stdin;
\.


--
-- Data for Name: business_intel_reports; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.business_intel_reports (id, primary_keyword, location, engine, payload, summary, sentiment_score) FROM stdin;
1	AI Automation	{"city":"Chicago","state":"Illinois"}	business-intel-v1	{"primary_keyword":"AI Automation","sentiment_score":4.5,"summary":"AI Automation Agency in Chicago is a leading provider of innovative solutions for businesses looking to streamline their operations and improve efficiency. With a team of experts in artificial intelligence, machine learning, and automation, they offer customized services that cater to the unique needs of each client.","location":{"city":"Chicago","state":"Illinois"}}	AI Automation Agency in Chicago is a leading provider of innovative solutions for businesses looking to streamline their operations and improve efficiency. With a team of experts in artificial intelligence, machine learning, and automation, they offer customized services that cater to the unique needs of each client.	4.5
\.


--
-- Data for Name: content_outputs; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.content_outputs (id, request_id, title, slug, meta_title, meta_description, summary, outline_markdown, body_markdown, seo_score, body_html, published_url, schema_json, faqs, short_form_snippets) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	In today’s competitive landscape, businesses need to leverage every advantage they can find. One of the most effective ways to enhance your online presence is through search engine optimization (SEO). It’s not just about using the right keywords; it’s about understanding the intent behind those keywords and how they relate to your audience.\n\nFirst off, let’s break down what SEO really means. At its core, SEO is about optimizing your website so that it ranks higher on search engine results pages (SERPs). This means using relevant keywords, but also focusing on creating high-quality content that answers users’ questions and provides real value.\n\nA crucial aspect of SEO is on-page optimization. This involves tweaking elements on your website—like title tags, meta descriptions, and headers—to make sure they’re aligned with the keywords you’re targeting. Don’t forget about images and alt text, as these can also play a role in how your site is indexed.\n\nOff-page SEO is just as important. Building backlinks from reputable sites can significantly boost your authority in the eyes of search engines. The more high-quality links you have pointing back to your site, the better your chances of ranking well.\n\nContent is king, but context is queen. It’s vital to create content that not only incorporates keywords but also engages your audience. Think about what your potential customers are searching for and how you can provide them with answers. Blogs, infographics, videos, and podcasts are all effective formats that can help convey your message and improve your SEO.\n\nLastly, don’t underestimate the importance of analytics. Use tools like Google Analytics to track your progress and see what’s working—and what isn’t. This data can help you refine your strategy over time, ensuring you stay ahead of the competition.\n\nIn summary, SEO is a multi-faceted approach that requires attention to detail and a commitment to quality. By focusing on both on-page and off-page strategies, and continuously analyzing your efforts, you can enhance your online visibility and drive more traffic to your site.	\N	\N	\N	\N	\N	\N
16	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	When it comes to boosting your website’s visibility, understanding SEO is key. Search engine optimization isn’t just a buzzword; it’s a crucial strategy for driving organic traffic. Let’s break down some essential components that can elevate your online presence.\n\n**Keyword Research**  \nStart with thorough keyword research. Identify the terms your target audience is searching for. Tools like Google Keyword Planner or SEMrush can help you find relevant keywords with good search volume. Focus on long-tail keywords, as they often have less competition and can lead to higher conversion rates.\n\n**On-Page SEO**  \nOnce you’ve pinpointed your keywords, it’s time to implement them effectively on your site. This includes optimizing title tags, meta descriptions, and header tags. Make sure your content is structured well; use bullet points and short paragraphs to enhance readability. Remember, the goal is to provide value to your readers while naturally incorporating your keywords.\n\n**Quality Content**  \nContent is king. Producing high-quality, engaging content should be your top priority. Aim to answer questions and solve problems for your audience. Regularly update your blog or website with fresh material to keep visitors coming back.  \n\n**Link Building**  \nBuilding backlinks is another vital aspect of SEO. Focus on acquiring links from reputable sites in your niche. Guest blogging, creating shareable infographics, and engaging in online communities can help you establish authority and improve your site’s ranking.\n\n**Technical SEO**  \nDon’t overlook the technical side of SEO. Ensure your website loads quickly, is mobile-friendly, and has a clear site structure. Use tools like Google Search Console to monitor your site’s performance and identify any issues that need fixing.\n\n**Analytics and Adjustments**  \nFinally, keep an eye on your analytics. Use Google Analytics to track your traffic and user behavior. This data will provide insights into what’s working and what needs improvement. Adjust your strategies accordingly to stay ahead of the competition.\n\nIn summary, mastering SEO involves a mix of research, quality content, and ongoing adjustments. Stay informed about industry trends, and don’t hesitate to adapt your strategies as needed. With consistent effort, you’ll see your website climb the search rankings.	\N	\N	\N	\N	\N	\N
17	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	SEO is a crucial part of online marketing. It helps businesses improve their visibility on search engines, driving more traffic to their websites. To get started with SEO, you need to understand a few key concepts.  \n\nFirst, focus on keyword research. This involves finding the terms your potential customers are using when they search for products or services like yours. Tools like Google Keyword Planner can help you identify these keywords. Once you have a list, integrate these keywords into your website content naturally.  \n\nNext up is on-page optimization. This means optimizing individual pages on your site to rank higher. Pay attention to title tags, meta descriptions, and header tags. These elements should include your target keywords and provide clear, concise information about the content.  \n\nDon’t overlook the importance of quality content. Search engines favor websites that offer valuable, relevant, and engaging content. Regularly updating your blog or website with fresh material can help retain visitors and attract new ones.  \n\nLink building is another essential aspect. This involves acquiring backlinks from other reputable websites. Backlinks signal to search engines that your site is trustworthy and authoritative. You can gain backlinks through guest blogging, partnerships, or by creating shareable content.  \n\nLastly, track your progress. Use tools like Google Analytics to monitor your website's performance. Keep an eye on metrics such as organic traffic, bounce rate, and conversion rate. This data will help you refine your SEO strategy over time.  \n\nIn summary, mastering SEO takes time and effort. By focusing on keyword research, on-page optimization, quality content, link building, and analytics, you can significantly improve your online presence.	\N	\N	\N	\N	\N	\N
18	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	When it comes to enhancing your website's visibility, understanding search engine optimization (SEO) is vital. SEO isn’t just about using the right keywords; it’s about creating a seamless experience for your visitors. Here’s a breakdown of key strategies to implement for better results.\n\n**Focus on Quality Content**  \nGreat content is the backbone of any successful SEO strategy. It’s not enough to simply stuff your articles with keywords. Instead, aim for informative, engaging, and original content that truly addresses the needs of your audience. Regularly updating your blog with relevant topics can also keep your site fresh in the eyes of search engines.\n\n**Keyword Research**  \nEffective keyword research is crucial. Use tools like Google Keyword Planner or SEMrush to identify keywords that your target audience is searching for. Look for a mix of long-tail and short-tail keywords to optimize your content effectively.\n\n**On-Page SEO**  \nOptimize your website's structure and content. Use header tags to break up text and include keywords naturally. Meta descriptions and alt tags for images should also be crafted thoughtfully, as they play a role in how search engines interpret your content.\n\n**Mobile Optimization**  \nWith the increasing use of mobile devices, ensuring your site is mobile-friendly is essential. A responsive design improves user experience and can positively impact your search rankings. \n\n**Link Building**  \nBuilding high-quality backlinks can significantly boost your website's authority. Reach out to relevant sites for guest blogging opportunities and consider engaging with your audience on social media to drive traffic back to your site.\n\n**Monitor and Adjust**  \nSEO isn’t a one-and-done deal. It requires constant monitoring and adjustments. Use tools like Google Analytics to track your performance and make data-driven decisions.\n\nBy implementing these strategies, you can improve your website’s SEO, attract more visitors, and ultimately achieve your business goals.	\N	\N	\N	\N	\N	\N
19	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	When it comes to home improvement, many homeowners wonder whether they should tackle projects themselves or hire a professional. Each option has its pros and cons, and the right choice often depends on the specific project and your own skills.\n\nDIY projects can be incredibly rewarding. They allow you to save money and customize your home exactly how you want it. Plus, there’s a certain satisfaction that comes from completing a project with your own hands. However, not every task is suitable for DIY. Some projects require specialized knowledge or tools that can be expensive to rent or buy. If you're not careful, you could end up causing more damage, which might cost you even more in the long run.\n\nOn the flip side, hiring a professional can take the stress off your shoulders. Pros have the experience and tools needed to get the job done efficiently and correctly. They can also spot potential issues that you might overlook. That said, hiring someone can be a significant financial investment, and it’s crucial to choose someone reliable to avoid any headaches.\n\nIn the end, it’s about weighing your options. Think about your skill level, the complexity of the project, and your budget. If you're unsure, consulting with a professional before making a decision can help clarify the best path forward. Whether you choose DIY or professional help, the goal is a successful home improvement that enhances your living space.	\N	\N	\N	\N	\N	\N
20	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	When it comes to boosting your website's visibility, understanding SEO is essential. You don’t need to be a tech wizard to get started, but knowing the basics can make a significant difference.\n\nFirst off, keyword research is crucial. You want to identify the terms and phrases your audience is searching for. Tools like Google Keyword Planner can help you find popular keywords relevant to your niche. Focus on long-tail keywords; they may have lower search volumes but often lead to higher conversion rates.\n\nNext, on-page SEO is where you can really shine. This involves optimizing individual pages on your site. Make sure your title tags and meta descriptions are compelling and include your target keywords. Also, use headings (H1, H2, H3) effectively to structure your content and improve readability. \n\nDon’t overlook the importance of quality content. Google rewards sites that provide valuable, informative, and engaging content. Regularly update your blog or articles to keep your audience coming back for more. \n\nLink building is another vital aspect of SEO. Aim to get backlinks from reputable sites in your industry. This can enhance your site's authority and improve your search rankings. \n\nLastly, monitor your progress. Use analytics tools to track your traffic and see which strategies are working. Adjust your approach based on the data you gather. SEO isn’t a one-time task; it requires ongoing effort and fine-tuning.\n\nBy focusing on these key areas, you can enhance your website’s SEO and reach a broader audience. Remember, the goal is not just to attract visitors but to convert them into loyal customers.	\N	\N	\N	\N	\N	\N
21	1	 Emergency HVAC Repair Chicago	emergency-hvac-repair-chicago	\N	\N	\N	\N	When you're looking to improve your website's search engine optimization (SEO), understanding how search engines work is crucial. Search engines like Google use complex algorithms to determine which websites to rank higher based on various factors. It's not just about keywords anymore; it's about the overall user experience.\n\nOne key aspect to consider is the importance of quality content. Search engines prioritize content that provides value to users. This means your articles should be informative, engaging, and relevant to your target audience. Use clear language and avoid jargon where possible. \n\nAnother element is website speed. A fast-loading site enhances user experience, reducing bounce rates. If your site takes too long to load, users will likely leave before even seeing your content. Tools like Google PageSpeed Insights can help you analyze and improve your site's speed.\n\nMobile-friendliness also plays a significant role in SEO. With more users accessing the web via mobile devices, it's essential to ensure your site is responsive. A mobile-friendly design improves usability and can boost your search rankings.\n\nDon't forget about backlinks. Quality backlinks from reputable sites can significantly enhance your site's authority. Focus on building relationships within your industry to foster natural linking opportunities.\n\nLastly, keep an eye on analytics. Regularly reviewing your site's performance helps you understand what's working and what isn't. Use this data to refine your strategy continually.\n\nIn summary, effective SEO requires a multifaceted approach. By focusing on quality content, site speed, mobile optimization, backlinks, and analytics, you can enhance your site's visibility and attract more visitors.	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: content_requests; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.content_requests (id, status, topic, primary_keyword, location, content_type, source, auto_published, style, created_at, updated_at, forget_audience, style_persona_id, industry, sub_industry) FROM stdin;
3	researching	cold weather in chicago	cold weather in chicago	Chicago, Illinois	how_to	\N	f	\N	\N	\N	\N	\N	6774f0be-0669-4ffb-9df5-0bd378359769	2
1	Ready	 Emergency HVAC Repair Chicago	emergency hvac repair chicago	Chicago, Illinois	\N	\N	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: content_silos; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.content_silos (id, silo_id, name, industry, root_topic, site_id, created_at) FROM stdin;
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
49f5687d-0a33-4e2b-b2e8-a43808117568	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
d41cae59-b171-4a82-b36f-65504e894fbd	4b9c2a26-828b-4a29-92db-a4e714d6f484	\N	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
be2b842a-9bb7-4ced-9b59-394612771d26	\N	24f7d0fe-8079-4470-a550-625130a01a4c	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 20:35:03.122+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
2	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 20:35:13.216+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_settings	1	http://178.156.170.185:8055
3	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 20:37:54.899+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
4	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 20:38:16.098+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
5	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 20:39:05.31+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_settings	1	http://178.156.170.185:8055
6	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 21:32:17.832+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	1	http://178.156.170.185:8055
7	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 21:32:17.839+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_audit	http://178.156.170.185:8055
8	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:22:28.876+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	2	http://178.156.170.185:8055
9	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:23:34.986+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	3	http://178.156.170.185:8055
10	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:24:01.221+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	4	http://178.156.170.185:8055
11	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:24:39.295+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	5	http://178.156.170.185:8055
12	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:25:09.507+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	6	http://178.156.170.185:8055
13	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:25:27.936+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	7	http://178.156.170.185:8055
14	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:25:49.361+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	8	http://178.156.170.185:8055
15	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:26:14.836+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	9	http://178.156.170.185:8055
16	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:26:35.805+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	10	http://178.156.170.185:8055
17	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:27:00.614+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	11	http://178.156.170.185:8055
18	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:27:26.746+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	12	http://178.156.170.185:8055
19	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:27:46.174+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	13	http://178.156.170.185:8055
20	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:28:14.124+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	14	http://178.156.170.185:8055
21	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:28:46.712+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	15	http://178.156.170.185:8055
22	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:29:17.833+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	16	http://178.156.170.185:8055
23	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:29:41.995+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	17	http://178.156.170.185:8055
24	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:30:16.929+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	18	http://178.156.170.185:8055
25	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:30:41.384+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	19	http://178.156.170.185:8055
26	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:31:18.155+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	20	http://178.156.170.185:8055
27	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:31:44.877+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	21	http://178.156.170.185:8055
28	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:32:11.18+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	22	http://178.156.170.185:8055
29	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:32:55.737+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	23	http://178.156.170.185:8055
30	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:33:26.241+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	24	http://178.156.170.185:8055
31	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:33:45.947+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	25	http://178.156.170.185:8055
1101	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:43:24.503+00	172.27.0.2	axios/1.12.0	content_requests	1	\N
32	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:34:36.286+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	26	http://178.156.170.185:8055
33	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:35:24.532+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	27	http://178.156.170.185:8055
34	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:36:02.829+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	28	http://178.156.170.185:8055
35	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:36:26.481+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	29	http://178.156.170.185:8055
36	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:36:48.715+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	30	http://178.156.170.185:8055
37	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:37:26.59+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	31	http://178.156.170.185:8055
38	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:37:56.393+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	32	http://178.156.170.185:8055
39	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:38:26.395+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	33	http://178.156.170.185:8055
40	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:38:47.486+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	34	http://178.156.170.185:8055
41	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:39:11.35+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	35	http://178.156.170.185:8055
42	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:40:10.743+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	36	http://178.156.170.185:8055
43	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:40:43.741+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	37	http://178.156.170.185:8055
44	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:41:08.089+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	38	http://178.156.170.185:8055
45	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:41:38.81+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	39	http://178.156.170.185:8055
46	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:42:05.844+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	40	http://178.156.170.185:8055
47	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:42:41.169+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	41	http://178.156.170.185:8055
48	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:43:04.457+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	42	http://178.156.170.185:8055
49	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:43:53.267+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	43	http://178.156.170.185:8055
50	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:44:15.175+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	44	http://178.156.170.185:8055
51	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:44:35.266+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	45	http://178.156.170.185:8055
52	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:45:19.149+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	46	http://178.156.170.185:8055
53	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:45:42.524+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	47	http://178.156.170.185:8055
54	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:46:14.575+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	48	http://178.156.170.185:8055
55	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:46:38.641+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	49	http://178.156.170.185:8055
56	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:47:01.068+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	50	http://178.156.170.185:8055
57	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:48:19.916+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	51	http://178.156.170.185:8055
58	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:48:47.463+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	52	http://178.156.170.185:8055
59	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:49:11.523+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	53	http://178.156.170.185:8055
60	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:49:51.159+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	54	http://178.156.170.185:8055
61	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:50:24.554+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	55	http://178.156.170.185:8055
62	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:50:50.646+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	56	http://178.156.170.185:8055
63	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:51:28.441+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	57	http://178.156.170.185:8055
64	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:52:04.901+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	58	http://178.156.170.185:8055
65	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:52:28.22+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	59	http://178.156.170.185:8055
66	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:53:02.829+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	60	http://178.156.170.185:8055
67	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:53:42.486+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	61	http://178.156.170.185:8055
68	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:54:12.515+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	62	http://178.156.170.185:8055
69	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:54:48.844+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	63	http://178.156.170.185:8055
70	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:55:18.622+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	64	http://178.156.170.185:8055
71	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:55:48.128+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	65	http://178.156.170.185:8055
72	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:56:15.061+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	66	http://178.156.170.185:8055
73	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:56:52.851+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	67	http://178.156.170.185:8055
74	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:57:13.145+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	68	http://178.156.170.185:8055
75	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:58:10.98+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	69	http://178.156.170.185:8055
76	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:59:06.574+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	70	http://178.156.170.185:8055
77	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 22:59:38.501+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	71	http://178.156.170.185:8055
78	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:00:34.662+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	70	http://178.156.170.185:8055
79	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:00:54.331+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	72	http://178.156.170.185:8055
80	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:04:29.038+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	73	http://178.156.170.185:8055
81	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:04:29.043+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_metadata	http://178.156.170.185:8055
82	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:17:05.38+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	74	http://178.156.170.185:8055
83	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:17:05.383+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_enrichment	http://178.156.170.185:8055
84	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:17:27.904+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	75	http://178.156.170.185:8055
85	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:17:49.622+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	76	http://178.156.170.185:8055
86	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:18:05.08+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	77	http://178.156.170.185:8055
87	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:18:20.423+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	78	http://178.156.170.185:8055
88	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:18:50.543+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	79	http://178.156.170.185:8055
89	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:19:07.958+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	80	http://178.156.170.185:8055
90	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:19:25.873+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	81	http://178.156.170.185:8055
91	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:19:55.162+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	82	http://178.156.170.185:8055
92	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:20:16.661+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	83	http://178.156.170.185:8055
93	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:20:42.264+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	84	http://178.156.170.185:8055
94	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:21:22.406+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	85	http://178.156.170.185:8055
95	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:21:44.218+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	86	http://178.156.170.185:8055
96	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:22:06.44+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	87	http://178.156.170.185:8055
97	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:22:29.89+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	88	http://178.156.170.185:8055
98	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:23:21.916+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	89	http://178.156.170.185:8055
99	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:23:45.555+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	90	http://178.156.170.185:8055
100	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:24:02.974+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	91	http://178.156.170.185:8055
101	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:24:26.726+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	92	http://178.156.170.185:8055
102	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:24:57.655+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	93	http://178.156.170.185:8055
103	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:25:19.774+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	94	http://178.156.170.185:8055
104	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:25:37.891+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	95	http://178.156.170.185:8055
105	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:25:58.688+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	96	http://178.156.170.185:8055
106	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:26:17.528+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	97	http://178.156.170.185:8055
107	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:27:00.138+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_metadata	http://178.156.170.185:8055
108	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:27:00.141+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	73	http://178.156.170.185:8055
109	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:34:35.64+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	98	http://178.156.170.185:8055
110	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:34:35.646+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	intel_debug	http://178.156.170.185:8055
111	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:35:12.371+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	99	http://178.156.170.185:8055
112	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:35:41.367+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	100	http://178.156.170.185:8055
113	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:36:03.569+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	101	http://178.156.170.185:8055
114	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:36:22.071+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	102	http://178.156.170.185:8055
115	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:36:43.611+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	103	http://178.156.170.185:8055
116	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:37:09.205+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	104	http://178.156.170.185:8055
117	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:37:09.208+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	intel_provenance	http://178.156.170.185:8055
118	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:37:27.148+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	105	http://178.156.170.185:8055
119	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:37:54.674+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	106	http://178.156.170.185:8055
120	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:38:13.486+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	107	http://178.156.170.185:8055
121	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:38:28.913+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	108	http://178.156.170.185:8055
122	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:38:46.799+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	109	http://178.156.170.185:8055
123	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:39:07.709+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	110	http://178.156.170.185:8055
124	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:39:35.239+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	111	http://178.156.170.185:8055
125	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:40:03.271+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	112	http://178.156.170.185:8055
126	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:40:03.274+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	kb_chunks	http://178.156.170.185:8055
127	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:40:32.58+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	113	http://178.156.170.185:8055
128	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:41:00.859+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	114	http://178.156.170.185:8055
129	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:41:16.71+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	115	http://178.156.170.185:8055
130	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:41:35.991+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	116	http://178.156.170.185:8055
131	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:42:10.149+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	117	http://178.156.170.185:8055
132	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:42:10.152+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	kb_documents	http://178.156.170.185:8055
133	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:42:31.593+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	118	http://178.156.170.185:8055
134	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:42:57.784+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	119	http://178.156.170.185:8055
135	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:43:20.204+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	120	http://178.156.170.185:8055
136	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:43:41.822+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	121	http://178.156.170.185:8055
137	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:44:06.595+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	122	http://178.156.170.185:8055
142	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:46:09.48+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	127	http://178.156.170.185:8055
143	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:46:09.486+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	learning_queue	http://178.156.170.185:8055
144	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:46:44.866+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	128	http://178.156.170.185:8055
145	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:47:05.796+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	129	http://178.156.170.185:8055
146	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:47:32.625+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	130	http://178.156.170.185:8055
147	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:48:04.161+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	131	http://178.156.170.185:8055
148	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:48:22.485+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	132	http://178.156.170.185:8055
149	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:48:42.582+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	133	http://178.156.170.185:8055
138	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:44:33.732+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	123	http://178.156.170.185:8055
139	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:44:51.036+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	124	http://178.156.170.185:8055
140	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:45:12.237+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	125	http://178.156.170.185:8055
141	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:45:32.031+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	126	http://178.156.170.185:8055
150	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:10.267+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	3	http://178.156.170.185:8055
151	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:17.54+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	2	http://178.156.170.185:8055
152	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:42.327+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	134	http://178.156.170.185:8055
153	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.678+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	1	http://178.156.170.185:8055
154	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.685+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	4	http://178.156.170.185:8055
155	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.693+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	5	http://178.156.170.185:8055
156	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.701+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	6	http://178.156.170.185:8055
157	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.707+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	7	http://178.156.170.185:8055
158	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.714+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	8	http://178.156.170.185:8055
159	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.72+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	9	http://178.156.170.185:8055
160	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.726+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	10	http://178.156.170.185:8055
161	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.731+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	11	http://178.156.170.185:8055
162	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.737+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	12	http://178.156.170.185:8055
163	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.743+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	13	http://178.156.170.185:8055
164	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.748+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	14	http://178.156.170.185:8055
165	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.757+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	15	http://178.156.170.185:8055
166	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.766+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	16	http://178.156.170.185:8055
167	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.773+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	17	http://178.156.170.185:8055
168	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.779+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	18	http://178.156.170.185:8055
169	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.786+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	19	http://178.156.170.185:8055
170	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.793+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	20	http://178.156.170.185:8055
171	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.801+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	21	http://178.156.170.185:8055
172	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.807+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	22	http://178.156.170.185:8055
173	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.812+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	23	http://178.156.170.185:8055
174	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.818+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	24	http://178.156.170.185:8055
175	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.825+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	25	http://178.156.170.185:8055
176	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.832+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	26	http://178.156.170.185:8055
177	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.841+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	27	http://178.156.170.185:8055
178	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.854+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	28	http://178.156.170.185:8055
179	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.872+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	29	http://178.156.170.185:8055
180	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.882+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	30	http://178.156.170.185:8055
181	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.892+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	31	http://178.156.170.185:8055
182	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.898+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	32	http://178.156.170.185:8055
183	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.911+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	33	http://178.156.170.185:8055
184	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.923+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	34	http://178.156.170.185:8055
185	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.937+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	35	http://178.156.170.185:8055
186	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.945+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	36	http://178.156.170.185:8055
187	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.949+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	37	http://178.156.170.185:8055
188	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.954+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	38	http://178.156.170.185:8055
189	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.959+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	39	http://178.156.170.185:8055
190	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.965+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	40	http://178.156.170.185:8055
191	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.97+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	41	http://178.156.170.185:8055
192	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.975+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	42	http://178.156.170.185:8055
193	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.981+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	43	http://178.156.170.185:8055
194	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.985+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	44	http://178.156.170.185:8055
195	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.989+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	45	http://178.156.170.185:8055
196	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.994+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	46	http://178.156.170.185:8055
197	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:56.999+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	47	http://178.156.170.185:8055
198	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.005+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	48	http://178.156.170.185:8055
199	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.01+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	49	http://178.156.170.185:8055
200	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.015+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	50	http://178.156.170.185:8055
201	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.021+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	51	http://178.156.170.185:8055
202	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.026+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	52	http://178.156.170.185:8055
203	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.031+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	53	http://178.156.170.185:8055
204	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.036+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	54	http://178.156.170.185:8055
205	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.042+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	55	http://178.156.170.185:8055
206	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.047+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	56	http://178.156.170.185:8055
207	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.053+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	57	http://178.156.170.185:8055
208	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.058+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	58	http://178.156.170.185:8055
209	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.064+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	59	http://178.156.170.185:8055
210	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.068+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	60	http://178.156.170.185:8055
211	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.075+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	61	http://178.156.170.185:8055
212	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.081+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	62	http://178.156.170.185:8055
213	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.089+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	63	http://178.156.170.185:8055
214	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.094+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	64	http://178.156.170.185:8055
215	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.1+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	134	http://178.156.170.185:8055
216	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.106+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	65	http://178.156.170.185:8055
217	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.111+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	66	http://178.156.170.185:8055
218	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.116+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	67	http://178.156.170.185:8055
219	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.121+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	68	http://178.156.170.185:8055
220	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.126+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	69	http://178.156.170.185:8055
221	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.133+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	71	http://178.156.170.185:8055
222	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:58:57.138+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	72	http://178.156.170.185:8055
223	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:03.947+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	1	http://178.156.170.185:8055
224	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:03.957+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	4	http://178.156.170.185:8055
225	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:03.966+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	5	http://178.156.170.185:8055
226	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:03.973+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	6	http://178.156.170.185:8055
227	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:03.979+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	7	http://178.156.170.185:8055
228	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:03.986+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	8	http://178.156.170.185:8055
229	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:03.994+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	9	http://178.156.170.185:8055
230	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.006+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	10	http://178.156.170.185:8055
231	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.015+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	11	http://178.156.170.185:8055
232	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.023+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	12	http://178.156.170.185:8055
233	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.031+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	13	http://178.156.170.185:8055
234	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.042+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	14	http://178.156.170.185:8055
235	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.053+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	15	http://178.156.170.185:8055
236	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.065+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	16	http://178.156.170.185:8055
237	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.078+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	17	http://178.156.170.185:8055
238	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.087+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	18	http://178.156.170.185:8055
239	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.097+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	19	http://178.156.170.185:8055
240	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.106+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	20	http://178.156.170.185:8055
241	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.114+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	21	http://178.156.170.185:8055
242	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.123+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	22	http://178.156.170.185:8055
243	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.132+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	23	http://178.156.170.185:8055
244	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.14+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	24	http://178.156.170.185:8055
245	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.148+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	25	http://178.156.170.185:8055
246	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.158+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	26	http://178.156.170.185:8055
247	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.169+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	27	http://178.156.170.185:8055
248	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.18+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	28	http://178.156.170.185:8055
249	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.191+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	29	http://178.156.170.185:8055
250	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.202+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	30	http://178.156.170.185:8055
251	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.211+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	31	http://178.156.170.185:8055
252	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.22+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	32	http://178.156.170.185:8055
253	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.232+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	33	http://178.156.170.185:8055
254	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.24+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	34	http://178.156.170.185:8055
255	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.248+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	35	http://178.156.170.185:8055
256	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.258+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	36	http://178.156.170.185:8055
257	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.267+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	37	http://178.156.170.185:8055
258	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.276+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	38	http://178.156.170.185:8055
259	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.286+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	39	http://178.156.170.185:8055
260	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.294+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	40	http://178.156.170.185:8055
261	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.303+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	41	http://178.156.170.185:8055
262	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.314+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	42	http://178.156.170.185:8055
263	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.324+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	43	http://178.156.170.185:8055
264	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.337+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	44	http://178.156.170.185:8055
265	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.347+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	45	http://178.156.170.185:8055
266	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.356+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	46	http://178.156.170.185:8055
267	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.365+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	47	http://178.156.170.185:8055
268	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.376+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	48	http://178.156.170.185:8055
269	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.384+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	49	http://178.156.170.185:8055
270	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.391+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	50	http://178.156.170.185:8055
271	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.397+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	51	http://178.156.170.185:8055
272	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.404+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	52	http://178.156.170.185:8055
273	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.412+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	53	http://178.156.170.185:8055
274	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.418+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	54	http://178.156.170.185:8055
275	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.423+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	55	http://178.156.170.185:8055
276	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.429+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	134	http://178.156.170.185:8055
277	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.435+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	56	http://178.156.170.185:8055
278	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.44+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	57	http://178.156.170.185:8055
279	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.446+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	58	http://178.156.170.185:8055
280	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.451+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	59	http://178.156.170.185:8055
281	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.457+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	60	http://178.156.170.185:8055
282	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.462+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	61	http://178.156.170.185:8055
283	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.472+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	62	http://178.156.170.185:8055
284	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.481+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	63	http://178.156.170.185:8055
285	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.489+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	64	http://178.156.170.185:8055
286	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.497+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	65	http://178.156.170.185:8055
287	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.506+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	66	http://178.156.170.185:8055
288	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.514+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	67	http://178.156.170.185:8055
289	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.522+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	68	http://178.156.170.185:8055
290	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.53+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	69	http://178.156.170.185:8055
291	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.538+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	71	http://178.156.170.185:8055
292	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:04.547+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	72	http://178.156.170.185:8055
293	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.231+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	1	http://178.156.170.185:8055
294	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.237+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	4	http://178.156.170.185:8055
295	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.241+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	5	http://178.156.170.185:8055
296	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.247+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	6	http://178.156.170.185:8055
297	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.252+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	7	http://178.156.170.185:8055
298	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.256+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	8	http://178.156.170.185:8055
299	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.263+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	9	http://178.156.170.185:8055
300	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.267+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	10	http://178.156.170.185:8055
301	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.272+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	11	http://178.156.170.185:8055
302	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.276+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	12	http://178.156.170.185:8055
303	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.281+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	13	http://178.156.170.185:8055
304	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.286+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	14	http://178.156.170.185:8055
305	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.29+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	15	http://178.156.170.185:8055
306	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.295+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	16	http://178.156.170.185:8055
307	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.299+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	17	http://178.156.170.185:8055
308	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.304+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	18	http://178.156.170.185:8055
309	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.314+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	19	http://178.156.170.185:8055
310	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.319+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	20	http://178.156.170.185:8055
311	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.323+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	21	http://178.156.170.185:8055
312	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.328+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	22	http://178.156.170.185:8055
313	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.332+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	23	http://178.156.170.185:8055
314	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.337+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	24	http://178.156.170.185:8055
315	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.344+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	25	http://178.156.170.185:8055
316	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.349+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	26	http://178.156.170.185:8055
317	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.353+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	27	http://178.156.170.185:8055
318	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.357+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	28	http://178.156.170.185:8055
319	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.362+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	29	http://178.156.170.185:8055
320	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.366+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	30	http://178.156.170.185:8055
321	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.371+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	31	http://178.156.170.185:8055
322	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.376+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	32	http://178.156.170.185:8055
323	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.381+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	33	http://178.156.170.185:8055
324	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.385+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	34	http://178.156.170.185:8055
325	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.39+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	35	http://178.156.170.185:8055
326	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.394+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	36	http://178.156.170.185:8055
327	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.399+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	37	http://178.156.170.185:8055
328	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.403+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	38	http://178.156.170.185:8055
329	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.408+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	39	http://178.156.170.185:8055
330	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.413+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	40	http://178.156.170.185:8055
331	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.421+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	41	http://178.156.170.185:8055
332	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.426+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	134	http://178.156.170.185:8055
333	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.43+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	42	http://178.156.170.185:8055
334	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.435+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	43	http://178.156.170.185:8055
335	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.44+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	44	http://178.156.170.185:8055
336	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.444+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	45	http://178.156.170.185:8055
337	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.449+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	46	http://178.156.170.185:8055
338	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.453+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	47	http://178.156.170.185:8055
339	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.458+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	48	http://178.156.170.185:8055
340	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.462+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	49	http://178.156.170.185:8055
341	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.467+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	50	http://178.156.170.185:8055
342	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.471+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	51	http://178.156.170.185:8055
343	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.476+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	52	http://178.156.170.185:8055
344	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.481+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	53	http://178.156.170.185:8055
345	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.485+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	54	http://178.156.170.185:8055
346	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.493+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	55	http://178.156.170.185:8055
347	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.505+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	56	http://178.156.170.185:8055
348	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.511+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	57	http://178.156.170.185:8055
349	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.52+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	58	http://178.156.170.185:8055
350	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.526+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	59	http://178.156.170.185:8055
351	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.533+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	60	http://178.156.170.185:8055
352	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.546+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	61	http://178.156.170.185:8055
353	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.559+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	62	http://178.156.170.185:8055
354	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.563+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	63	http://178.156.170.185:8055
355	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.568+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	64	http://178.156.170.185:8055
356	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.572+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	65	http://178.156.170.185:8055
357	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.576+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	66	http://178.156.170.185:8055
358	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.58+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	67	http://178.156.170.185:8055
359	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.584+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	68	http://178.156.170.185:8055
360	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.588+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	69	http://178.156.170.185:8055
361	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.592+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	71	http://178.156.170.185:8055
362	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:12.597+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	72	http://178.156.170.185:8055
363	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.963+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	1	http://178.156.170.185:8055
364	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.968+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	4	http://178.156.170.185:8055
365	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.973+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	5	http://178.156.170.185:8055
366	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.978+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	6	http://178.156.170.185:8055
367	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.983+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	7	http://178.156.170.185:8055
368	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.988+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	8	http://178.156.170.185:8055
369	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.993+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	9	http://178.156.170.185:8055
370	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:17.999+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	10	http://178.156.170.185:8055
371	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.004+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	11	http://178.156.170.185:8055
372	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.01+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	12	http://178.156.170.185:8055
373	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.015+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	13	http://178.156.170.185:8055
374	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.021+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	14	http://178.156.170.185:8055
375	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.026+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	15	http://178.156.170.185:8055
376	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.032+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	16	http://178.156.170.185:8055
377	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.037+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	17	http://178.156.170.185:8055
378	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.042+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	18	http://178.156.170.185:8055
379	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.048+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	19	http://178.156.170.185:8055
380	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.053+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	20	http://178.156.170.185:8055
381	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.059+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	21	http://178.156.170.185:8055
382	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.064+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	22	http://178.156.170.185:8055
383	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.07+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	23	http://178.156.170.185:8055
384	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.075+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	24	http://178.156.170.185:8055
385	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.08+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	25	http://178.156.170.185:8055
386	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.089+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	26	http://178.156.170.185:8055
387	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.094+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	27	http://178.156.170.185:8055
388	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.1+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	28	http://178.156.170.185:8055
389	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.105+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	29	http://178.156.170.185:8055
390	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.111+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	30	http://178.156.170.185:8055
391	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.12+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	31	http://178.156.170.185:8055
392	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.128+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	32	http://178.156.170.185:8055
393	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.135+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	33	http://178.156.170.185:8055
394	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.143+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	134	http://178.156.170.185:8055
395	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.153+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	34	http://178.156.170.185:8055
396	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.163+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	35	http://178.156.170.185:8055
397	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.17+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	36	http://178.156.170.185:8055
398	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.178+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	37	http://178.156.170.185:8055
399	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.185+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	38	http://178.156.170.185:8055
400	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.194+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	39	http://178.156.170.185:8055
401	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.207+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	40	http://178.156.170.185:8055
402	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.214+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	41	http://178.156.170.185:8055
403	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.222+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	42	http://178.156.170.185:8055
404	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.229+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	43	http://178.156.170.185:8055
405	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.236+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	44	http://178.156.170.185:8055
406	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.242+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	45	http://178.156.170.185:8055
407	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.249+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	46	http://178.156.170.185:8055
408	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.256+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	47	http://178.156.170.185:8055
409	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.262+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	48	http://178.156.170.185:8055
410	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.267+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	49	http://178.156.170.185:8055
411	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.273+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	50	http://178.156.170.185:8055
412	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.278+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	51	http://178.156.170.185:8055
413	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.282+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	52	http://178.156.170.185:8055
414	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.287+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	53	http://178.156.170.185:8055
415	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.293+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	54	http://178.156.170.185:8055
416	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.298+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	55	http://178.156.170.185:8055
417	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.305+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	56	http://178.156.170.185:8055
418	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.31+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	57	http://178.156.170.185:8055
419	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.315+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	58	http://178.156.170.185:8055
420	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.319+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	59	http://178.156.170.185:8055
421	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.324+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	60	http://178.156.170.185:8055
422	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.328+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	61	http://178.156.170.185:8055
423	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.333+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	62	http://178.156.170.185:8055
424	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.338+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	63	http://178.156.170.185:8055
425	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.342+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	64	http://178.156.170.185:8055
426	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.347+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	65	http://178.156.170.185:8055
427	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.352+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	66	http://178.156.170.185:8055
428	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.356+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	67	http://178.156.170.185:8055
429	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.362+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	68	http://178.156.170.185:8055
430	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.367+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	69	http://178.156.170.185:8055
431	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.372+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	71	http://178.156.170.185:8055
432	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:18.379+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	72	http://178.156.170.185:8055
433	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.89+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	1	http://178.156.170.185:8055
434	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.897+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	4	http://178.156.170.185:8055
435	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.903+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	5	http://178.156.170.185:8055
436	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.909+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	6	http://178.156.170.185:8055
437	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.915+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	7	http://178.156.170.185:8055
438	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.921+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	8	http://178.156.170.185:8055
439	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.928+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	9	http://178.156.170.185:8055
440	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.934+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	10	http://178.156.170.185:8055
441	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.939+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	11	http://178.156.170.185:8055
442	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.948+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	12	http://178.156.170.185:8055
443	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.955+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	13	http://178.156.170.185:8055
444	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.962+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	14	http://178.156.170.185:8055
445	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.968+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	15	http://178.156.170.185:8055
446	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.975+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	16	http://178.156.170.185:8055
447	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.98+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	17	http://178.156.170.185:8055
448	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.988+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	18	http://178.156.170.185:8055
449	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:26.996+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	19	http://178.156.170.185:8055
450	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.003+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	20	http://178.156.170.185:8055
451	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.01+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	21	http://178.156.170.185:8055
452	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.016+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	22	http://178.156.170.185:8055
453	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.022+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	23	http://178.156.170.185:8055
454	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.028+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	24	http://178.156.170.185:8055
455	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.034+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	25	http://178.156.170.185:8055
456	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.043+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	134	http://178.156.170.185:8055
457	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.048+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	26	http://178.156.170.185:8055
458	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.054+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	27	http://178.156.170.185:8055
459	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.06+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	28	http://178.156.170.185:8055
460	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.071+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	29	http://178.156.170.185:8055
461	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.082+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	30	http://178.156.170.185:8055
462	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.089+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	31	http://178.156.170.185:8055
463	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.095+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	32	http://178.156.170.185:8055
464	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.102+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	33	http://178.156.170.185:8055
465	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.108+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	34	http://178.156.170.185:8055
466	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.113+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	35	http://178.156.170.185:8055
467	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.119+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	36	http://178.156.170.185:8055
468	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.124+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	37	http://178.156.170.185:8055
469	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.129+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	38	http://178.156.170.185:8055
470	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.134+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	39	http://178.156.170.185:8055
471	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.139+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	40	http://178.156.170.185:8055
472	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.144+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	41	http://178.156.170.185:8055
473	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.151+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	42	http://178.156.170.185:8055
474	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.158+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	43	http://178.156.170.185:8055
475	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.168+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	44	http://178.156.170.185:8055
476	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.181+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	45	http://178.156.170.185:8055
477	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.193+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	46	http://178.156.170.185:8055
478	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.202+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	47	http://178.156.170.185:8055
479	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.209+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	48	http://178.156.170.185:8055
480	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.216+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	49	http://178.156.170.185:8055
481	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.224+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	50	http://178.156.170.185:8055
482	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.234+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	51	http://178.156.170.185:8055
483	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.242+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	52	http://178.156.170.185:8055
484	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.251+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	53	http://178.156.170.185:8055
485	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.258+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	54	http://178.156.170.185:8055
486	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.265+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	55	http://178.156.170.185:8055
487	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.272+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	56	http://178.156.170.185:8055
488	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.279+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	57	http://178.156.170.185:8055
489	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.287+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	58	http://178.156.170.185:8055
490	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.294+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	59	http://178.156.170.185:8055
491	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.301+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	60	http://178.156.170.185:8055
492	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.31+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	61	http://178.156.170.185:8055
493	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.318+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	62	http://178.156.170.185:8055
494	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.325+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	63	http://178.156.170.185:8055
495	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.334+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	64	http://178.156.170.185:8055
496	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.342+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	65	http://178.156.170.185:8055
497	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.35+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	66	http://178.156.170.185:8055
498	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.358+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	67	http://178.156.170.185:8055
499	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.365+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	68	http://178.156.170.185:8055
500	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.373+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	69	http://178.156.170.185:8055
501	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.379+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	71	http://178.156.170.185:8055
502	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:27.386+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	72	http://178.156.170.185:8055
503	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-01 23:59:59.911+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	6	http://178.156.170.185:8055
504	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-02 00:02:43.291+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	135	http://178.156.170.185:8055
505	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-03 23:40:20.893+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
506	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 00:07:47.517+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	3e0d7012-e3c5-4671-906a-42d210df64dc	http://178.156.170.185:8055
507	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 01:29:21.451+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	3e0d7012-e3c5-4671-906a-42d210df64dc	http://178.156.170.185:8055
508	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 15:44:53.043+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	136	http://178.156.170.185:8055
509	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 15:44:53.047+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	business_intel_reports	http://178.156.170.185:8055
510	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 15:46:09.289+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	137	http://178.156.170.185:8055
511	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 15:46:36.667+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	138	http://178.156.170.185:8055
512	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 15:46:56.431+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	139	http://178.156.170.185:8055
513	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 15:47:28.411+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	140	http://178.156.170.185:8055
514	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 15:49:58.701+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	85bf971e-6a2f-4ac8-8e78-32069eb6667e	http://178.156.170.185:8055
515	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 16:03:33.677+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	280a3e38-bd6d-41d2-a260-593c2d615d27	http://178.156.170.185:8055
516	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 16:03:33.684+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	85bf971e-6a2f-4ac8-8e78-32069eb6667e	http://178.156.170.185:8055
517	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 16:10:09.064+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	141	http://178.156.170.185:8055
518	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 16:10:54.765+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	142	http://178.156.170.185:8055
519	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 19:26:32.664+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
520	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 19:28:29.316+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	8097b12c-b5b4-4926-ad0d-3ba05636b586	http://178.156.170.185:8055
521	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 19:28:29.324+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
522	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 19:32:48.336+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	a551b288-3e2d-4815-8ff3-c3a228d9fc78	http://178.156.170.185:8055
523	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 19:32:48.344+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	85bf971e-6a2f-4ac8-8e78-32069eb6667e	http://178.156.170.185:8055
524	create	280a3e38-bd6d-41d2-a260-593c2d615d27	2025-12-04 20:08:39.121+00	172.25.0.5	python-httpx/0.28.1	business_intel_reports	1	\N
525	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 21:34:58.435+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	143	http://178.156.170.185:8055
526	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 21:34:58.44+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	target_cities	http://178.156.170.185:8055
527	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 21:39:52.103+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	144	http://178.156.170.185:8055
528	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-04 21:40:31.028+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	145	http://178.156.170.185:8055
529	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:03:11.167+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	146	http://178.156.170.185:8055
530	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:03:11.171+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	target_services	http://178.156.170.185:8055
531	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:03:30.205+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	147	http://178.156.170.185:8055
532	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:03:30.211+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	keyword_opportunities	http://178.156.170.185:8055
533	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:05:06.972+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	148	http://178.156.170.185:8055
534	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:05:35.643+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	149	http://178.156.170.185:8055
535	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:08:02.061+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	150	http://178.156.170.185:8055
536	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:08:18.748+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	151	http://178.156.170.185:8055
537	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:08:38.612+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	152	http://178.156.170.185:8055
538	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:09:13.237+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	153	http://178.156.170.185:8055
539	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:12:51.861+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	154	http://178.156.170.185:8055
540	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 16:15:25.665+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	155	http://178.156.170.185:8055
541	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:16:26.309+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	1	http://178.156.170.185:8055
542	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:16:26.316+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	2	http://178.156.170.185:8055
543	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:16:26.321+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	3	http://178.156.170.185:8055
544	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:16:26.332+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	4	http://178.156.170.185:8055
545	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:16:26.337+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	5	http://178.156.170.185:8055
546	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:16:26.342+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
547	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:29:11.428+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	87c485bc-9987-489d-8da6-fc8a945ee3cb	http://178.156.170.185:8055
548	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:29:11.432+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	http://178.156.170.185:8055
549	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:32:20.496+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	8097b12c-b5b4-4926-ad0d-3ba05636b586	http://178.156.170.185:8055
550	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 17:32:20.499+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
551	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 18:06:35.987+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	6	http://178.156.170.185:8055
552	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 18:06:35.994+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
553	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 18:07:56.225+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	acc9fe5a-017f-4a42-bb3c-5b5bbddbd1b3	http://178.156.170.185:8055
554	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-05 18:07:56.23+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
555	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-06 21:04:51.556+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
556	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-06 22:20:54.572+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
557	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:34:28.658+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	156	http://178.156.170.185:8055
558	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:34:28.673+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_requests	http://178.156.170.185:8055
1102	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:46:03.407+00	172.27.0.2	axios/1.12.0	content_outputs	17	\N
559	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:46:46.827+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	157	http://178.156.170.185:8055
560	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:47:44.385+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	158	http://178.156.170.185:8055
561	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:47:59.978+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	159	http://178.156.170.185:8055
562	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:48:14.995+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	160	http://178.156.170.185:8055
563	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:52:36.172+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	161	http://178.156.170.185:8055
564	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:55:02.35+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	161	http://178.156.170.185:8055
565	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:55:34.308+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	162	http://178.156.170.185:8055
566	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:57:31.838+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	162	http://178.156.170.185:8055
567	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 21:58:27.571+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	163	http://178.156.170.185:8055
568	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:00:55.045+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	164	http://178.156.170.185:8055
569	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:01:13.969+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	165	http://178.156.170.185:8055
570	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:01:34.137+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	166	http://178.156.170.185:8055
571	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:19:32.544+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	167	http://178.156.170.185:8055
572	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:19:32.549+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_outputs	http://178.156.170.185:8055
573	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:21:34.293+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	168	http://178.156.170.185:8055
574	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:21:47.698+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	169	http://178.156.170.185:8055
575	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:23:17.819+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	170	http://178.156.170.185:8055
576	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:23:43.227+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	171	http://178.156.170.185:8055
577	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:24:41.988+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	172	http://178.156.170.185:8055
578	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:25:10.374+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	173	http://178.156.170.185:8055
579	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:25:40.563+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	174	http://178.156.170.185:8055
580	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:26:02.277+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	175	http://178.156.170.185:8055
581	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:26:22.241+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	176	http://178.156.170.185:8055
582	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:26:56.649+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	177	http://178.156.170.185:8055
583	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:27:51.381+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	178	http://178.156.170.185:8055
584	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:28:23.756+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	179	http://178.156.170.185:8055
585	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:28:47.756+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	180	http://178.156.170.185:8055
586	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:30:33.634+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	181	http://178.156.170.185:8055
587	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:31:15.955+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	182	http://178.156.170.185:8055
588	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:31:15.959+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	writing_personas	http://178.156.170.185:8055
589	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:31:36.405+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	183	http://178.156.170.185:8055
590	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:31:51.36+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	184	http://178.156.170.185:8055
591	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:32:17.581+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	185	http://178.156.170.185:8055
592	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:33:22.293+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	186	http://178.156.170.185:8055
593	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:33:50.16+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	187	http://178.156.170.185:8055
594	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:35:25.816+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	188	http://178.156.170.185:8055
595	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:35:25.828+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	audience_profiles	http://178.156.170.185:8055
596	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:35:38.285+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	189	http://178.156.170.185:8055
597	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:37:18.098+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	190	http://178.156.170.185:8055
598	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:39:26.127+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	191	http://178.156.170.185:8055
599	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:40:01.263+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	192	http://178.156.170.185:8055
600	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:40:35.14+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	193	http://178.156.170.185:8055
601	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:40:58.077+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	194	http://178.156.170.185:8055
602	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:42:36.079+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	195	http://178.156.170.185:8055
603	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:42:52.97+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	196	http://178.156.170.185:8055
604	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:43:27.992+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	197	http://178.156.170.185:8055
605	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:44:02.989+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	198	http://178.156.170.185:8055
606	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:44:40.304+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	199	http://178.156.170.185:8055
607	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:46:03.669+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	200	http://178.156.170.185:8055
608	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:47:47.69+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	201	http://178.156.170.185:8055
609	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.264+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	7	http://178.156.170.185:8055
610	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.274+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	8	http://178.156.170.185:8055
611	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.282+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	9	http://178.156.170.185:8055
612	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.29+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	10	http://178.156.170.185:8055
613	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.297+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	11	http://178.156.170.185:8055
614	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.302+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	12	http://178.156.170.185:8055
615	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.307+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	13	http://178.156.170.185:8055
616	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.312+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	14	http://178.156.170.185:8055
617	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.317+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	15	http://178.156.170.185:8055
618	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.323+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	16	http://178.156.170.185:8055
619	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.327+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	17	http://178.156.170.185:8055
620	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.333+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_permissions	18	http://178.156.170.185:8055
621	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-08 22:59:21.339+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
1103	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:46:10.305+00	172.27.0.2	axios/1.12.0	content_outputs	17	\N
622	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:42:21.768+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	202	http://178.156.170.185:8055
623	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:42:21.777+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	image_assets	http://178.156.170.185:8055
624	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:42:47.643+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	203	http://178.156.170.185:8055
625	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:43:05.866+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	204	http://178.156.170.185:8055
626	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:44:14.699+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	205	http://178.156.170.185:8055
627	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:44:43.76+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	204	http://178.156.170.185:8055
628	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:44:57.696+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	206	http://178.156.170.185:8055
629	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:45:16.434+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	207	http://178.156.170.185:8055
630	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:46:47.27+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	208	http://178.156.170.185:8055
631	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:47:18.289+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	208	http://178.156.170.185:8055
632	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:47:30.687+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	209	http://178.156.170.185:8055
633	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:48:01.401+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	210	http://178.156.170.185:8055
634	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:48:13.994+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	211	http://178.156.170.185:8055
635	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:48:34.095+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	212	http://178.156.170.185:8055
636	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:48:59.875+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	213	http://178.156.170.185:8055
637	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:49:24.145+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	214	http://178.156.170.185:8055
638	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:49:57.181+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	215	http://178.156.170.185:8055
639	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 02:50:20.383+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	216	http://178.156.170.185:8055
640	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:26:36.592+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	217	http://178.156.170.185:8055
641	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:26:50.408+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	217	http://178.156.170.185:8055
642	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:27:54.627+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	218	http://178.156.170.185:8055
643	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:27:54.636+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_silos	http://178.156.170.185:8055
644	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:28:13.362+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	219	http://178.156.170.185:8055
645	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:28:28.818+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	220	http://178.156.170.185:8055
646	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:29:02.943+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	221	http://178.156.170.185:8055
647	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:37:24.384+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	222	http://178.156.170.185:8055
648	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:37:41.887+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	223	http://178.156.170.185:8055
649	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:38:00.116+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	224	http://178.156.170.185:8055
650	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:38:21.934+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	225	http://178.156.170.185:8055
651	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:38:21.937+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_nodes	http://178.156.170.185:8055
652	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:39:10.569+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	226	http://178.156.170.185:8055
653	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:40:28.216+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	227	http://178.156.170.185:8055
654	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:40:53.499+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	228	http://178.156.170.185:8055
655	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:41:45.721+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	229	http://178.156.170.185:8055
656	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:41:51.496+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	229	http://178.156.170.185:8055
657	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:42:08.342+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	230	http://178.156.170.185:8055
658	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:42:49.608+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	231	http://178.156.170.185:8055
659	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:43:12.952+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	232	http://178.156.170.185:8055
660	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:43:59.126+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	233	http://178.156.170.185:8055
661	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:43:59.129+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	viral_patterns	http://178.156.170.185:8055
662	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:44:25.117+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	234	http://178.156.170.185:8055
663	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:44:50.858+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	235	http://178.156.170.185:8055
664	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:45:41.543+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	236	http://178.156.170.185:8055
665	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:46:11.153+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	237	http://178.156.170.185:8055
666	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:47:24.134+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	238	http://178.156.170.185:8055
667	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.132+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_nodes	http://178.156.170.185:8055
668	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.135+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	225	http://178.156.170.185:8055
669	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.136+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	226	http://178.156.170.185:8055
670	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.137+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	227	http://178.156.170.185:8055
671	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.138+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	228	http://178.156.170.185:8055
672	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.14+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	230	http://178.156.170.185:8055
673	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.143+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	231	http://178.156.170.185:8055
674	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:16.145+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	232	http://178.156.170.185:8055
675	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:27.963+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	239	http://178.156.170.185:8055
676	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:27.976+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	silo_nodes	http://178.156.170.185:8055
677	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:51:45.588+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	240	http://178.156.170.185:8055
678	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:52:00.536+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	241	http://178.156.170.185:8055
679	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:52:14.722+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	242	http://178.156.170.185:8055
680	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:52:39.139+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	243	http://178.156.170.185:8055
681	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:53:07.418+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	244	http://178.156.170.185:8055
682	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:53:30.132+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	245	http://178.156.170.185:8055
683	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:53:45.699+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	246	http://178.156.170.185:8055
684	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:54:22.265+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	247	http://178.156.170.185:8055
685	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:56:24.342+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	248	http://178.156.170.185:8055
686	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:56:24.348+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	fact_candidates	http://178.156.170.185:8055
687	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:56:59.636+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	249	http://178.156.170.185:8055
688	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:57:13.901+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	250	http://178.156.170.185:8055
689	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:57:44.817+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	251	http://178.156.170.185:8055
690	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:57:55.455+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	252	http://178.156.170.185:8055
691	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 03:58:07.305+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	252	http://178.156.170.185:8055
692	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:02:11.58+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	253	http://178.156.170.185:8055
693	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:04:14.543+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	254	http://178.156.170.185:8055
694	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:04:40.863+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	255	http://178.156.170.185:8055
695	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:04:56.73+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	256	http://178.156.170.185:8055
696	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:05:46.732+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	257	http://178.156.170.185:8055
697	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:07:26.275+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	258	http://178.156.170.185:8055
698	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:15:24.455+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	259	http://178.156.170.185:8055
699	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:15:24.459+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	industries	http://178.156.170.185:8055
700	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:15:46.57+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	260	http://178.156.170.185:8055
701	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:16:05.002+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	261	http://178.156.170.185:8055
702	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:16:37.571+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	262	http://178.156.170.185:8055
703	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:17:09.232+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	263	http://178.156.170.185:8055
704	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:17:09.239+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	sub_industry	http://178.156.170.185:8055
705	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:17:51.611+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	264	http://178.156.170.185:8055
706	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:18:07.07+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	264	http://178.156.170.185:8055
707	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:18:37.48+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	265	http://178.156.170.185:8055
708	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:18:47.824+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	266	http://178.156.170.185:8055
709	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:19:08.733+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	267	http://178.156.170.185:8055
710	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:19:40.665+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	268	http://178.156.170.185:8055
711	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:22:00.343+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	269	http://178.156.170.185:8055
712	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:22:00.349+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	topics	http://178.156.170.185:8055
713	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:22:30.937+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	270	http://178.156.170.185:8055
714	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:22:54.609+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	271	http://178.156.170.185:8055
715	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:23:14.39+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	272	http://178.156.170.185:8055
716	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:23:38.547+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	273	http://178.156.170.185:8055
717	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:24:11.319+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	274	http://178.156.170.185:8055
718	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:24:59.236+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	275	http://178.156.170.185:8055
719	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:24:59.242+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	trend_topics	http://178.156.170.185:8055
720	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:25:22.89+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	276	http://178.156.170.185:8055
721	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:25:37.348+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	277	http://178.156.170.185:8055
722	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:26:17.985+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	278	http://178.156.170.185:8055
723	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:26:40.403+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	279	http://178.156.170.185:8055
724	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:28:09.491+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	280	http://178.156.170.185:8055
725	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:28:34.399+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	281	http://178.156.170.185:8055
726	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:29:04.85+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	282	http://178.156.170.185:8055
727	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:29:48.273+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	283	http://178.156.170.185:8055
728	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:29:53.921+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	283	http://178.156.170.185:8055
729	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:30:05.785+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	284	http://178.156.170.185:8055
730	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:30:22.712+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	285	http://178.156.170.185:8055
731	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:30:41.456+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	286	http://178.156.170.185:8055
732	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:30:56.44+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	287	http://178.156.170.185:8055
733	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:45:41.36+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	280	http://178.156.170.185:8055
734	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:46:32.076+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	288	http://178.156.170.185:8055
735	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:47:28.191+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	288	http://178.156.170.185:8055
736	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:47:56.691+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	282	http://178.156.170.185:8055
737	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:49:16.91+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	289	http://178.156.170.185:8055
738	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:53:41.307+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	241	http://178.156.170.185:8055
739	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:55:53.204+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	246	http://178.156.170.185:8055
740	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:58:20.786+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	161	http://178.156.170.185:8055
741	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 04:59:08.279+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	161	http://178.156.170.185:8055
742	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:07:36.803+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	191	http://178.156.170.185:8055
743	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:08:09.881+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	198	http://178.156.170.185:8055
744	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:08:26.47+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	290	http://178.156.170.185:8055
745	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:22:26.495+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	291	http://178.156.170.185:8055
746	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:22:26.5+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	banned_phrases	http://178.156.170.185:8055
747	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:22:46.865+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	292	http://178.156.170.185:8055
748	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:23:47.895+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	293	http://178.156.170.185:8055
749	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:24:08.672+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	294	http://178.156.170.185:8055
750	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:24:55.106+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	295	http://178.156.170.185:8055
751	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:24:55.112+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	experience_snippets	http://178.156.170.185:8055
752	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:25:43.908+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	296	http://178.156.170.185:8055
753	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:28:05.549+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	297	http://178.156.170.185:8055
754	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:28:23.335+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	298	http://178.156.170.185:8055
755	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:30:06.06+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	299	http://178.156.170.185:8055
756	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:30:06.072+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	snippet_category	http://178.156.170.185:8055
757	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:30:53.284+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	snippet_category	http://178.156.170.185:8055
758	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:30:53.287+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	299	http://178.156.170.185:8055
759	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.483+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	audience_profiles	http://178.156.170.185:8055
760	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.49+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	banned_phrases	http://178.156.170.185:8055
761	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.5+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	business_intel_reports	http://178.156.170.185:8055
762	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.506+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_outputs	http://178.156.170.185:8055
1104	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:46:10.336+00	172.27.0.2	axios/1.12.0	content_requests	1	\N
763	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.513+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_requests	http://178.156.170.185:8055
764	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.522+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_silos	http://178.156.170.185:8055
765	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.532+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	experience_snippets	http://178.156.170.185:8055
766	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.539+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	fact_candidates	http://178.156.170.185:8055
767	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.544+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	image_assets	http://178.156.170.185:8055
768	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.55+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	industries	http://178.156.170.185:8055
769	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.558+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	intel_debug	http://178.156.170.185:8055
770	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.565+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	intel_provenance	http://178.156.170.185:8055
771	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.571+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	kb_chunks	http://178.156.170.185:8055
772	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.575+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	kb_documents	http://178.156.170.185:8055
773	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.579+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	keyword_opportunities	http://178.156.170.185:8055
774	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.584+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	learning_queue	http://178.156.170.185:8055
775	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.593+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_audit	http://178.156.170.185:8055
776	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.6+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_enrichment	http://178.156.170.185:8055
777	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.605+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	silo_nodes	http://178.156.170.185:8055
778	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.611+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	sub_industry	http://178.156.170.185:8055
779	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.617+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	target_cities	http://178.156.170.185:8055
780	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.625+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	target_services	http://178.156.170.185:8055
781	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.631+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	topics	http://178.156.170.185:8055
782	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.637+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	viral_patterns	http://178.156.170.185:8055
783	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.646+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	trend_topics	http://178.156.170.185:8055
784	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:31:02.653+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	writing_personas	http://178.156.170.185:8055
785	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:32:11.698+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	300	http://178.156.170.185:8055
786	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:34:55.33+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	300	http://178.156.170.185:8055
787	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:36:06.551+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	301	http://178.156.170.185:8055
788	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:36:30.468+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	302	http://178.156.170.185:8055
789	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:36:57.084+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	303	http://178.156.170.185:8055
790	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:37:11.444+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	304	http://178.156.170.185:8055
791	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.236+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	295	http://178.156.170.185:8055
792	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.245+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	296	http://178.156.170.185:8055
1105	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:58:55.956+00	172.27.0.2	axios/1.12.0	content_outputs	18	\N
1106	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:59:04.149+00	172.27.0.2	axios/1.12.0	content_outputs	18	\N
793	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.256+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	297	http://178.156.170.185:8055
794	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.263+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	298	http://178.156.170.185:8055
795	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.273+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	300	http://178.156.170.185:8055
796	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.28+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	302	http://178.156.170.185:8055
797	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.286+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	301	http://178.156.170.185:8055
798	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.292+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	303	http://178.156.170.185:8055
799	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:02.299+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	304	http://178.156.170.185:8055
800	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:05.832+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	industries	http://178.156.170.185:8055
801	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:05.948+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	audience_profiles	http://178.156.170.185:8055
802	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:05.968+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	banned_phrases	http://178.156.170.185:8055
803	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:05.985+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	business_intel_reports	http://178.156.170.185:8055
804	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:05.996+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_outputs	http://178.156.170.185:8055
805	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.006+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_requests	http://178.156.170.185:8055
806	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.018+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	content_silos	http://178.156.170.185:8055
807	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.031+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	experience_snippets	http://178.156.170.185:8055
808	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.039+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	fact_candidates	http://178.156.170.185:8055
809	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.068+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	image_assets	http://178.156.170.185:8055
810	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.08+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	intel_debug	http://178.156.170.185:8055
811	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.089+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	intel_provenance	http://178.156.170.185:8055
812	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.096+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	kb_chunks	http://178.156.170.185:8055
813	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.101+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	kb_documents	http://178.156.170.185:8055
814	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.108+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	keyword_opportunities	http://178.156.170.185:8055
815	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.114+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	learning_queue	http://178.156.170.185:8055
816	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.119+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_audit	http://178.156.170.185:8055
817	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.128+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	seo_enrichment	http://178.156.170.185:8055
818	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.138+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	silo_nodes	http://178.156.170.185:8055
819	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.148+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	sub_industry	http://178.156.170.185:8055
820	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.156+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	target_cities	http://178.156.170.185:8055
821	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.164+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	target_services	http://178.156.170.185:8055
822	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.175+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	topics	http://178.156.170.185:8055
1107	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:59:04.181+00	172.27.0.2	axios/1.12.0	content_requests	1	\N
823	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.183+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	viral_patterns	http://178.156.170.185:8055
824	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.19+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	trend_topics	http://178.156.170.185:8055
825	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:38:06.2+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_collections	writing_personas	http://178.156.170.185:8055
826	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:42:56.063+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	203	http://178.156.170.185:8055
827	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:43:38.204+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	305	http://178.156.170.185:8055
828	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:46:15.815+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	206	http://178.156.170.185:8055
829	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:48:57.486+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	306	http://178.156.170.185:8055
830	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:51:57.57+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	207	http://178.156.170.185:8055
831	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:54:29.379+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	307	http://178.156.170.185:8055
832	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-09 05:56:00.292+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_fields	209	http://178.156.170.185:8055
833	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 00:35:08.4+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
834	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:07:50.639+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
835	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:10:07.624+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
836	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:10:07.634+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	69ab4824-ba9b-40fc-be17-38bb215023ff	http://178.156.170.185:8055
837	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:10:07.639+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
838	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:14:31.385+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	1848ad92-c8f4-4001-bab2-8d8f3621b441	http://178.156.170.185:8055
839	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:14:31.389+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
840	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:19:46.611+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
841	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:30:12.885+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_access	b9cc95dc-0d64-463b-b866-48c731720125	http://178.156.170.185:8055
842	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 03:30:12.89+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
843	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:30:12.812+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	b9cc95dc-0d64-463b-b866-48c731720125	http://178.156.170.185:8055
844	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:30:12.815+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
845	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:34:17.526+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
846	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:36:34.538+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
847	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:43:54.664+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
848	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:43:54.679+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
849	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:48:44.264+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	69ab4824-ba9b-40fc-be17-38bb215023ff	http://178.156.170.185:8055
850	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:48:44.268+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
851	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:50:34.093+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	1848ad92-c8f4-4001-bab2-8d8f3621b441	http://178.156.170.185:8055
1108	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:14:25.667+00	172.27.0.2	axios/1.12.0	content_outputs	19	\N
852	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:50:34.098+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
853	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 15:51:43.021+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
854	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:02:37.532+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	content_requests	1	http://178.156.170.185:8055
855	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:30.285+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	308	http://178.156.170.185:8055
856	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:41.95+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	audience_profiles	http://178.156.170.185:8055
857	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:41.957+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	banned_phrases	http://178.156.170.185:8055
858	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:41.965+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	business_intel_reports	http://178.156.170.185:8055
859	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:41.973+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	content_outputs	http://178.156.170.185:8055
860	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:41.981+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	content_requests	http://178.156.170.185:8055
861	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:41.988+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	content_silos	http://178.156.170.185:8055
862	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:41.995+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	experience_snippets	http://178.156.170.185:8055
863	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.009+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	fact_candidates	http://178.156.170.185:8055
864	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.021+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	industries	http://178.156.170.185:8055
865	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.027+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	image_assets	http://178.156.170.185:8055
866	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.031+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	intel_debug	http://178.156.170.185:8055
867	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.036+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	intel_provenance	http://178.156.170.185:8055
868	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.041+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	kb_chunks	http://178.156.170.185:8055
869	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.046+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	kb_documents	http://178.156.170.185:8055
870	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.051+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	keyword_opportunities	http://178.156.170.185:8055
871	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.056+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	learning_queue	http://178.156.170.185:8055
872	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.06+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	seo_audit	http://178.156.170.185:8055
873	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.067+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	seo_enrichment	http://178.156.170.185:8055
874	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.073+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	silo_nodes	http://178.156.170.185:8055
875	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.084+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	sub_industry	http://178.156.170.185:8055
876	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.093+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	target_cities	http://178.156.170.185:8055
877	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.101+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	target_services	http://178.156.170.185:8055
878	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.108+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	topics	http://178.156.170.185:8055
879	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.117+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	viral_patterns	http://178.156.170.185:8055
880	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.124+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	trend_topics	http://178.156.170.185:8055
881	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:22:42.131+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	writing_personas	http://178.156.170.185:8055
882	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:11.393+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	sub_industry	http://178.156.170.185:8055
883	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:11.397+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	263	http://178.156.170.185:8055
884	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:11.398+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	265	http://178.156.170.185:8055
885	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:11.399+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	266	http://178.156.170.185:8055
886	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:11.4+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	267	http://178.156.170.185:8055
887	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:11.401+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	268	http://178.156.170.185:8055
888	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:38.983+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	309	http://178.156.170.185:8055
889	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:38.986+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	sub_industries	http://178.156.170.185:8055
890	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:23:52.815+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	310	http://178.156.170.185:8055
891	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 16:24:11.849+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	311	http://178.156.170.185:8055
892	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 17:11:59.69+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	312	http://178.156.170.185:8055
893	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 17:20:26.694+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	313	http://178.156.170.185:8055
894	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 17:33:53.105+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	312	http://178.156.170.185:8055
895	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 17:33:57.889+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	313	http://178.156.170.185:8055
896	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 17:36:03.787+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	314	http://178.156.170.185:8055
897	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 18:39:10.051+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	http://178.156.170.185:8055
1109	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:14:31.426+00	172.27.0.2	axios/1.12.0	content_outputs	19	\N
916	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:18:51.528+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	314	http://178.156.170.185:8055
917	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:18:51.831+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	industries	http://178.156.170.185:8055
918	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:18:51.834+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	259	http://178.156.170.185:8055
919	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:18:51.834+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	260	http://178.156.170.185:8055
920	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:18:51.835+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	261	http://178.156.170.185:8055
921	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:18:51.836+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	262	http://178.156.170.185:8055
922	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:18:51.837+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	308	http://178.156.170.185:8055
923	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:20:35.67+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	315	http://178.156.170.185:8055
924	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:20:35.678+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	industries	http://178.156.170.185:8055
925	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:20:49.991+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	316	http://178.156.170.185:8055
926	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:20:59.769+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	317	http://178.156.170.185:8055
927	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:21:28.896+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	318	http://178.156.170.185:8055
928	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:21:48.768+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	319	http://178.156.170.185:8055
929	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:27:01.186+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
930	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:27:01.198+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	4b9c2a26-828b-4a29-92db-a4e714d6f484	http://178.156.170.185:8055
931	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:28:25.459+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	d50f18bb-e405-4a29-a69a-79ffd6586c66	http://178.156.170.185:8055
932	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:28:25.463+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
933	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:29:28.141+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	19	http://178.156.170.185:8055
934	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:29:28.147+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	20	http://178.156.170.185:8055
935	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:29:28.151+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
936	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:30:03.981+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	21	http://178.156.170.185:8055
937	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:30:03.985+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	22	http://178.156.170.185:8055
938	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:30:03.988+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
939	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:33:06.484+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	23	http://178.156.170.185:8055
940	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:33:06.489+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	24	http://178.156.170.185:8055
941	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:33:06.492+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
942	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:33:39.488+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	dd941938-759f-4666-8681-e1c9b4db2938	http://178.156.170.185:8055
943	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:33:39.492+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	badeb774-00c5-47f7-9330-4c08983bebcc	http://178.156.170.185:8055
1110	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:14:31.456+00	172.27.0.2	axios/1.12.0	content_requests	1	\N
944	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:33:39.497+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	3818cac1-1014-46b1-b3db-23961b035d54	http://178.156.170.185:8055
945	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:33:39.501+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
946	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:34:49.902+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
947	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:34:49.925+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
948	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:07.011+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	25	http://178.156.170.185:8055
949	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:07.015+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	26	http://178.156.170.185:8055
950	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:07.02+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	27	http://178.156.170.185:8055
951	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:07.027+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	28	http://178.156.170.185:8055
952	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:07.032+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
953	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:30.551+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	29	http://178.156.170.185:8055
954	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:30.555+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	30	http://178.156.170.185:8055
955	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:30.559+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	31	http://178.156.170.185:8055
956	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:30.562+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	32	http://178.156.170.185:8055
957	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:30.571+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	33	http://178.156.170.185:8055
958	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:30.576+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	34	http://178.156.170.185:8055
959	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:38:30.58+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
960	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:40:16.423+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	ae95c5f0-0e71-4987-b4d2-0f452447a6c5	http://178.156.170.185:8055
961	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:40:16.427+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	a92f6ea1-ee97-46cc-848e-635f14593901	http://178.156.170.185:8055
962	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:40:16.431+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
963	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:45:48.767+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
964	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:45:48.788+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	4b9c2a26-828b-4a29-92db-a4e714d6f484	http://178.156.170.185:8055
965	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:55:49.521+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
966	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:55:49.532+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	4b9c2a26-828b-4a29-92db-a4e714d6f484	http://178.156.170.185:8055
967	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:56:25.468+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
968	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:56:25.482+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
969	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:58:46.372+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	d50f18bb-e405-4a29-a69a-79ffd6586c66	http://178.156.170.185:8055
970	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 19:58:46.375+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
971	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:00:10.002+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
972	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:00:10.015+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	a92f6ea1-ee97-46cc-848e-635f14593901	http://178.156.170.185:8055
1111	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:16:16.137+00	172.27.0.2	axios/1.12.0	content_outputs	20	\N
973	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:00:10.027+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
974	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:04:41.407+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	a92f6ea1-ee97-46cc-848e-635f14593901	http://178.156.170.185:8055
975	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:04:41.411+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
976	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:05:44.412+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	7debc28d-5fbd-4742-8a2f-77dfc59b29c3	http://178.156.170.185:8055
977	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:05:44.415+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	http://178.156.170.185:8055
978	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:12:48.621+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	d80ee19f-598d-48f6-98e9-994edd627596	http://178.156.170.185:8055
979	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:16:48.602+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	9f0a6d28-2d14-4712-bbdf-6345ffaab41b	http://178.156.170.185:8055
980	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:16:48.605+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	d80ee19f-598d-48f6-98e9-994edd627596	http://178.156.170.185:8055
981	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:20:37.664+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
982	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:22:14.506+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	6e5376d8-86bb-43b2-8ca9-8750517b06eb	http://178.156.170.185:8055
983	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:22:14.512+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	b80270be-d6bd-404c-968e-c02920fc7176	http://178.156.170.185:8055
984	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:22:14.515+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	d80ee19f-598d-48f6-98e9-994edd627596	http://178.156.170.185:8055
985	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 20:24:46.988+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
986	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-10 21:14:10.678+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
987	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 01:23:46+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	320	http://178.156.170.185:8055
988	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 01:24:42.588+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	321	http://178.156.170.185:8055
989	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 01:25:56.776+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	322	http://178.156.170.185:8055
990	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 13:37:21.846+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	323	http://178.156.170.185:8055
991	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 13:38:17.454+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	324	http://178.156.170.185:8055
992	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 14:50:37.038+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	323	http://178.156.170.185:8055
993	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 14:52:10.926+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	325	http://178.156.170.185:8055
994	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 14:53:44.075+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	325	http://178.156.170.185:8055
995	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 14:57:17.932+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	326	http://178.156.170.185:8055
996	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 14:58:09.528+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	327	http://178.156.170.185:8055
997	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 14:59:58.485+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	327	http://178.156.170.185:8055
998	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:00:55.687+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	327	http://178.156.170.185:8055
999	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:16:15.089+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	324	http://178.156.170.185:8055
1000	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:16:28.129+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	326	http://178.156.170.185:8055
1001	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:23:11.293+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	324	http://178.156.170.185:8055
1002	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:25:16.588+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	328	http://178.156.170.185:8055
1003	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:32:36.355+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	326	http://178.156.170.185:8055
1004	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:33:44.488+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	328	http://178.156.170.185:8055
1005	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:40:00.714+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	sub_industries	129	http://178.156.170.185:8055
1006	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:40:00.718+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	content_requests	2	http://178.156.170.185:8055
1007	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:40:12.804+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	content_requests	2	http://178.156.170.185:8055
1008	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 15:42:26.094+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	content_requests	3	http://178.156.170.185:8055
1009	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 16:05:13.213+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	4299dc4a-2c97-4229-a451-146d207c7aeb	http://178.156.170.185:8055
1010	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 16:05:13.219+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
1011	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 18:03:12.756+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
1012	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 18:03:12.772+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
1013	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:00:21.148+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1014	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:01:10.955+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	a0e7dc05-0e0e-4c48-ac98-4bf154278e10	http://178.156.170.185:8055
1015	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:01:10.961+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	d80ee19f-598d-48f6-98e9-994edd627596	http://178.156.170.185:8055
1016	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:27:18.486+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	9860b111-c409-48c8-a521-1f48c53b21c1	http://178.156.170.185:8055
1017	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:27:18.49+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	http://178.156.170.185:8055
1018	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:27:18.496+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	http://178.156.170.185:8055
1019	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:35:01.091+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	4938d5ed-0183-433a-a184-5eb6797b1fcd	http://178.156.170.185:8055
1020	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:35:01.097+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	http://178.156.170.185:8055
1021	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:36:38.928+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	a181eebc-5563-462d-bbb9-bf3cdae69d39	http://178.156.170.185:8055
1022	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:36:38.931+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
1023	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:48:23.555+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	44ab486d-50d1-402f-91a3-798066e2777e	http://178.156.170.185:8055
1024	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:48:23.561+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	http://178.156.170.185:8055
1025	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:48:23.566+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	http://178.156.170.185:8055
1026	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 21:54:46.119+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	4b9c2a26-828b-4a29-92db-a4e714d6f484	http://178.156.170.185:8055
1027	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.187+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	35	http://178.156.170.185:8055
1028	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.192+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	36	http://178.156.170.185:8055
1029	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.194+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	37	http://178.156.170.185:8055
1030	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.198+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	38	http://178.156.170.185:8055
1031	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.202+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	39	http://178.156.170.185:8055
1112	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:16:23.808+00	172.27.0.2	axios/1.12.0	content_outputs	20	\N
1032	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.207+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	40	http://178.156.170.185:8055
1033	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.211+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	41	http://178.156.170.185:8055
1034	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.214+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	42	http://178.156.170.185:8055
1035	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.217+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1036	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.224+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	6655e9e9-38fd-4332-b566-4b93eeb5908a	http://178.156.170.185:8055
1037	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:03:07.228+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1038	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:04:47.467+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1039	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:05:14.938+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	http://178.156.170.185:8055
1040	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:58:08.866+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	4716c113-ef2d-4fe3-b45f-fd39560894c3	http://178.156.170.185:8055
1041	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:58:08.874+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	3083f9b8-f4cc-4384-b809-c5195d8b9c32	http://178.156.170.185:8055
1042	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:58:08.881+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	f09817eb-f7c7-430b-961d-7aac47fb93c3	http://178.156.170.185:8055
1043	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-11 23:58:08.886+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1044	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:52:03.176+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1045	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:52:03.186+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	6655e9e9-38fd-4332-b566-4b93eeb5908a	http://178.156.170.185:8055
1046	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:52:03.196+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1047	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:54:31.721+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	43	http://178.156.170.185:8055
1048	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:54:31.727+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	44	http://178.156.170.185:8055
1049	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:54:31.731+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	45	http://178.156.170.185:8055
1050	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:54:31.737+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	46	http://178.156.170.185:8055
1051	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:54:31.741+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	http://178.156.170.185:8055
1052	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:54:31.76+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	http://178.156.170.185:8055
1053	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:54:31.771+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1054	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.275+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	47	http://178.156.170.185:8055
1055	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.279+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	48	http://178.156.170.185:8055
1056	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.282+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	49	http://178.156.170.185:8055
1057	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.288+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	50	http://178.156.170.185:8055
1058	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.291+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	51	http://178.156.170.185:8055
1059	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.294+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	52	http://178.156.170.185:8055
1060	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.297+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	http://178.156.170.185:8055
1113	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:16:23.838+00	172.27.0.2	axios/1.12.0	content_requests	1	\N
1061	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.302+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	http://178.156.170.185:8055
1062	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:56:28.307+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1063	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:58:14.901+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	9f0a6d28-2d14-4712-bbdf-6345ffaab41b	http://178.156.170.185:8055
1064	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 00:58:14.907+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1065	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 04:20:07.257+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	53	http://178.156.170.185:8055
1066	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 04:20:07.265+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	54	http://178.156.170.185:8055
1067	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 04:20:07.277+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	55	http://178.156.170.185:8055
1068	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 04:20:07.281+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	http://178.156.170.185:8055
1069	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 04:20:07.292+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	http://178.156.170.185:8055
1070	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 04:20:07.3+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1071	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 16:50:03.874+00	172.27.0.2	axios/1.12.0	content_outputs	1	\N
1072	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-12 19:02:17.424+00	172.27.0.2	axios/1.12.0	content_outputs	2	\N
1073	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-13 03:42:47.451+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	http://178.156.170.185:8055
1074	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 16:23:01.202+00	172.27.0.2	axios/1.12.0	content_outputs	3	\N
1075	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 22:02:27.729+00	172.27.0.2	axios/1.12.0	content_outputs	4	\N
1076	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 22:07:53.642+00	172.27.0.2	axios/1.12.0	content_outputs	5	\N
1077	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 22:14:59.233+00	172.27.0.2	axios/1.12.0	content_outputs	6	\N
1078	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 22:15:48.701+00	172.27.0.2	axios/1.12.0	content_outputs	7	\N
1079	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 22:33:43.994+00	172.27.0.2	axios/1.12.0	content_outputs	8	\N
1080	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 22:51:24.423+00	172.27.0.2	axios/1.12.0	content_outputs	9	\N
1081	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:11:18.441+00	172.27.0.2	axios/1.12.0	content_outputs	10	\N
1082	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:18:07.578+00	172.27.0.2	axios/1.12.0	content_outputs	11	\N
1083	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:20:17.593+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	56	http://178.156.170.185:8055
1084	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:20:17.607+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	35	http://178.156.170.185:8055
1085	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:20:17.62+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	36	http://178.156.170.185:8055
1086	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:20:17.631+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1087	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:20:28.16+00	172.27.0.2	axios/1.12.0	content_outputs	12	\N
1088	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:24:37.593+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	56	http://178.156.170.185:8055
1089	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:24:37.595+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1090	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:25:00.769+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	57	http://178.156.170.185:8055
1091	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:25:00.778+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1092	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:25:18.552+00	172.27.0.2	axios/1.12.0	content_outputs	13	\N
1093	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:28:39.878+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	57	http://178.156.170.185:8055
1094	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-14 23:28:39.881+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	http://178.156.170.185:8055
1095	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:07:21.231+00	172.27.0.2	axios/1.12.0	content_outputs	14	\N
1096	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:07:26.885+00	172.27.0.2	axios/1.12.0	content_outputs	14	\N
1097	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:19:23.968+00	172.27.0.2	axios/1.12.0	content_outputs	15	\N
1098	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:19:31.828+00	172.27.0.2	axios/1.12.0	content_outputs	15	\N
1099	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:43:12.974+00	172.27.0.2	axios/1.12.0	content_outputs	16	\N
1100	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 13:43:24.468+00	172.27.0.2	axios/1.12.0	content_outputs	16	\N
1114	create	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:23:34.786+00	172.27.0.2	axios/1.12.0	content_outputs	21	\N
1115	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:23:40.498+00	172.27.0.2	axios/1.12.0	content_outputs	21	\N
1116	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-15 14:23:40.516+00	172.27.0.2	axios/1.12.0	content_requests	1	\N
1117	login	c4258964-625f-40b1-9637-adbebae4ea87	2025-12-25 02:18:09.153+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	c4258964-625f-40b1-9637-adbebae4ea87	https://admin.leads2scale.com
1118	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-25 02:20:31.798+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1119	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-25 02:38:26.594+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1120	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-25 09:32:43.436+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1121	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-25 23:45:54.788+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1122	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-26 13:02:22.386+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1123	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-27 01:06:29.953+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1124	update	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-27 01:07:17.776+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_settings	1	https://admin.leads2scale.com
1125	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-27 01:39:54.169+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1126	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-28 03:11:21.339+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1127	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-28 04:10:52.335+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1128	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-28 04:12:38.77+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1129	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-28 04:27:50.443+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1130	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-28 17:55:21.021+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1131	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 00:37:27.492+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1132	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 00:41:40.548+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1133	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 00:52:39.138+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1134	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 04:45:44.942+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1135	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 14:34:08.421+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1136	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 16:33:42.455+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1137	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 17:10:46.757+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1138	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-29 20:07:28.629+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1139	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-30 01:05:26.26+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1140	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-30 03:15:46.708+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1141	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-30 03:16:21.61+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1142	login	24f7d0fe-8079-4470-a550-625130a01a4c	2025-12-30 19:47:52.476+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1143	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-02 15:49:22.913+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1144	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-02 15:57:25.909+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1145	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-03 03:31:55.564+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1146	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-03 03:32:47.905+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1147	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-05 04:04:43.389+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1148	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-06 00:00:31.823+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Avast/143.0.0.0	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1149	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-06 00:02:50.067+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1150	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-07 20:25:53.894+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1151	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-12 23:00:21.897+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1152	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:17:08.687+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	329	https://admin.leads2scale.com
1153	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:17:08.719+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	niche_snapshots	https://admin.leads2scale.com
1154	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:17:59.889+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	330	https://admin.leads2scale.com
1155	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:22:12.834+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	331	https://admin.leads2scale.com
1156	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:24:14.387+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	332	https://admin.leads2scale.com
1157	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:24:55.106+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	333	https://admin.leads2scale.com
1158	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:26:40.804+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	334	https://admin.leads2scale.com
1159	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:33:22.121+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	niche_snapshots	1	https://admin.leads2scale.com
1160	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:36:04.328+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	niche_snapshots	2	https://admin.leads2scale.com
1161	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:38:27.608+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	niche_snapshots	3	https://admin.leads2scale.com
1162	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:40:03.596+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	niche_snapshots	4	https://admin.leads2scale.com
1163	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:41:49.211+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	niche_snapshots	5	https://admin.leads2scale.com
1164	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:43:09.702+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	niche_snapshots	6	https://admin.leads2scale.com
1165	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:50:18.367+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	335	https://admin.leads2scale.com
1166	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:50:18.374+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	ar_tenants	https://admin.leads2scale.com
1167	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:51:05.554+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	ar_tenants	https://admin.leads2scale.com
1168	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:51:26.632+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	336	https://admin.leads2scale.com
1169	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:51:26.644+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	AR_Tenants	https://admin.leads2scale.com
1170	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:52:14.008+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	337	https://admin.leads2scale.com
1171	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 21:53:18.851+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	AR_Tenants	https://admin.leads2scale.com
1172	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:05:05.38+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	338	https://admin.leads2scale.com
1173	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:08:05.831+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	339	https://admin.leads2scale.com
1174	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:08:51.868+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	340	https://admin.leads2scale.com
1178	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:08:52.488+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	343	https://admin.leads2scale.com
1175	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:08:52.103+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	341	https://admin.leads2scale.com
1176	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:08:52.111+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	AR_Tenants_niche_snapshots	https://admin.leads2scale.com
1177	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:08:52.253+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	342	https://admin.leads2scale.com
1179	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:22:38.372+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	344	https://admin.leads2scale.com
1180	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:23:19.216+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	344	https://admin.leads2scale.com
1181	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-13 22:24:19.731+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	AR_Tenants	3	https://admin.leads2scale.com
1182	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-14 21:40:49.964+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	345	https://admin.leads2scale.com
1183	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-14 21:40:49.976+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	knowledge_base	https://admin.leads2scale.com
1184	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-14 21:41:44.165+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	346	https://admin.leads2scale.com
1185	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-14 21:44:56.849+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	347	https://admin.leads2scale.com
1186	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-14 21:47:15.989+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	348	https://admin.leads2scale.com
1187	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-14 21:48:28.173+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	349	https://admin.leads2scale.com
1188	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 01:26:07.596+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	350	https://admin.leads2scale.com
1189	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 01:36:22.689+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	9cd453a7-7947-4d4b-93f6-1793516ac714	https://admin.leads2scale.com
1190	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 01:53:00.594+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	351	https://admin.leads2scale.com
1191	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:06:32.73+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	AR_Tenants	4	https://admin.leads2scale.com
1192	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:07:36.793+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	8ae7743b-988d-4af8-9277-0d517c488536	https://admin.leads2scale.com
1193	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:09:39.665+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1194	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:10:47.926+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1195	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:39:47.627+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	11279d9f-cab5-4ee1-89ef-11374d4e0aff	https://admin.leads2scale.com
1196	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:39:50.533+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1197	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:53:04.968+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	directus_access	https://admin.leads2scale.com
1198	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:06:21.678+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1199	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:07:12.186+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1200	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:12:03.652+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	5f94ca76-79e5-4be5-a27a-c71f1eddf58d	https://admin.leads2scale.com
1201	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:12:03.664+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1202	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:12:32.469+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	8de88b1e-ab7d-4c2b-a4f6-734ec8d34718	https://admin.leads2scale.com
1203	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:12:34.595+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1204	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:13:19.273+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	05dda9a8-9faa-4a83-bc1e-5915e54c0447	https://admin.leads2scale.com
1205	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:13:22.154+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1206	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:15:07.201+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	9f58a73c-b1c3-4ffa-910f-d92ef2766146	https://admin.leads2scale.com
1207	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:15:09.248+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1208	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:17:02.327+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	6a1c20a9-5888-40b7-a1cc-0da1f7d1bf96	https://admin.leads2scale.com
1209	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:17:05.151+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1210	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:26:30.829+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	5f94ca76-79e5-4be5-a27a-c71f1eddf58d	https://admin.leads2scale.com
1211	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:26:30.856+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1212	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:26:45.314+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	bc6c4813-d468-4daa-bc85-5e32d2954d37	https://admin.leads2scale.com
1213	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:26:47.911+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1214	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:27:22.515+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	1778fb7b-3ff9-42c6-a76e-abb6c46d52ff	https://admin.leads2scale.com
1215	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:27:24.919+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1216	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:31:28.489+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_operations	5f94ca76-79e5-4be5-a27a-c71f1eddf58d	https://admin.leads2scale.com
1217	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:31:28.503+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1218	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:31:53.057+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	97f4041f-0490-43f1-8c19-841c7f66b808	https://admin.leads2scale.com
1219	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:31:59.123+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1220	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:33:40.274+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	d030e03d-9e5b-4802-8d25-bf22e3f02fd4	https://admin.leads2scale.com
1221	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:33:44.013+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1222	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:36:15.199+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	aeb48deb-c3f3-415b-bbde-cf76ec09b33e	https://admin.leads2scale.com
1223	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:36:17.919+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1224	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:42:37.632+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	06100c92-5458-41fa-9435-80eb85ed51e0	https://admin.leads2scale.com
1225	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:42:39.666+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1226	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:48:56.788+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	fe28671c-d860-47e4-8e6f-032cc0b3ed4d	https://admin.leads2scale.com
1227	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:48:59.182+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1228	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:51:54.152+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	103b75f8-8202-4586-b07e-58388f59481b	https://admin.leads2scale.com
1229	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:52:11.016+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1230	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 14:00:59.467+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	abd6964c-6a3f-4410-a020-eaac0b95fe5a	https://admin.leads2scale.com
1231	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 14:01:03.655+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1232	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 14:19:10.578+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	d82e7254-6957-4e90-a43b-63f9cb19b0e9	https://admin.leads2scale.com
1233	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 14:19:13.725+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1234	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 21:00:31.528+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_files	225dbb86-c988-4a2e-b7ec-4913d745fd01	https://admin.leads2scale.com
1235	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 21:00:37.944+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1236	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 21:45:37.303+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	703dc4b9-79a5-4753-96da-1b1c011129d1	https://admin.leads2scale.com
1237	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 23:46:07.465+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	ff77a93a-9b03-45bb-b63d-02941f15df77	https://admin.leads2scale.com
1238	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 23:47:54.983+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	703dc4b9-79a5-4753-96da-1b1c011129d1	https://admin.leads2scale.com
1239	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 00:04:03.845+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	ff77a93a-9b03-45bb-b63d-02941f15df77	https://admin.leads2scale.com
1240	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 00:04:31.724+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	9f494a38-b0ea-4ea9-a868-995fb98cf7b0	https://admin.leads2scale.com
1241	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 00:04:39.721+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	cd559838-f6d2-40fd-8e40-463fbe6b47f9	https://admin.leads2scale.com
1242	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 00:04:57.875+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	c4acd64d-6915-49a6-bbc2-5fdab3bd407b	https://admin.leads2scale.com
1243	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 00:05:22.06+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	9f494a38-b0ea-4ea9-a868-995fb98cf7b0	https://admin.leads2scale.com
1244	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 00:05:26.522+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	cd559838-f6d2-40fd-8e40-463fbe6b47f9	https://admin.leads2scale.com
1245	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 00:10:18.897+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	985a9afa-a39b-4b34-9dbf-18a8d7ba216a	https://admin.leads2scale.com
1246	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 18:17:29.114+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1247	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-16 18:46:28.866+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1266	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:58:46.717+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	bf970007-d005-407c-a1e6-399bba718004	https://admin.leads2scale.com
1282	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:35:22.333+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	d80ee19f-598d-48f6-98e9-994edd627596	https://admin.leads2scale.com
1301	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 20:05:29.509+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	349	https://admin.leads2scale.com
1302	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 20:16:24.955+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	349	https://admin.leads2scale.com
1248	login	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:17:44.679+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	https://admin.leads2scale.com
1267	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:26:21.977+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	985a9afa-a39b-4b34-9dbf-18a8d7ba216a	https://admin.leads2scale.com
1268	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:26:21.978+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	280a3e38-bd6d-41d2-a260-593c2d615d27	https://admin.leads2scale.com
1269	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:26:21.981+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	https://admin.leads2scale.com
1283	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:28:39.87+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	361	https://admin.leads2scale.com
1284	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:30:27.082+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	362	https://admin.leads2scale.com
1285	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:30:55.326+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	363	https://admin.leads2scale.com
1286	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:31:27.851+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	364	https://admin.leads2scale.com
1249	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:27:15.603+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	352	https://admin.leads2scale.com
1250	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:27:15.612+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	ai_calls	https://admin.leads2scale.com
1270	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:22.578+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	44ab486d-50d1-402f-91a3-798066e2777e	https://admin.leads2scale.com
1271	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:22.581+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	a551b288-3e2d-4815-8ff3-c3a228d9fc78	https://admin.leads2scale.com
1272	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:22.601+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	85bf971e-6a2f-4ac8-8e78-32069eb6667e	https://admin.leads2scale.com
1287	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:38:13.845+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	349	https://admin.leads2scale.com
1288	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:39:39.689+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	349	https://admin.leads2scale.com
1251	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:27:39.383+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	353	https://admin.leads2scale.com
1252	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:28:06.644+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	354	https://admin.leads2scale.com
1253	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:28:32.903+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	355	https://admin.leads2scale.com
1254	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:29:15.171+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	356	https://admin.leads2scale.com
1255	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:30:14.346+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	357	https://admin.leads2scale.com
1256	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:30:43.015+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	358	https://admin.leads2scale.com
1273	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:30.741+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	c4acd64d-6915-49a6-bbc2-5fdab3bd407b	https://admin.leads2scale.com
1289	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:46:14.082+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	2	https://admin.leads2scale.com
1290	run	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:46:14.238+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1291	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:46:44.512+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	365	https://admin.leads2scale.com
1295	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:51:56.076+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1257	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:33:43.517+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	985a9afa-a39b-4b34-9dbf-18a8d7ba216a	https://admin.leads2scale.com
1258	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:36:43.652+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_users	985a9afa-a39b-4b34-9dbf-18a8d7ba216a	https://admin.leads2scale.com
1274	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:41.164+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	4299dc4a-2c97-4229-a451-146d207c7aeb	https://admin.leads2scale.com
1275	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:41.165+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	4716c113-ef2d-4fe3-b45f-fd39560894c3	https://admin.leads2scale.com
1276	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:41.166+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	6e5376d8-86bb-43b2-8ca9-8750517b06eb	https://admin.leads2scale.com
1277	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:41.166+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_access	7debc28d-5fbd-4742-8a2f-77dfc59b29c3	https://admin.leads2scale.com
1278	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:27:41.173+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	https://admin.leads2scale.com
1292	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:48:48.929+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	1	https://admin.leads2scale.com
1293	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:50:39.302+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	3	https://admin.leads2scale.com
1294	run	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:50:39.359+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1259	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:44:31.152+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_permissions	58	https://admin.leads2scale.com
1260	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:44:31.161+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	https://admin.leads2scale.com
1279	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:29:16.925+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	https://admin.leads2scale.com
1296	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:55:11.712+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	4	https://admin.leads2scale.com
1297	run	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:55:11.756+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	https://admin.leads2scale.com
1261	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:44:49.097+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	359	https://admin.leads2scale.com
1262	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:44:49.102+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	created_at	https://admin.leads2scale.com
1263	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:45:03.113+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_collections	created_at	https://admin.leads2scale.com
1264	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:45:03.117+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	359	https://admin.leads2scale.com
1265	create	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 17:45:28.09+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	360	https://admin.leads2scale.com
1280	delete	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:29:29.94+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	https://admin.leads2scale.com
1281	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:35:13.798+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	https://admin.leads2scale.com
1298	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:57:31.795+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	4	https://admin.leads2scale.com
1299	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 19:59:04.193+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	knowledge_base	3	https://admin.leads2scale.com
1300	update	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 20:03:21.018+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	directus_fields	349	https://admin.leads2scale.com
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
topics	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	23	\N	open	\N	f
viral_patterns	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	24	\N	open	\N	f
trend_topics	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	25	\N	open	\N	f
writing_personas	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	26	\N	open	\N	f
sub_industries	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
industries	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
niche_snapshots	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
AR_Tenants	\N	AI Receptionist Tenants	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
AR_Tenants_niche_snapshots	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
knowledge_base	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
directus_access	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
audience_profiles	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	\N	open	\N	f
banned_phrases	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	\N	open	\N	f
business_intel_reports	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	3	\N	open	\N	f
content_outputs	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	\N	open	\N	f
content_requests	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	5	\N	open	\N	f
content_silos	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	6	\N	open	\N	f
experience_snippets	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	7	\N	open	\N	f
fact_candidates	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	8	\N	open	\N	f
image_assets	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	10	\N	open	\N	f
intel_debug	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	11	\N	open	\N	f
intel_provenance	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	12	\N	open	\N	f
kb_chunks	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	13	\N	open	\N	f
kb_documents	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	14	\N	open	\N	f
keyword_opportunities	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	15	\N	open	\N	f
learning_queue	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	16	\N	open	\N	f
seo_audit	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	17	\N	open	\N	f
seo_enrichment	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	18	\N	open	\N	f
silo_nodes	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	19	\N	open	\N	f
target_cities	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	21	\N	open	\N	f
target_services	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	22	\N	open	\N	f
ai_calls	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message, searchable) FROM stdin;
74	seo_enrichment	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
75	seo_enrichment	business	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
76	seo_enrichment	summary_short	\N	input-multiline	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
77	seo_enrichment	summary_long	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
78	seo_enrichment	keywords	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
79	seo_enrichment	servicePageIntro	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
80	seo_enrichment	servicePageDetails	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
81	seo_enrichment	localLandingPageIntro	\N	input-multiline	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
82	seo_enrichment	categoryLandingPageIntro	\N	input-multiline	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
83	seo_enrichment	cityLandingKeywords	\N	input-multiline	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
84	seo_enrichment	spokenAnswerSnippet	\N	input-multiline	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
85	seo_enrichment	conversationalFAQ	\N	input-multiline	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
86	seo_enrichment	voiceKeywords	\N	input-multiline	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N	t
87	seo_enrichment	localVoiceSnippet	\N	input-multiline	\N	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N	t
7	seo_audit	contentScore	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
8	seo_audit	performanceScore	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
9	seo_audit	localSeoScore	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
10	seo_audit	technicalScore	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
11	seo_audit	overallScore	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
12	seo_audit	entityClarityScore	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
13	seo_audit	aiFactScore	\N	input	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
14	seo_audit	informationCompletenessScore	\N	input	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
15	seo_audit	adwordsOpportunityScore	\N	input	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N	t
16	seo_audit	localRankOpportunityScore	\N	input	\N	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N	t
17	seo_audit	voiceScore	\N	input	\N	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N	t
18	seo_audit	aiVisibilityScore	\N	input	\N	\N	\N	f	f	16	full	\N	\N	\N	f	\N	\N	\N	t
19	seo_audit	aiContentCompletenessScore	\N	input	\N	\N	\N	f	f	17	full	\N	\N	\N	f	\N	\N	\N	t
20	seo_audit	missingAIDataPoints	\N	input	\N	\N	\N	f	f	18	full	\N	\N	\N	f	\N	\N	\N	t
21	seo_audit	entityConfusionRisk	\N	input	\N	\N	\N	f	f	19	full	\N	\N	\N	f	\N	\N	\N	t
22	seo_audit	valueIntentValueScore	\N	input	\N	\N	\N	f	f	20	full	\N	\N	\N	f	\N	\N	\N	t
23	seo_audit	localSearchOpportunityScore	\N	input	\N	\N	\N	f	f	21	full	\N	\N	\N	f	\N	\N	\N	t
24	seo_audit	nearMeRankingScore	\N	input	\N	\N	\N	f	f	22	full	\N	\N	\N	f	\N	\N	\N	t
25	seo_audit	dealOpportunityScore	\N	input	\N	\N	\N	f	f	23	full	\N	\N	\N	f	\N	\N	\N	t
26	seo_audit	multiModalOpportunityScore	\N	input	\N	\N	\N	f	f	25	full	\N	\N	\N	f	\N	\N	\N	t
27	seo_audit	hasMetaTitle	cast-boolean	\N	\N	\N	\N	f	f	26	full	\N	\N	\N	f	\N	\N	\N	t
28	seo_audit	hasMetaDescription	cast-boolean	\N	\N	\N	\N	f	f	27	full	\N	\N	\N	f	\N	\N	\N	t
29	seo_audit	hasOgTags	cast-boolean	\N	\N	\N	\N	f	f	28	full	\N	\N	\N	f	\N	\N	\N	t
30	seo_audit	hasTwitterCards	cast-boolean	\N	\N	\N	\N	f	f	29	full	\N	\N	\N	f	\N	\N	\N	t
31	seo_audit	hasSchemaLD	cast-boolean	\N	\N	\N	\N	f	f	30	full	\N	\N	\N	f	\N	\N	\N	t
32	seo_audit	hasRobotsTXT	cast-boolean	\N	\N	\N	\N	f	f	31	full	\N	\N	\N	f	\N	\N	\N	t
33	seo_audit	hasSiteMap	cast-boolean	\N	\N	\N	\N	f	f	32	full	\N	\N	\N	f	\N	\N	\N	t
34	seo_audit	hasSSL	cast-boolean	\N	\N	\N	\N	f	f	33	full	\N	\N	\N	f	\N	\N	\N	t
35	seo_audit	hasMobileFriendly	cast-boolean	\N	\N	\N	\N	f	f	34	full	\N	\N	\N	f	\N	\N	\N	t
36	seo_audit	hasAltTags	cast-boolean	\N	\N	\N	\N	f	f	35	full	\N	\N	\N	f	\N	\N	\N	t
37	seo_audit	hasH1H2Structure	cast-boolean	\N	\N	\N	\N	f	f	36	full	\N	\N	\N	f	\N	\N	\N	t
38	seo_audit	missingPages	cast-boolean	\N	\N	\N	\N	f	f	37	full	\N	\N	\N	f	\N	\N	\N	t
40	seo_audit	missingImageAltTags	cast-boolean	\N	\N	\N	\N	f	f	39	full	\N	\N	\N	f	\N	\N	\N	t
41	seo_audit	missingVideoContent	cast-boolean	\N	\N	\N	\N	f	f	40	full	\N	\N	\N	f	\N	\N	\N	t
42	seo_audit	missingAudioContent	cast-boolean	\N	\N	\N	\N	f	f	41	full	\N	\N	\N	f	\N	\N	\N	t
43	seo_audit	wordCount	\N	input	\N	\N	\N	f	f	42	full	\N	\N	\N	f	\N	\N	\N	t
44	seo_audit	imageCount	\N	input	\N	\N	\N	f	f	43	full	\N	\N	\N	f	\N	\N	\N	t
45	seo_audit	brokenLinks	\N	\N	\N	\N	\N	f	f	44	full	\N	\N	\N	f	\N	\N	\N	t
46	seo_audit	internalLinks	\N	input	\N	\N	\N	f	f	45	full	\N	\N	\N	f	\N	\N	\N	t
47	seo_audit	externalLinks	\N	input	\N	\N	\N	f	f	46	full	\N	\N	\N	f	\N	\N	\N	t
48	seo_audit	primaryKeyword	\N	input-multiline	\N	\N	\N	f	f	47	full	\N	\N	\N	f	\N	\N	\N	t
49	seo_audit	missingKeywordOpportunities	\N	input-multiline	\N	\N	\N	f	f	48	full	\N	\N	\N	f	\N	\N	\N	t
50	seo_audit	opportunitySummary	\N	input-multiline	\N	\N	\N	f	f	49	full	\N	\N	\N	f	\N	\N	\N	t
51	seo_audit	cityKeywordGaps	\N	input-multiline	\N	\N	\N	f	f	50	full	\N	\N	\N	f	\N	\N	\N	t
52	seo_audit	rawMetrics	\N	input-multiline	\N	\N	\N	f	f	51	full	\N	\N	\N	f	\N	\N	\N	t
53	seo_audit	rawContentScan	\N	input-multiline	\N	\N	\N	f	f	52	full	\N	\N	\N	f	\N	\N	\N	t
54	seo_audit	relatedServicePages	\N	input-multiline	\N	\N	\N	f	f	53	full	\N	\N	\N	f	\N	\N	\N	t
55	seo_audit	relatedCityPages	\N	input-multiline	\N	\N	\N	f	f	54	full	\N	\N	\N	f	\N	\N	\N	t
56	seo_audit	internalLinkOpportunities	\N	input-multiline	\N	\N	\N	f	f	55	full	\N	\N	\N	f	\N	\N	\N	t
57	seo_audit	conversionOpportunitySummary	\N	input-multiline	\N	\N	\N	f	f	56	full	\N	\N	\N	f	\N	\N	\N	t
58	seo_audit	buyerIntenKeywords	\N	input	\N	\N	\N	f	f	57	full	\N	\N	\N	f	\N	\N	\N	t
59	seo_audit	nearMeKeywords	\N	input	\N	\N	\N	f	f	58	full	\N	\N	\N	f	\N	\N	\N	t
60	seo_audit	openNowKeywords	\N	input	\N	\N	\N	f	f	59	full	\N	\N	\N	f	\N	\N	\N	t
61	seo_audit	localDiscountKeywords	\N	input	\N	\N	\N	f	f	60	full	\N	\N	\N	f	\N	\N	\N	t
62	seo_audit	serviceIntentKeywords	\N	input	\N	\N	\N	f	f	61	full	\N	\N	\N	f	\N	\N	\N	t
63	seo_audit	neighborhoodKeywords	\N	input	\N	\N	\N	f	f	62	full	\N	\N	\N	f	\N	\N	\N	t
64	seo_audit	cityIntentGaps	\N	input	\N	\N	\N	f	f	63	full	\N	\N	\N	f	\N	\N	\N	t
66	seo_audit	localCompetitionGap	\N	input	\N	\N	\N	f	f	65	full	\N	\N	\N	f	\N	\N	\N	t
67	seo_audit	categoryKeywords	\N	input	\N	\N	\N	f	f	66	full	\N	\N	\N	f	\N	\N	\N	t
68	seo_audit	dealIntentKeywords	\N	input	\N	\N	\N	f	f	67	full	\N	\N	\N	f	\N	\N	\N	t
69	seo_audit	recommendedImagePrompts	\N	input-multiline	\N	\N	\N	f	f	68	full	\N	\N	\N	f	\N	\N	\N	t
71	seo_audit	recommendedAudioTopics	\N	input-multiline	\N	\N	\N	f	f	69	full	\N	\N	\N	f	\N	\N	\N	t
72	seo_audit	recommendedVideoTopics	\N	input-multiline	\N	\N	\N	f	f	70	full	\N	\N	\N	f	\N	\N	\N	t
1	seo_audit	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
4	seo_audit	domain	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
5	seo_audit	auditDate	\N	datetime	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
88	seo_enrichment	aiOverviewSnippet	\N	input-multiline	\N	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N	t
89	seo_enrichment	aiLocalRecommendationSnippet	\N	input-multiline	\N	\N	\N	f	f	16	full	\N	\N	\N	f	\N	\N	\N	t
90	seo_enrichment	aiServiceExplanation	\N	input-multiline	\N	\N	\N	f	f	17	full	\N	\N	\N	f	\N	\N	\N	t
91	seo_enrichment	aiComparisonSnippet	\N	input-multiline	\N	\N	\N	f	f	18	full	\N	\N	\N	f	\N	\N	\N	t
92	seo_enrichment	schemaEntitySummary	\N	input-multiline	\N	\N	\N	f	f	19	full	\N	\N	\N	f	\N	\N	\N	t
93	seo_enrichment	aiQuestionAnswerPairs	\N	input-multiline	\N	\N	\N	f	f	20	full	\N	\N	\N	f	\N	\N	\N	t
94	seo_enrichment	structuredAnswerBlocks	\N	input-multiline	\N	\N	\N	f	f	21	full	\N	\N	\N	f	\N	\N	\N	t
95	seo_enrichment	aiFriendlyFacts	\N	input-multiline	\N	\N	\N	f	f	22	full	\N	\N	\N	f	\N	\N	\N	t
96	seo_enrichment	nearMeSnippet	\N	input-multiline	\N	\N	\N	f	f	23	full	\N	\N	\N	f	\N	\N	\N	t
97	seo_enrichment	buyerIntentSnippet	\N	input-multiline	\N	\N	\N	f	f	24	full	\N	\N	\N	f	\N	\N	\N	t
98	intel_debug	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
99	intel_debug	sourceUrl	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
100	intel_debug	businessWebsiteRoot	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
101	intel_debug	rawPayload	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
102	intel_debug	createAt	\N	datetime	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
103	intel_debug	business	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
104	intel_provenance	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
105	intel_provenance	business	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
106	intel_provenance	field_name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
107	intel_provenance	value	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
108	intel_provenance	source	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
109	intel_provenance	confidence	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
110	intel_provenance	raw_input	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
111	intel_provenance	last_verified	\N	datetime	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
112	kb_chunks	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
113	kb_chunks	doc_id	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
114	kb_chunks	niche_slug	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
115	kb_chunks	chunk_test	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
116	kb_chunks	embedding	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
117	kb_documents	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
118	kb_documents	title	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
119	kb_documents	niche_slug	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
120	kb_documents	city_slug	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
121	kb_documents	source_type	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
122	kb_documents	source_url	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
123	kb_documents	tags	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
124	kb_documents	raw_text	\N	input-multiline	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
125	kb_documents	visibility	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
126	kb_documents	checksum	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
127	learning_queue	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
128	learning_queue	created_at	\N	datetime	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
129	learning_queue	niche_slug	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
130	learning_queue	question	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
131	learning_queue	proposed_answer	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
132	learning_queue	evidence_chunks	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
133	learning_queue	status	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
158	content_requests	topic	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
159	content_requests	primary_keyword	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
160	content_requests	location	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
162	content_requests	source	\N	select-dropdown	{"choices":[{"text":"manual","value":"manual"},{"text":"trend_monitor","value":"trend_monitor"},{"text":"api","value":"api"},{"text":"feed","value":"feed"}]}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
163	content_requests	auto_published	cast-boolean	\N	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
164	content_requests	style	cast-json	\N	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
165	content_requests	created_at	\N	datetime	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
134	seo_audit	business	\N	input	\N	\N	\N	f	f	24	full	\N	\N	\N	f	\N	\N	\N	t
39	seo_audit	missingSocialProfile	cast-boolean	\N	\N	\N	\N	f	f	38	full	\N	\N	\N	f	\N	\N	\N	t
65	seo_audit	geoCoverageGaps	\N	input	\N	\N	\N	f	f	64	full	\N	\N	\N	f	\N	\N	\N	t
135	seo_audit	metaScore	\N	input	\N	\N	\N	f	f	71	full	\N	\N	\N	f	\N	\N	\N	t
136	business_intel_reports	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
137	business_intel_reports	primary_keyword	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
138	business_intel_reports	location	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
139	business_intel_reports	engine	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
140	business_intel_reports	payload	cast-json	\N	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
141	business_intel_reports	summary	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
142	business_intel_reports	sentiment_score	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
143	target_cities	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
144	target_cities	city_name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
145	target_cities	state	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
146	target_services	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
147	keyword_opportunities	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
148	target_services	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
149	target_services	category	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
150	keyword_opportunities	keyword	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
151	keyword_opportunities	volume	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
152	keyword_opportunities	difficulty	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
153	keyword_opportunities	opportunity_score	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
154	keyword_opportunities	status	\N	select-dropdown	{"choices":[{"text":"New","value":"New"},{"text":"Content Created","value":"Content Created"},{"text":"Published","value":"Published"}]}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
155	target_cities	status	\N	select-dropdown	{"choices":[{"text":"Active","value":"Active"},{"text":"Inactive","value":"Inactive"}]}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
156	content_requests	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
157	content_requests	status	\N	select-dropdown	{"choices":[{"text":"pending","value":"pending"},{"text":"researching","value":"researching"},{"text":"drafting","value":"drafting"},{"text":"humanizing","value":"humanizing"},{"text":"imagery","value":"imagery"},{"text":"shortform","value":"shortform"},{"text":"ready","value":"ready"},{"text":"publishing","value":"publishing"},{"text":"published","value":"published"},{"text":"failed","value":"failed"}]}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
166	content_requests	updated_at	\N	datetime	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
167	content_outputs	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
168	content_outputs	request_id	m2o	\N	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
169	content_outputs	title	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
170	content_outputs	slug	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
171	content_outputs	meta_title	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
172	content_outputs	meta_description	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
173	content_outputs	summary	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
174	content_outputs	outline_markdown	\N	input-rich-text-md	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
175	content_outputs	body_markdown	\N	input-rich-text-md	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
176	content_outputs	seo_score	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
177	content_outputs	body_html	\N	input-code	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
178	content_outputs	published_url	\N	input	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
179	content_outputs	schema_json	cast-json	\N	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N	t
180	content_outputs	faqs	cast-json	\N	\N	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N	t
181	content_outputs	short_form_snippets	cast-json	\N	\N	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N	t
182	writing_personas	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
183	writing_personas	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
184	writing_personas	description	\N	input-multiline	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
185	writing_personas	style_notes	\N	input-rich-text-md	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
186	writing_personas	default_industries	cast-json	\N	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
187	writing_personas	active	cast-boolean	\N	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
188	audience_profiles	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
189	audience_profiles	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
190	audience_profiles	age_range	\N	input	{"placeholder":"e.g., \\"35-60\\", \\"65+\\""}	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
192	audience_profiles	pain_points	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
193	audience_profiles	goals	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
194	audience_profiles	notes	\N	input-rich-text-md	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
195	audience_profiles	industries	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
196	audience_profiles	sources	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
197	audience_profiles	trend_score	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
199	audience_profiles	meta	cast-json	\N	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
200	content_requests	forget_audience	m2o	\N	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
201	content_requests	style_persona_id	m2o	\N	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N	t
202	image_assets	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
205	image_assets	title	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
210	image_assets	url	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
211	image_assets	alt_text	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
212	image_assets	caption	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
213	image_assets	filename	\N	input	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
214	image_assets	license_info	\N	input	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
215	image_assets	meta	cast-json	\N	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N	t
216	image_assets	created_at	\N	datetime	\N	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N	t
218	content_silos	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
219	content_silos	silo_id	uuid	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
220	content_silos	name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
221	content_silos	industry	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
222	content_silos	root_topic	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
223	content_silos	site_id	uuid	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
224	content_silos	created_at	\N	datetime	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
233	viral_patterns	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
234	viral_patterns	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
235	viral_patterns	description	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
236	viral_patterns	prompt_template	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
237	viral_patterns	content_type	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
238	viral_patterns	industry_scope	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
239	silo_nodes	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
240	silo_nodes	silo_id	uuid	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
242	silo_nodes	title	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
243	silo_nodes	target_keyword	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
244	silo_nodes	parent_node_id	uuid	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
245	silo_nodes	content_request_id	uuid	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
247	silo_nodes	topic_id	uuid	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
248	fact_candidates	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
249	fact_candidates	request_id	uuid	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
250	fact_candidates	source_url	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
251	fact_candidates	fact_text	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
253	fact_candidates	type	\N	select-dropdown	{"choices":[{"text":"law","value":"law"},{"text":"regulation","value":"regulation"},{"text":"case","value":"case"},{"text":"statistic","value":"statistic"},{"text":"study","value":"study"},{"text":"definition","value":"definition"},{"text":"medical_finding","value":"medical_finding"},{"text":"quote","value":"quote"}]}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
254	fact_candidates	source_authority	\N	select-dropdown	{"choices":[{"text":"gov","value":"gov"},{"text":"edu","value":"edu"},{"text":"peer_review","value":"peer_review"},{"text":"legal_ruling","value":"legal_ruling"},{"text":"trusted_org","value":"trusted_org"}]}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
255	fact_candidates	jurisdiction	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
256	fact_candidates	study_year	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
257	fact_candidates	published_at	\N	datetime	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
258	fact_candidates	meta	cast-json	\N	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
269	topics	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
270	topics	sub_industry_id	uuid	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
271	topics	topic_name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
272	topics	keyword_root	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
273	topics	description	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
274	topics	active	cast-boolean	\N	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
275	trend_topics	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
276	trend_topics	topic	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
277	trend_topics	topic_id	uuid	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
209	image_assets	source_type	\N	select-dropdown	{"choices":[{"text":"ai","value":"ai"},{"text":"stock","value":"stock"},{"text":"manual","value":"manual"},{"text":"upload","value":"upload"}]}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
278	trend_topics	industry_id	uuid	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
279	trend_topics	sub_industry_id	uuid	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
281	trend_topics	trend_score	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
284	trend_topics	meta	cast-json	\N	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
285	trend_topics	last_seen_at	\N	datetime	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
286	trend_topics	create_at	\N	datetime	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
287	trend_topics	updated_at	\N	input	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N	t
288	trend_topics	source	\N	select-dropdown	{"choices":[{"text":"localrank","value":"localrank"},{"text":"rss","value":"rss"},{"text":"google_trends","value":"google_trends"},{"text":"manual","value":"manual"}]}	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N	t
289	trend_topics	status	\N	select-dropdown	{"choices":[{"text":"new","value":"new"},{"text":"queued","value":"queued"},{"text":"used","value":"used"},{"text":"ignored","value":"ignored"}]}	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N	t
241	silo_nodes	node_type	\N	select-dropdown	{"choices":[{"text":"pillar","value":"pillar"},{"text":"cluster","value":"cluster"},{"text":"faq","value":"faq"},{"text":"city_page","value":"city_page"},{"text":"product_page","value":"product_page"}]}	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
246	silo_nodes	status	\N	select-dropdown	{"choices":[{"text":"planned","value":"planned"},{"text":"requested","value":"requested"},{"text":"drafted","value":"drafted"},{"text":"published","value":"published"}]}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
161	content_requests	content_type	\N	select-dropdown	{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"},{"text":"comparison_post","value":"comparison_post"},{"text":"legal_explainer","value":"legal_explainer"},{"text":"blog_post","value":"blog_post"},{"text":"buying_guide","value":"buying_guide"},{"text":"short_form_only","value":"short_form_only"},{"text":"viral_post","value":"viral_post"}]}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
191	audience_profiles	reading_level	\N	select-dropdown	{"choices":[{"text":"grade6","value":"grade6"},{"text":"grade8","value":"grade8"},{"text":"professional","value":"professional"},{"text":"senior_plain","value":"senior_plain"}]}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
290	audience_profiles	last_seen_at	\N	datetime	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N	t
291	banned_phrases	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
292	banned_phrases	phrase	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
293	banned_phrases	replacement_hint	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
294	banned_phrases	create_at	\N	datetime	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
295	experience_snippets	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
296	experience_snippets	snippet_text	\N	input-multiline	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
297	experience_snippets	tags	cast-json	\N	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
298	experience_snippets	created_at	\N	datetime	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
300	experience_snippets	snippet_category	\N	select-dropdown	{"choices":[{"text":"story","value":"story"},{"text":"analogy","value":"analogy"},{"text":"warning","value":"warning"},{"text":"testimonial _style","value":"testimonial _style"},{"text":"mistake","value":"mistake"},{"text":"transformation","value":"transformation"}]}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
302	experience_snippets	sub_industry_id	uuid	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
301	experience_snippets	industry_id	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
303	experience_snippets	persona_id	uuid	input	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
304	experience_snippets	create_at	\N	datetime	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
305	image_assets	request_id	m2o	\N	\N	\N	\N	f	f	15	full	\N	\N	\N	f	\N	\N	\N	t
306	image_assets	slot	\N	select-dropdown	{"choices":[{"text":"hero","value":"hero"},{"text":"section_1","value":"section_1"},{"text":"section_2","value":"section_2"},{"text":"section_3","value":"section_3"},{"text":"inline","value":"inline"},{"text":"cta_badge","value":"cta_badge"},{"text":"comparison","value":"comparison"},{"text":"thumbnail","value":"thumbnail"}]}	\N	\N	f	f	16	full	\N	\N	\N	f	\N	\N	\N	t
307	image_assets	purpose	\N	select-dropdown	{"choices":[{"text":"trust","value":"trust"},{"text":"explain","value":"explain"},{"text":"visual_support","value":"visual_support"},{"text":"cta","value":"cta"},{"text":"diagram","value":"diagram"},{"text":"branding","value":"branding"}]}	\N	\N	f	f	17	full	\N	\N	\N	f	\N	\N	\N	t
309	sub_industries	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
310	sub_industries	slug	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
311	sub_industries	name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
315	industries	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
316	industries	name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
317	industries	slug	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
318	industries	active	cast-boolean	\N	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
319	industries	description	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
320	sub_industries	description	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
321	sub_industries	active	cast-boolean	\N	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
322	sub_industries	industry	m2o	\N	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
351	knowledge_base	client_id	m2o	select-dropdown-m2o	{"template":"{{business_name}}"}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
326	content_requests	industry	m2o	select-dropdown-m2o	{"template":"{{ name }}"}	related-values	{"template":"{{ name }}"}	f	f	16	full	\N	\N	\N	f	\N	\N	\N	t
328	content_requests	sub_industry	m2o	select-dropdown-m2o	{"template":"{{ name }}"}	\N	\N	f	f	17	full	\N	\N	\N	f	\N	\N	\N	t
329	niche_snapshots	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
330	niche_snapshots	niche_name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
331	niche_snapshots	urgency_level	cast-json	select-multiple-dropdown	{"choices":[{"text":"Medium","value":"medium"},{"text":"High","value":"High"},{"text":"Low","value":"Low"}]}	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
332	niche_snapshots	industry_vocabulary	cast-json	\N	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
333	niche_snapshots	default_tools	cast-json	\N	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
334	niche_snapshots	system_prompt_base	\N	input-multiline	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
336	AR_Tenants	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
337	AR_Tenants	business_name	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
338	AR_Tenants	twilio_name	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
339	AR_Tenants	business_config	cast-json	\N	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
341	AR_Tenants_niche_snapshots	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N	t
342	AR_Tenants_niche_snapshots	AR_Tenants_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N	t
343	AR_Tenants_niche_snapshots	niche_snapshots_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N	t
344	AR_Tenants	snapshots	m2o	select-dropdown-m2o	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
345	knowledge_base	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
346	knowledge_base	file	file	file	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
347	knowledge_base	status	\N	select-dropdown	{"choices":[{"text":"draft","value":"draft"},{"text":"published","value":"published"},{"text":"archived","value":"archived"}]}	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
348	knowledge_base	sync_status	\N	select-dropdown	{"choices":[{"text":"pending","value":"pending"},{"text":"sync_status","value":"sync_status"},{"text":"error","value":"error"}]}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
352	ai_calls	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N	t
353	ai_calls	lead_id	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N	t
354	ai_calls	caller_phone	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N	t
355	ai_calls	caller_input	\N	input-multiline	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N	t
356	ai_calls	ai_response	\N	input-multiline	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
357	ai_calls	sync_status	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N	t
358	ai_calls	client_response	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
360	ai_calls	created_at	\N	datetime	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
361	knowledge_base	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N	t
362	knowledge_base	type	\N	select-dropdown	{"choices":[{"text":"Persona","value":"Persona"},{"text":"Training","value":"Training"},{"text":"Business Rules","value":"Business Rules"}]}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N	t
363	knowledge_base	file_id	uuid	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N	t
364	knowledge_base	extracted_data	cast-json	\N	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N	t
365	knowledge_base	content	\N	input-multiline	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N	t
349	knowledge_base	document_type	\N	select-dropdown	{"choices":[{"text":"Pricing Manifest","value":"Pricing Manifest"},{"text":"Company FAQ","value":"Company FAQ"},{"text":"Transcript","value":"Transcript"},{"text":"Content/Text","value":"Content/Text"},{"text":"Vector/Embedding","value":"Vector/Embedding"},{"text":"Metadata","value":"Metadata"},{"text":"Standard Operating Procedure (SOP)","value":"Standard Operating Procedure (SOP)"},{"text":"Service Area Map","value":"Service Area Map"},{"text":"Technical Manual","value":"Technical Manual"},{"text":"Sales Script","value":"Sales Script"},{"text":"Staff Roster","value":"Staff Roster"}]}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N	t
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
9cd453a7-7947-4d4b-93f6-1793516ac714	local	9cd453a7-7947-4d4b-93f6-1793516ac714.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 01:36:22.68143+00	\N	2026-01-15 01:36:22.951+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8ae7743b-988d-4af8-9277-0d517c488536	local	8ae7743b-988d-4af8-9277-0d517c488536.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:07:36.787486+00	\N	2026-01-15 02:07:39.28+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11279d9f-cab5-4ee1-89ef-11374d4e0aff	local	11279d9f-cab5-4ee1-89ef-11374d4e0aff.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 02:39:47.62045+00	\N	2026-01-15 02:39:48.181+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8de88b1e-ab7d-4c2b-a4f6-734ec8d34718	local	8de88b1e-ab7d-4c2b-a4f6-734ec8d34718.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:12:32.462041+00	\N	2026-01-15 03:12:32.906+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
05dda9a8-9faa-4a83-bc1e-5915e54c0447	local	05dda9a8-9faa-4a83-bc1e-5915e54c0447.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:13:19.269517+00	\N	2026-01-15 03:13:19.67+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9f58a73c-b1c3-4ffa-910f-d92ef2766146	local	9f58a73c-b1c3-4ffa-910f-d92ef2766146.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:15:07.192299+00	\N	2026-01-15 03:15:07.322+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6a1c20a9-5888-40b7-a1cc-0da1f7d1bf96	local	6a1c20a9-5888-40b7-a1cc-0da1f7d1bf96.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 03:17:02.322822+00	\N	2026-01-15 03:17:02.546+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
bc6c4813-d468-4daa-bc85-5e32d2954d37	local	bc6c4813-d468-4daa-bc85-5e32d2954d37.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:26:45.310455+00	\N	2026-01-15 13:26:45.651+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1778fb7b-3ff9-42c6-a76e-abb6c46d52ff	local	1778fb7b-3ff9-42c6-a76e-abb6c46d52ff.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:27:22.510296+00	\N	2026-01-15 13:27:22.634+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97f4041f-0490-43f1-8c19-841c7f66b808	local	97f4041f-0490-43f1-8c19-841c7f66b808.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:31:53.049381+00	\N	2026-01-15 13:31:53.265+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d030e03d-9e5b-4802-8d25-bf22e3f02fd4	local	d030e03d-9e5b-4802-8d25-bf22e3f02fd4.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:33:40.262138+00	\N	2026-01-15 13:33:40.618+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
aeb48deb-c3f3-415b-bbde-cf76ec09b33e	local	aeb48deb-c3f3-415b-bbde-cf76ec09b33e.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:36:15.190731+00	\N	2026-01-15 13:36:15.778+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
06100c92-5458-41fa-9435-80eb85ed51e0	local	06100c92-5458-41fa-9435-80eb85ed51e0.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:42:37.626878+00	\N	2026-01-15 13:42:38.145+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
fe28671c-d860-47e4-8e6f-032cc0b3ed4d	local	fe28671c-d860-47e4-8e6f-032cc0b3ed4d.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:48:56.78277+00	\N	2026-01-15 13:48:57.149+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
103b75f8-8202-4586-b07e-58388f59481b	local	103b75f8-8202-4586-b07e-58388f59481b.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 13:51:54.145199+00	\N	2026-01-15 13:51:54.51+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
abd6964c-6a3f-4410-a020-eaac0b95fe5a	local	abd6964c-6a3f-4410-a020-eaac0b95fe5a.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 14:00:59.465342+00	\N	2026-01-15 14:01:01.913+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
d82e7254-6957-4e90-a43b-63f9cb19b0e9	local	d82e7254-6957-4e90-a43b-63f9cb19b0e9.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 14:19:10.563973+00	\N	2026-01-15 14:19:11.009+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
225dbb86-c988-4a2e-b7ec-4913d745fd01	local	225dbb86-c988-4a2e-b7ec-4913d745fd01.pdf	Leads_Grow_Revenue_AI_Agent_Training_v2.pdf	Leads Grow Revenue AI Agent Training V2	application/pdf	\N	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-15 21:00:31.517643+00	\N	2026-01-15 21:00:35.891+00	\N	2156598	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
57d4f8be-ba31-4b9f-84ab-cb12c565da82	Sync to N8N	bolt	\N	\N	active	event	all	{"type":"action","scope":["items.create"],"collections":["knowledge_base"]}	5f94ca76-79e5-4be5-a27a-c71f1eddf58d	2026-01-15 03:06:21.674+00	24f7d0fe-8079-4470-a550-625130a01a4c
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-11-20 00:54:47.638874+00
20201029A	Remove System Relations	2025-11-20 00:54:47.64705+00
20201029B	Remove System Collections	2025-11-20 00:54:47.654028+00
20201029C	Remove System Fields	2025-11-20 00:54:47.668786+00
20201105A	Add Cascade System Relations	2025-11-20 00:54:47.700769+00
20201105B	Change Webhook URL Type	2025-11-20 00:54:47.708149+00
20210225A	Add Relations Sort Field	2025-11-20 00:54:47.714004+00
20210304A	Remove Locked Fields	2025-11-20 00:54:47.716915+00
20210312A	Webhooks Collections Text	2025-11-20 00:54:47.724258+00
20210331A	Add Refresh Interval	2025-11-20 00:54:47.727306+00
20210415A	Make Filesize Nullable	2025-11-20 00:54:47.733184+00
20210416A	Add Collections Accountability	2025-11-20 00:54:47.736859+00
20210422A	Remove Files Interface	2025-11-20 00:54:47.738967+00
20210506A	Rename Interfaces	2025-11-20 00:54:47.759958+00
20210510A	Restructure Relations	2025-11-20 00:54:47.770464+00
20210518A	Add Foreign Key Constraints	2025-11-20 00:54:47.77699+00
20210519A	Add System Fk Triggers	2025-11-20 00:54:47.79628+00
20210521A	Add Collections Icon Color	2025-11-20 00:54:47.798712+00
20210525A	Add Insights	2025-11-20 00:54:47.811415+00
20210608A	Add Deep Clone Config	2025-11-20 00:54:47.813922+00
20210626A	Change Filesize Bigint	2025-11-20 00:54:47.823786+00
20210716A	Add Conditions to Fields	2025-11-20 00:54:47.826208+00
20210721A	Add Default Folder	2025-11-20 00:54:47.831107+00
20210802A	Replace Groups	2025-11-20 00:54:47.835127+00
20210803A	Add Required to Fields	2025-11-20 00:54:47.837603+00
20210805A	Update Groups	2025-11-20 00:54:47.840768+00
20210805B	Change Image Metadata Structure	2025-11-20 00:54:47.844038+00
20210811A	Add Geometry Config	2025-11-20 00:54:47.846332+00
20210831A	Remove Limit Column	2025-11-20 00:54:47.848561+00
20210903A	Add Auth Provider	2025-11-20 00:54:47.861239+00
20210907A	Webhooks Collections Not Null	2025-11-20 00:54:47.86655+00
20210910A	Move Module Setup	2025-11-20 00:54:47.869775+00
20210920A	Webhooks URL Not Null	2025-11-20 00:54:47.875301+00
20210924A	Add Collection Organization	2025-11-20 00:54:47.880176+00
20210927A	Replace Fields Group	2025-11-20 00:54:47.886783+00
20210927B	Replace M2M Interface	2025-11-20 00:54:47.888832+00
20210929A	Rename Login Action	2025-11-20 00:54:47.891014+00
20211007A	Update Presets	2025-11-20 00:54:47.896116+00
20211009A	Add Auth Data	2025-11-20 00:54:47.898439+00
20211016A	Add Webhook Headers	2025-11-20 00:54:47.900698+00
20211103A	Set Unique to User Token	2025-11-20 00:54:47.904189+00
20211103B	Update Special Geometry	2025-11-20 00:54:47.906513+00
20211104A	Remove Collections Listing	2025-11-20 00:54:47.90882+00
20211118A	Add Notifications	2025-11-20 00:54:47.919566+00
20211211A	Add Shares	2025-11-20 00:54:47.932687+00
20211230A	Add Project Descriptor	2025-11-20 00:54:47.935237+00
20220303A	Remove Default Project Color	2025-11-20 00:54:47.941675+00
20220308A	Add Bookmark Icon and Color	2025-11-20 00:54:47.944585+00
20220314A	Add Translation Strings	2025-11-20 00:54:47.947269+00
20220322A	Rename Field Typecast Flags	2025-11-20 00:54:47.951634+00
20220323A	Add Field Validation	2025-11-20 00:54:47.954436+00
20220325A	Fix Typecast Flags	2025-11-20 00:54:47.95865+00
20220325B	Add Default Language	2025-11-20 00:54:47.966094+00
20220402A	Remove Default Value Panel Icon	2025-11-20 00:54:47.973301+00
20220429A	Add Flows	2025-11-20 00:54:48.008135+00
20220429B	Add Color to Insights Icon	2025-11-20 00:54:48.012074+00
20220429C	Drop Non Null From IP of Activity	2025-11-20 00:54:48.015741+00
20220429D	Drop Non Null From Sender of Notifications	2025-11-20 00:54:48.0194+00
20220614A	Rename Hook Trigger to Event	2025-11-20 00:54:48.023706+00
20220801A	Update Notifications Timestamp Column	2025-11-20 00:54:48.033461+00
20220802A	Add Custom Aspect Ratios	2025-11-20 00:54:48.03717+00
20220826A	Add Origin to Accountability	2025-11-20 00:54:48.042195+00
20230401A	Update Material Icons	2025-11-20 00:54:48.051552+00
20230525A	Add Preview Settings	2025-11-20 00:54:48.055144+00
20230526A	Migrate Translation Strings	2025-11-20 00:54:48.067356+00
20230721A	Require Shares Fields	2025-11-20 00:54:48.074262+00
20230823A	Add Content Versioning	2025-11-20 00:54:48.096741+00
20230927A	Themes	2025-11-20 00:54:48.115157+00
20231009A	Update CSV Fields to Text	2025-11-20 00:54:48.12097+00
20231009B	Update Panel Options	2025-11-20 00:54:48.124483+00
20231010A	Add Extensions	2025-11-20 00:54:48.131561+00
20231215A	Add Focalpoints	2025-11-20 00:54:48.135403+00
20240122A	Add Report URL Fields	2025-11-20 00:54:48.139412+00
20240204A	Marketplace	2025-11-20 00:54:48.166909+00
20240305A	Change Useragent Type	2025-11-20 00:54:48.177687+00
20240311A	Deprecate Webhooks	2025-11-20 00:54:48.190152+00
20240422A	Public Registration	2025-11-20 00:54:48.198515+00
20240515A	Add Session Window	2025-11-20 00:54:48.202472+00
20240701A	Add Tus Data	2025-11-20 00:54:48.206111+00
20240716A	Update Files Date Fields	2025-11-20 00:54:48.213122+00
20240806A	Permissions Policies	2025-11-20 00:54:48.248428+00
20240817A	Update Icon Fields Length	2025-11-20 00:54:48.269088+00
20240909A	Separate Comments	2025-11-20 00:54:48.280762+00
20240909B	Consolidate Content Versioning	2025-11-20 00:54:48.283486+00
20240924A	Migrate Legacy Comments	2025-11-20 00:54:48.289141+00
20240924B	Populate Versioning Deltas	2025-11-20 00:54:48.29407+00
20250224A	Visual Editor	2025-11-20 00:54:48.297657+00
20250609A	License Banner	2025-11-20 00:54:48.302592+00
20250613A	Add Project ID	2025-11-20 00:54:48.322985+00
20250718A	Add Direction	2025-11-20 00:54:48.326293+00
20250813A	Add MCP	2025-11-20 00:54:48.331118+00
20251012A	Add Field Searchable	2025-12-25 19:42:17.104188+00
20251014A	Add Project Owner	2025-12-25 19:42:17.306141+00
20251028A	Add Retention Indexes	2025-12-25 19:42:17.460746+00
20251103A	Add AI Settings	2025-12-25 19:42:17.46691+00
20251224A	Remove Webhooks	2026-01-16 18:58:49.068058+00
20260113A	Add Revisions Index	2026-01-16 18:58:49.287318+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
5f94ca76-79e5-4be5-a27a-c71f1eddf58d	Webhook / Request URL	request_vlc81	request	19	1	{"url":"https://automation.leads2scale.com/webhook/autogenerated-id","method":"POST"}	\N	\N	57d4f8be-ba31-4b9f-84ab-cb12c565da82	2026-01-15 03:12:03.648+00	24f7d0fe-8079-4470-a550-625130a01a4c
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy, role) FROM stdin;
43	industries	read	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
44	sub_industries	read	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
45	industries	create	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
46	sub_industries	create	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
47	content_outputs	read	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
48	content_requests	read	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
49	content_requests	create	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
50	content_requests	update	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
51	content_outputs	create	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
52	content_outputs	update	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
53	audience_profiles	create	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
54	audience_profiles	read	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
55	audience_profiles	update	\N	\N	\N	*	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	\N
58	directus_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17	\N
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
b867d7ad-4e63-4e7d-a827-e9397be6fc3b	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
3	\N	24f7d0fe-8079-4470-a550-625130a01a4c	\N	sub_industries	\N	\N	{"tabular":{"page":3}}	\N	\N	\N	bookmark	\N
1	\N	24f7d0fe-8079-4470-a550-625130a01a4c	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
2	\N	24f7d0fe-8079-4470-a550-625130a01a4c	\N	directus_users	\N	tabular	{"cards":{"sort":["email"],"page":1},"map":{"limit":1000},"tabular":{"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
4	\N	24f7d0fe-8079-4470-a550-625130a01a4c	\N	knowledge_base	\N	kanban	\N	{"kanban":{"groupField":"client_id","groupTitle":"business_name","titleField":"title","textField":"type"}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	content_outputs	request_id	content_requests	\N	\N	\N	\N	\N	nullify
2	content_requests	forget_audience	audience_profiles	\N	\N	\N	\N	\N	nullify
3	content_requests	style_persona_id	writing_personas	\N	\N	\N	\N	\N	nullify
4	image_assets	request_id	content_requests	\N	\N	\N	\N	\N	nullify
6	sub_industries	industry	industries	\N	\N	\N	\N	\N	nullify
10	content_requests	industry	industries	\N	\N	\N	\N	\N	nullify
12	content_requests	sub_industry	sub_industries	\N	\N	\N	\N	\N	nullify
13	AR_Tenants_niche_snapshots	niche_snapshots_id	niche_snapshots	\N	\N	\N	AR_Tenants_id	\N	nullify
14	AR_Tenants_niche_snapshots	AR_Tenants_id	AR_Tenants	\N	\N	\N	niche_snapshots_id	\N	nullify
15	AR_Tenants	snapshots	niche_snapshots	\N	\N	\N	\N	\N	nullify
16	knowledge_base	file	directus_files	\N	\N	\N	\N	\N	nullify
17	knowledge_base	client_id	AR_Tenants	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_settings	1	{"id":1,"project_name":"grant-engine","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"accepted_terms":true,"project_id":"019a9ec1-bd01-7363-aa4c-f4af8e6c87b0","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null}	{"accepted_terms":true}	\N	\N
2	3	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	{"id":"24f7d0fe-8079-4470-a550-625130a01a4c","first_name":null,"last_name":null,"email":"jlanders@leadsgrowrevenue.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":null,"last_access":"2025-12-01T20:35:03.129Z","last_page":"/users/24f7d0fe-8079-4470-a550-625130a01a4c","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":"Directus Color Match","theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"theme_light":"Directus Color Match"}	\N	\N
3	4	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	{"id":"24f7d0fe-8079-4470-a550-625130a01a4c","first_name":null,"last_name":null,"email":"jlanders@leadsgrowrevenue.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":null,"last_access":"2025-12-01T20:35:03.129Z","last_page":"/users/24f7d0fe-8079-4470-a550-625130a01a4c","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":"Directus Default","theme_light":"Directus Color Match","theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"theme_dark":"Directus Default"}	\N	\N
4	5	directus_settings	1	{"id":1,"project_name":"LGR Data Engine","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"accepted_terms":true,"project_id":"019a9ec1-bd01-7363-aa4c-f4af8e6c87b0","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null}	{"project_name":"LGR Data Engine"}	\N	\N
5	6	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_audit"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_audit"}	\N	\N
6	7	directus_collections	seo_audit	{"singleton":false,"collection":"seo_audit"}	{"singleton":false,"collection":"seo_audit"}	\N	\N
7	8	directus_fields	2	{"sort":2,"interface":"input","special":null,"collection":"seo_audit","field":"businessId"}	{"sort":2,"interface":"input","special":null,"collection":"seo_audit","field":"businessId"}	\N	\N
8	9	directus_fields	3	{"sort":3,"interface":"input","special":null,"collection":"seo_audit","field":"businessName"}	{"sort":3,"interface":"input","special":null,"collection":"seo_audit","field":"businessName"}	\N	\N
9	10	directus_fields	4	{"sort":4,"interface":"input","special":null,"collection":"seo_audit","field":"domain"}	{"sort":4,"interface":"input","special":null,"collection":"seo_audit","field":"domain"}	\N	\N
10	11	directus_fields	5	{"sort":5,"interface":"datetime","special":null,"collection":"seo_audit","field":"auditDate"}	{"sort":5,"interface":"datetime","special":null,"collection":"seo_audit","field":"auditDate"}	\N	\N
11	12	directus_fields	6	{"sort":6,"interface":"input","special":null,"collection":"seo_audit","field":"meataScore"}	{"sort":6,"interface":"input","special":null,"collection":"seo_audit","field":"meataScore"}	\N	\N
12	13	directus_fields	7	{"sort":7,"interface":"input","special":null,"collection":"seo_audit","field":"contentScore"}	{"sort":7,"interface":"input","special":null,"collection":"seo_audit","field":"contentScore"}	\N	\N
13	14	directus_fields	8	{"sort":8,"interface":"input","special":null,"collection":"seo_audit","field":"performanceScore"}	{"sort":8,"interface":"input","special":null,"collection":"seo_audit","field":"performanceScore"}	\N	\N
14	15	directus_fields	9	{"sort":9,"interface":"input","special":null,"collection":"seo_audit","field":"localSeoScore"}	{"sort":9,"interface":"input","special":null,"collection":"seo_audit","field":"localSeoScore"}	\N	\N
15	16	directus_fields	10	{"sort":10,"interface":"input","special":null,"collection":"seo_audit","field":"technicalScore"}	{"sort":10,"interface":"input","special":null,"collection":"seo_audit","field":"technicalScore"}	\N	\N
16	17	directus_fields	11	{"sort":11,"interface":"input","special":null,"collection":"seo_audit","field":"overallScore"}	{"sort":11,"interface":"input","special":null,"collection":"seo_audit","field":"overallScore"}	\N	\N
17	18	directus_fields	12	{"sort":12,"interface":"input","special":null,"collection":"seo_audit","field":"entityClarityScore"}	{"sort":12,"interface":"input","special":null,"collection":"seo_audit","field":"entityClarityScore"}	\N	\N
18	19	directus_fields	13	{"sort":13,"interface":"input","special":null,"collection":"seo_audit","field":"aiFactScore"}	{"sort":13,"interface":"input","special":null,"collection":"seo_audit","field":"aiFactScore"}	\N	\N
19	20	directus_fields	14	{"sort":14,"interface":"input","special":null,"collection":"seo_audit","field":"informationCompletenessScore"}	{"sort":14,"interface":"input","special":null,"collection":"seo_audit","field":"informationCompletenessScore"}	\N	\N
20	21	directus_fields	15	{"sort":15,"interface":"input","special":null,"collection":"seo_audit","field":"adwordsOpportunityScore"}	{"sort":15,"interface":"input","special":null,"collection":"seo_audit","field":"adwordsOpportunityScore"}	\N	\N
21	22	directus_fields	16	{"sort":16,"interface":"input","special":null,"collection":"seo_audit","field":"localRankOpportunityScore"}	{"sort":16,"interface":"input","special":null,"collection":"seo_audit","field":"localRankOpportunityScore"}	\N	\N
22	23	directus_fields	17	{"sort":17,"interface":"input","special":null,"collection":"seo_audit","field":"voiceScore"}	{"sort":17,"interface":"input","special":null,"collection":"seo_audit","field":"voiceScore"}	\N	\N
23	24	directus_fields	18	{"sort":18,"interface":"input","special":null,"collection":"seo_audit","field":"aiVisibilityScore"}	{"sort":18,"interface":"input","special":null,"collection":"seo_audit","field":"aiVisibilityScore"}	\N	\N
37	38	directus_fields	32	{"sort":32,"special":["cast-boolean"],"collection":"seo_audit","field":"hasRobotsTXT"}	{"sort":32,"special":["cast-boolean"],"collection":"seo_audit","field":"hasRobotsTXT"}	\N	\N
38	39	directus_fields	33	{"sort":33,"special":["cast-boolean"],"collection":"seo_audit","field":"hasSiteMap"}	{"sort":33,"special":["cast-boolean"],"collection":"seo_audit","field":"hasSiteMap"}	\N	\N
39	40	directus_fields	34	{"sort":34,"special":["cast-boolean"],"collection":"seo_audit","field":"hasSSL"}	{"sort":34,"special":["cast-boolean"],"collection":"seo_audit","field":"hasSSL"}	\N	\N
40	41	directus_fields	35	{"sort":35,"special":["cast-boolean"],"collection":"seo_audit","field":"hasMobileFriendly"}	{"sort":35,"special":["cast-boolean"],"collection":"seo_audit","field":"hasMobileFriendly"}	\N	\N
41	42	directus_fields	36	{"sort":36,"special":["cast-boolean"],"collection":"seo_audit","field":"hasAltTags"}	{"sort":36,"special":["cast-boolean"],"collection":"seo_audit","field":"hasAltTags"}	\N	\N
42	43	directus_fields	37	{"sort":37,"special":["cast-boolean"],"collection":"seo_audit","field":"hasH1H2Structure"}	{"sort":37,"special":["cast-boolean"],"collection":"seo_audit","field":"hasH1H2Structure"}	\N	\N
43	44	directus_fields	38	{"sort":38,"special":["cast-boolean"],"collection":"seo_audit","field":"missingPages"}	{"sort":38,"special":["cast-boolean"],"collection":"seo_audit","field":"missingPages"}	\N	\N
44	45	directus_fields	39	{"sort":39,"special":["cast-boolean"],"collection":"seo_audit","field":"missingSocialProfile"}	{"sort":39,"special":["cast-boolean"],"collection":"seo_audit","field":"missingSocialProfile"}	\N	\N
45	46	directus_fields	40	{"sort":40,"special":["cast-boolean"],"collection":"seo_audit","field":"missingImageAltTags"}	{"sort":40,"special":["cast-boolean"],"collection":"seo_audit","field":"missingImageAltTags"}	\N	\N
46	47	directus_fields	41	{"sort":41,"special":["cast-boolean"],"collection":"seo_audit","field":"missingVideoContent"}	{"sort":41,"special":["cast-boolean"],"collection":"seo_audit","field":"missingVideoContent"}	\N	\N
47	48	directus_fields	42	{"sort":42,"special":["cast-boolean"],"collection":"seo_audit","field":"missingAudioContent"}	{"sort":42,"special":["cast-boolean"],"collection":"seo_audit","field":"missingAudioContent"}	\N	\N
48	49	directus_fields	43	{"sort":43,"interface":"input","special":null,"collection":"seo_audit","field":"wordCount"}	{"sort":43,"interface":"input","special":null,"collection":"seo_audit","field":"wordCount"}	\N	\N
49	50	directus_fields	44	{"sort":44,"interface":"input","special":null,"collection":"seo_audit","field":"imageCount"}	{"sort":44,"interface":"input","special":null,"collection":"seo_audit","field":"imageCount"}	\N	\N
50	51	directus_fields	45	{"sort":45,"special":null,"collection":"seo_audit","field":"brokenLinks"}	{"sort":45,"special":null,"collection":"seo_audit","field":"brokenLinks"}	\N	\N
51	52	directus_fields	46	{"sort":46,"interface":"input","special":null,"collection":"seo_audit","field":"internalLinks"}	{"sort":46,"interface":"input","special":null,"collection":"seo_audit","field":"internalLinks"}	\N	\N
24	25	directus_fields	19	{"sort":19,"interface":"input","special":null,"collection":"seo_audit","field":"aiContentCompletenessScore"}	{"sort":19,"interface":"input","special":null,"collection":"seo_audit","field":"aiContentCompletenessScore"}	\N	\N
25	26	directus_fields	20	{"sort":20,"interface":"input","special":null,"collection":"seo_audit","field":"missingAIDataPoints"}	{"sort":20,"interface":"input","special":null,"collection":"seo_audit","field":"missingAIDataPoints"}	\N	\N
26	27	directus_fields	21	{"sort":21,"interface":"input","special":null,"collection":"seo_audit","field":"entityConfusionRisk"}	{"sort":21,"interface":"input","special":null,"collection":"seo_audit","field":"entityConfusionRisk"}	\N	\N
27	28	directus_fields	22	{"sort":22,"interface":"input","special":null,"collection":"seo_audit","field":"valueIntentValueScore"}	{"sort":22,"interface":"input","special":null,"collection":"seo_audit","field":"valueIntentValueScore"}	\N	\N
28	29	directus_fields	23	{"sort":23,"interface":"input","special":null,"collection":"seo_audit","field":"localSearchOpportunityScore"}	{"sort":23,"interface":"input","special":null,"collection":"seo_audit","field":"localSearchOpportunityScore"}	\N	\N
29	30	directus_fields	24	{"sort":24,"interface":"input","special":null,"collection":"seo_audit","field":"nearMeRankingScore"}	{"sort":24,"interface":"input","special":null,"collection":"seo_audit","field":"nearMeRankingScore"}	\N	\N
30	31	directus_fields	25	{"sort":25,"interface":"input","special":null,"collection":"seo_audit","field":"dealOpportunityScore"}	{"sort":25,"interface":"input","special":null,"collection":"seo_audit","field":"dealOpportunityScore"}	\N	\N
31	32	directus_fields	26	{"sort":26,"interface":"input","special":null,"collection":"seo_audit","field":"multiModalOpportunityScore"}	{"sort":26,"interface":"input","special":null,"collection":"seo_audit","field":"multiModalOpportunityScore"}	\N	\N
32	33	directus_fields	27	{"sort":27,"special":["cast-boolean"],"collection":"seo_audit","field":"hasMetaTitle"}	{"sort":27,"special":["cast-boolean"],"collection":"seo_audit","field":"hasMetaTitle"}	\N	\N
33	34	directus_fields	28	{"sort":28,"special":["cast-boolean"],"collection":"seo_audit","field":"hasMetaDescription"}	{"sort":28,"special":["cast-boolean"],"collection":"seo_audit","field":"hasMetaDescription"}	\N	\N
34	35	directus_fields	29	{"sort":29,"special":["cast-boolean"],"collection":"seo_audit","field":"hasOgTags"}	{"sort":29,"special":["cast-boolean"],"collection":"seo_audit","field":"hasOgTags"}	\N	\N
35	36	directus_fields	30	{"sort":30,"special":["cast-boolean"],"collection":"seo_audit","field":"hasTwitterCards"}	{"sort":30,"special":["cast-boolean"],"collection":"seo_audit","field":"hasTwitterCards"}	\N	\N
36	37	directus_fields	31	{"sort":31,"special":["cast-boolean"],"collection":"seo_audit","field":"hasSchemaLD"}	{"sort":31,"special":["cast-boolean"],"collection":"seo_audit","field":"hasSchemaLD"}	\N	\N
52	53	directus_fields	47	{"sort":47,"interface":"input","special":null,"collection":"seo_audit","field":"externalLinks"}	{"sort":47,"interface":"input","special":null,"collection":"seo_audit","field":"externalLinks"}	\N	\N
53	54	directus_fields	48	{"sort":48,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"primaryKeyword"}	{"sort":48,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"primaryKeyword"}	\N	\N
54	55	directus_fields	49	{"sort":49,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"missingKeywordOpportunities"}	{"sort":49,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"missingKeywordOpportunities"}	\N	\N
55	56	directus_fields	50	{"sort":50,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"opportunitySummary"}	{"sort":50,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"opportunitySummary"}	\N	\N
56	57	directus_fields	51	{"sort":51,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"cityKeywordGaps"}	{"sort":51,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"cityKeywordGaps"}	\N	\N
57	58	directus_fields	52	{"sort":52,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"rawMetrics"}	{"sort":52,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"rawMetrics"}	\N	\N
58	59	directus_fields	53	{"sort":53,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"rawContentScan"}	{"sort":53,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"rawContentScan"}	\N	\N
59	60	directus_fields	54	{"sort":54,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"relatedServicePages"}	{"sort":54,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"relatedServicePages"}	\N	\N
60	61	directus_fields	55	{"sort":55,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"relatedCityPages"}	{"sort":55,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"relatedCityPages"}	\N	\N
61	62	directus_fields	56	{"sort":56,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"internalLinkOpportunities"}	{"sort":56,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"internalLinkOpportunities"}	\N	\N
62	63	directus_fields	57	{"sort":57,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"conversionOpportunitySummary"}	{"sort":57,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"conversionOpportunitySummary"}	\N	\N
63	64	directus_fields	58	{"sort":58,"interface":"input","special":null,"collection":"seo_audit","field":"buyerIntenKeywords"}	{"sort":58,"interface":"input","special":null,"collection":"seo_audit","field":"buyerIntenKeywords"}	\N	\N
64	65	directus_fields	59	{"sort":59,"interface":"input","special":null,"collection":"seo_audit","field":"nearMeKeywords"}	{"sort":59,"interface":"input","special":null,"collection":"seo_audit","field":"nearMeKeywords"}	\N	\N
65	66	directus_fields	60	{"sort":60,"interface":"input","special":null,"collection":"seo_audit","field":"openNowKeywords"}	{"sort":60,"interface":"input","special":null,"collection":"seo_audit","field":"openNowKeywords"}	\N	\N
66	67	directus_fields	61	{"sort":61,"interface":"input","special":null,"collection":"seo_audit","field":"localDiscountKeywords"}	{"sort":61,"interface":"input","special":null,"collection":"seo_audit","field":"localDiscountKeywords"}	\N	\N
67	68	directus_fields	62	{"sort":62,"interface":"input","special":null,"collection":"seo_audit","field":"serviceIntentKeywords"}	{"sort":62,"interface":"input","special":null,"collection":"seo_audit","field":"serviceIntentKeywords"}	\N	\N
68	69	directus_fields	63	{"sort":63,"interface":"input","special":null,"collection":"seo_audit","field":"neighborhoodKeywords"}	{"sort":63,"interface":"input","special":null,"collection":"seo_audit","field":"neighborhoodKeywords"}	\N	\N
1028	1183	directus_collections	knowledge_base	{"singleton":false,"collection":"knowledge_base"}	{"singleton":false,"collection":"knowledge_base"}	\N	\N
69	70	directus_fields	64	{"sort":64,"interface":"input","special":null,"collection":"seo_audit","field":"cityIntentGaps"}	{"sort":64,"interface":"input","special":null,"collection":"seo_audit","field":"cityIntentGaps"}	\N	\N
70	71	directus_fields	65	{"sort":65,"interface":"input","special":null,"collection":"seo_audit","field":"geoCoverageGaps"}	{"sort":65,"interface":"input","special":null,"collection":"seo_audit","field":"geoCoverageGaps"}	\N	\N
71	72	directus_fields	66	{"sort":66,"interface":"input","special":null,"collection":"seo_audit","field":"localCompetitionGap"}	{"sort":66,"interface":"input","special":null,"collection":"seo_audit","field":"localCompetitionGap"}	\N	\N
72	73	directus_fields	67	{"sort":67,"interface":"input","special":null,"collection":"seo_audit","field":"categoryKeywords"}	{"sort":67,"interface":"input","special":null,"collection":"seo_audit","field":"categoryKeywords"}	\N	\N
73	74	directus_fields	68	{"sort":68,"interface":"input","special":null,"collection":"seo_audit","field":"dealIntentKeywords"}	{"sort":68,"interface":"input","special":null,"collection":"seo_audit","field":"dealIntentKeywords"}	\N	\N
74	75	directus_fields	69	{"sort":69,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedImagePrompts"}	{"sort":69,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedImagePrompts"}	\N	\N
75	76	directus_fields	70	{"sort":70,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedVideoPrompt"}	{"sort":70,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedVideoPrompt"}	\N	\N
76	77	directus_fields	71	{"sort":71,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedAudioTopics"}	{"sort":71,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedAudioTopics"}	\N	\N
77	79	directus_fields	72	{"sort":72,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedVideoTopics"}	{"sort":72,"interface":"input-multiline","special":null,"collection":"seo_audit","field":"recommendedVideoTopics"}	\N	\N
78	80	directus_fields	73	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_metadata"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_metadata"}	\N	\N
79	81	directus_collections	seo_metadata	{"singleton":false,"collection":"seo_metadata"}	{"singleton":false,"collection":"seo_metadata"}	\N	\N
80	82	directus_fields	74	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_enrichment"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"seo_enrichment"}	\N	\N
81	83	directus_collections	seo_enrichment	{"singleton":false,"collection":"seo_enrichment"}	{"singleton":false,"collection":"seo_enrichment"}	\N	\N
82	84	directus_fields	75	{"sort":2,"interface":"input","special":null,"collection":"seo_enrichment","field":"business"}	{"sort":2,"interface":"input","special":null,"collection":"seo_enrichment","field":"business"}	\N	\N
83	85	directus_fields	76	{"sort":3,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"summary_short"}	{"sort":3,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"summary_short"}	\N	\N
84	86	directus_fields	77	{"sort":4,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"summary_long"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"summary_long"}	\N	\N
85	87	directus_fields	78	{"sort":5,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"keywords"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"keywords"}	\N	\N
86	88	directus_fields	79	{"sort":6,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"servicePageIntro"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"servicePageIntro"}	\N	\N
87	89	directus_fields	80	{"sort":7,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"servicePageDetails"}	{"sort":7,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"servicePageDetails"}	\N	\N
88	90	directus_fields	81	{"sort":8,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"localLandingPageIntro"}	{"sort":8,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"localLandingPageIntro"}	\N	\N
89	91	directus_fields	82	{"sort":9,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"categoryLandingPageIntro"}	{"sort":9,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"categoryLandingPageIntro"}	\N	\N
90	92	directus_fields	83	{"sort":10,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"cityLandingKeywords"}	{"sort":10,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"cityLandingKeywords"}	\N	\N
91	93	directus_fields	84	{"sort":11,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"spokenAnswerSnippet"}	{"sort":11,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"spokenAnswerSnippet"}	\N	\N
92	94	directus_fields	85	{"sort":12,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"conversationalFAQ"}	{"sort":12,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"conversationalFAQ"}	\N	\N
93	95	directus_fields	86	{"sort":13,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"voiceKeywords"}	{"sort":13,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"voiceKeywords"}	\N	\N
94	96	directus_fields	87	{"sort":14,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"localVoiceSnippet"}	{"sort":14,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"localVoiceSnippet"}	\N	\N
95	97	directus_fields	88	{"sort":15,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiOverviewSnippet"}	{"sort":15,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiOverviewSnippet"}	\N	\N
96	98	directus_fields	89	{"sort":16,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiLocalRecommendationSnippet"}	{"sort":16,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiLocalRecommendationSnippet"}	\N	\N
97	99	directus_fields	90	{"sort":17,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiServiceExplanation"}	{"sort":17,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiServiceExplanation"}	\N	\N
107	111	directus_fields	99	{"sort":2,"interface":"input","special":null,"collection":"intel_debug","field":"sourceUrl"}	{"sort":2,"interface":"input","special":null,"collection":"intel_debug","field":"sourceUrl"}	\N	\N
98	100	directus_fields	91	{"sort":18,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiComparisonSnippet"}	{"sort":18,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiComparisonSnippet"}	\N	\N
99	101	directus_fields	92	{"sort":19,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"schemaEntitySummary"}	{"sort":19,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"schemaEntitySummary"}	\N	\N
100	102	directus_fields	93	{"sort":20,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiQuestionAnswerPairs"}	{"sort":20,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiQuestionAnswerPairs"}	\N	\N
101	103	directus_fields	94	{"sort":21,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"structuredAnswerBlocks"}	{"sort":21,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"structuredAnswerBlocks"}	\N	\N
102	104	directus_fields	95	{"sort":22,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiFriendlyFacts"}	{"sort":22,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"aiFriendlyFacts"}	\N	\N
103	105	directus_fields	96	{"sort":23,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"nearMeSnippet"}	{"sort":23,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"nearMeSnippet"}	\N	\N
104	106	directus_fields	97	{"sort":24,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"buyerIntentSnippet"}	{"sort":24,"interface":"input-multiline","special":null,"collection":"seo_enrichment","field":"buyerIntentSnippet"}	\N	\N
105	109	directus_fields	98	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"intel_debug"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"intel_debug"}	\N	\N
106	110	directus_collections	intel_debug	{"singleton":false,"collection":"intel_debug"}	{"singleton":false,"collection":"intel_debug"}	\N	\N
108	112	directus_fields	100	{"sort":3,"interface":"input","special":null,"collection":"intel_debug","field":"businessWebsiteRoot"}	{"sort":3,"interface":"input","special":null,"collection":"intel_debug","field":"businessWebsiteRoot"}	\N	\N
109	113	directus_fields	101	{"sort":4,"interface":"input-multiline","special":null,"collection":"intel_debug","field":"rawPayload"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"intel_debug","field":"rawPayload"}	\N	\N
110	114	directus_fields	102	{"sort":5,"interface":"datetime","special":null,"collection":"intel_debug","field":"createAt"}	{"sort":5,"interface":"datetime","special":null,"collection":"intel_debug","field":"createAt"}	\N	\N
111	115	directus_fields	103	{"sort":6,"interface":"input","special":null,"collection":"intel_debug","field":"business"}	{"sort":6,"interface":"input","special":null,"collection":"intel_debug","field":"business"}	\N	\N
112	116	directus_fields	104	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"intel_provenance"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"intel_provenance"}	\N	\N
113	117	directus_collections	intel_provenance	{"singleton":false,"collection":"intel_provenance"}	{"singleton":false,"collection":"intel_provenance"}	\N	\N
114	118	directus_fields	105	{"sort":2,"interface":"input","special":null,"collection":"intel_provenance","field":"business"}	{"sort":2,"interface":"input","special":null,"collection":"intel_provenance","field":"business"}	\N	\N
115	119	directus_fields	106	{"sort":3,"interface":"input","special":null,"collection":"intel_provenance","field":"field_name"}	{"sort":3,"interface":"input","special":null,"collection":"intel_provenance","field":"field_name"}	\N	\N
116	120	directus_fields	107	{"sort":4,"interface":"input-multiline","special":null,"collection":"intel_provenance","field":"value"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"intel_provenance","field":"value"}	\N	\N
117	121	directus_fields	108	{"sort":5,"interface":"input","special":null,"collection":"intel_provenance","field":"source"}	{"sort":5,"interface":"input","special":null,"collection":"intel_provenance","field":"source"}	\N	\N
118	122	directus_fields	109	{"sort":6,"interface":"input","special":null,"collection":"intel_provenance","field":"confidence"}	{"sort":6,"interface":"input","special":null,"collection":"intel_provenance","field":"confidence"}	\N	\N
119	123	directus_fields	110	{"sort":7,"interface":"input-multiline","special":null,"collection":"intel_provenance","field":"raw_input"}	{"sort":7,"interface":"input-multiline","special":null,"collection":"intel_provenance","field":"raw_input"}	\N	\N
120	124	directus_fields	111	{"sort":8,"interface":"datetime","special":null,"collection":"intel_provenance","field":"last_verified"}	{"sort":8,"interface":"datetime","special":null,"collection":"intel_provenance","field":"last_verified"}	\N	\N
121	125	directus_fields	112	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"kb_chunks"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"kb_chunks"}	\N	\N
122	126	directus_collections	kb_chunks	{"singleton":false,"collection":"kb_chunks"}	{"singleton":false,"collection":"kb_chunks"}	\N	\N
123	127	directus_fields	113	{"sort":2,"interface":"input","special":null,"collection":"kb_chunks","field":"doc_id"}	{"sort":2,"interface":"input","special":null,"collection":"kb_chunks","field":"doc_id"}	\N	\N
124	128	directus_fields	114	{"sort":3,"interface":"input","special":null,"collection":"kb_chunks","field":"niche_slug"}	{"sort":3,"interface":"input","special":null,"collection":"kb_chunks","field":"niche_slug"}	\N	\N
125	129	directus_fields	115	{"sort":4,"interface":"input-multiline","special":null,"collection":"kb_chunks","field":"chunk_test"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"kb_chunks","field":"chunk_test"}	\N	\N
126	130	directus_fields	116	{"sort":5,"interface":"input-multiline","special":null,"collection":"kb_chunks","field":"embedding"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"kb_chunks","field":"embedding"}	\N	\N
127	131	directus_fields	117	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"kb_documents"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"kb_documents"}	\N	\N
128	132	directus_collections	kb_documents	{"singleton":false,"collection":"kb_documents"}	{"singleton":false,"collection":"kb_documents"}	\N	\N
129	133	directus_fields	118	{"sort":2,"interface":"input","special":null,"collection":"kb_documents","field":"title"}	{"sort":2,"interface":"input","special":null,"collection":"kb_documents","field":"title"}	\N	\N
130	134	directus_fields	119	{"sort":3,"interface":"input","special":null,"collection":"kb_documents","field":"niche_slug"}	{"sort":3,"interface":"input","special":null,"collection":"kb_documents","field":"niche_slug"}	\N	\N
131	135	directus_fields	120	{"sort":4,"interface":"input","special":null,"collection":"kb_documents","field":"city_slug"}	{"sort":4,"interface":"input","special":null,"collection":"kb_documents","field":"city_slug"}	\N	\N
132	136	directus_fields	121	{"sort":5,"interface":"input","special":null,"collection":"kb_documents","field":"source_type"}	{"sort":5,"interface":"input","special":null,"collection":"kb_documents","field":"source_type"}	\N	\N
133	137	directus_fields	122	{"sort":6,"interface":"input","special":null,"collection":"kb_documents","field":"source_url"}	{"sort":6,"interface":"input","special":null,"collection":"kb_documents","field":"source_url"}	\N	\N
138	142	directus_fields	127	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"learning_queue"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"learning_queue"}	\N	\N
139	143	directus_collections	learning_queue	{"singleton":false,"collection":"learning_queue"}	{"singleton":false,"collection":"learning_queue"}	\N	\N
140	144	directus_fields	128	{"sort":2,"interface":"datetime","special":null,"collection":"learning_queue","field":"created_at"}	{"sort":2,"interface":"datetime","special":null,"collection":"learning_queue","field":"created_at"}	\N	\N
141	145	directus_fields	129	{"sort":3,"interface":"input","special":null,"collection":"learning_queue","field":"niche_slug"}	{"sort":3,"interface":"input","special":null,"collection":"learning_queue","field":"niche_slug"}	\N	\N
142	146	directus_fields	130	{"sort":4,"interface":"input-multiline","special":null,"collection":"learning_queue","field":"question"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"learning_queue","field":"question"}	\N	\N
143	147	directus_fields	131	{"sort":5,"interface":"input-multiline","special":null,"collection":"learning_queue","field":"proposed_answer"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"learning_queue","field":"proposed_answer"}	\N	\N
144	148	directus_fields	132	{"sort":6,"interface":"input-multiline","special":null,"collection":"learning_queue","field":"evidence_chunks"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"learning_queue","field":"evidence_chunks"}	\N	\N
145	149	directus_fields	133	{"sort":7,"interface":"input","special":null,"collection":"learning_queue","field":"status"}	{"sort":7,"interface":"input","special":null,"collection":"learning_queue","field":"status"}	\N	\N
134	138	directus_fields	123	{"sort":7,"interface":"input-multiline","special":null,"collection":"kb_documents","field":"tags"}	{"sort":7,"interface":"input-multiline","special":null,"collection":"kb_documents","field":"tags"}	\N	\N
135	139	directus_fields	124	{"sort":8,"interface":"input-multiline","special":null,"collection":"kb_documents","field":"raw_text"}	{"sort":8,"interface":"input-multiline","special":null,"collection":"kb_documents","field":"raw_text"}	\N	\N
136	140	directus_fields	125	{"sort":9,"interface":"input","special":null,"collection":"kb_documents","field":"visibility"}	{"sort":9,"interface":"input","special":null,"collection":"kb_documents","field":"visibility"}	\N	\N
137	141	directus_fields	126	{"sort":10,"interface":"input","special":null,"collection":"kb_documents","field":"checksum"}	{"sort":10,"interface":"input","special":null,"collection":"kb_documents","field":"checksum"}	\N	\N
146	152	directus_fields	134	{"sort":73,"interface":"input","special":null,"collection":"seo_audit","field":"business"}	{"sort":73,"interface":"input","special":null,"collection":"seo_audit","field":"business"}	\N	\N
147	153	directus_fields	1	{"id":1,"collection":"seo_audit","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"id","sort":1,"group":null}	\N	\N
148	154	directus_fields	4	{"id":4,"collection":"seo_audit","field":"domain","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"domain","sort":2,"group":null}	\N	\N
149	155	directus_fields	5	{"id":5,"collection":"seo_audit","field":"auditDate","special":null,"interface":"datetime","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"auditDate","sort":3,"group":null}	\N	\N
150	156	directus_fields	6	{"id":6,"collection":"seo_audit","field":"meataScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"meataScore","sort":4,"group":null}	\N	\N
151	157	directus_fields	7	{"id":7,"collection":"seo_audit","field":"contentScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"contentScore","sort":5,"group":null}	\N	\N
152	158	directus_fields	8	{"id":8,"collection":"seo_audit","field":"performanceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"performanceScore","sort":6,"group":null}	\N	\N
153	159	directus_fields	9	{"id":9,"collection":"seo_audit","field":"localSeoScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSeoScore","sort":7,"group":null}	\N	\N
154	160	directus_fields	10	{"id":10,"collection":"seo_audit","field":"technicalScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"technicalScore","sort":8,"group":null}	\N	\N
155	161	directus_fields	11	{"id":11,"collection":"seo_audit","field":"overallScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"overallScore","sort":9,"group":null}	\N	\N
156	162	directus_fields	12	{"id":12,"collection":"seo_audit","field":"entityClarityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityClarityScore","sort":10,"group":null}	\N	\N
157	163	directus_fields	13	{"id":13,"collection":"seo_audit","field":"aiFactScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiFactScore","sort":11,"group":null}	\N	\N
158	164	directus_fields	14	{"id":14,"collection":"seo_audit","field":"informationCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"informationCompletenessScore","sort":12,"group":null}	\N	\N
159	165	directus_fields	15	{"id":15,"collection":"seo_audit","field":"adwordsOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"adwordsOpportunityScore","sort":13,"group":null}	\N	\N
160	166	directus_fields	16	{"id":16,"collection":"seo_audit","field":"localRankOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localRankOpportunityScore","sort":14,"group":null}	\N	\N
503	512	directus_fields	139	{"sort":4,"interface":"input","special":null,"collection":"business_intel_reports","field":"engine"}	{"sort":4,"interface":"input","special":null,"collection":"business_intel_reports","field":"engine"}	\N	\N
161	167	directus_fields	17	{"id":17,"collection":"seo_audit","field":"voiceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"voiceScore","sort":15,"group":null}	\N	\N
162	168	directus_fields	18	{"id":18,"collection":"seo_audit","field":"aiVisibilityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":16,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiVisibilityScore","sort":16,"group":null}	\N	\N
163	169	directus_fields	19	{"id":19,"collection":"seo_audit","field":"aiContentCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":17,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiContentCompletenessScore","sort":17,"group":null}	\N	\N
164	170	directus_fields	20	{"id":20,"collection":"seo_audit","field":"missingAIDataPoints","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":18,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAIDataPoints","sort":18,"group":null}	\N	\N
165	171	directus_fields	21	{"id":21,"collection":"seo_audit","field":"entityConfusionRisk","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":19,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityConfusionRisk","sort":19,"group":null}	\N	\N
166	172	directus_fields	22	{"id":22,"collection":"seo_audit","field":"valueIntentValueScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":20,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"valueIntentValueScore","sort":20,"group":null}	\N	\N
167	173	directus_fields	23	{"id":23,"collection":"seo_audit","field":"localSearchOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":21,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSearchOpportunityScore","sort":21,"group":null}	\N	\N
168	174	directus_fields	24	{"id":24,"collection":"seo_audit","field":"nearMeRankingScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":22,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeRankingScore","sort":22,"group":null}	\N	\N
169	175	directus_fields	25	{"id":25,"collection":"seo_audit","field":"dealOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":23,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealOpportunityScore","sort":23,"group":null}	\N	\N
170	176	directus_fields	26	{"id":26,"collection":"seo_audit","field":"multiModalOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":24,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"multiModalOpportunityScore","sort":24,"group":null}	\N	\N
171	177	directus_fields	27	{"id":27,"collection":"seo_audit","field":"hasMetaTitle","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":25,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaTitle","sort":25,"group":null}	\N	\N
172	178	directus_fields	28	{"id":28,"collection":"seo_audit","field":"hasMetaDescription","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":26,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaDescription","sort":26,"group":null}	\N	\N
173	179	directus_fields	29	{"id":29,"collection":"seo_audit","field":"hasOgTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":27,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasOgTags","sort":27,"group":null}	\N	\N
174	180	directus_fields	30	{"id":30,"collection":"seo_audit","field":"hasTwitterCards","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":28,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasTwitterCards","sort":28,"group":null}	\N	\N
175	181	directus_fields	31	{"id":31,"collection":"seo_audit","field":"hasSchemaLD","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":29,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSchemaLD","sort":29,"group":null}	\N	\N
176	182	directus_fields	32	{"id":32,"collection":"seo_audit","field":"hasRobotsTXT","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":30,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasRobotsTXT","sort":30,"group":null}	\N	\N
177	183	directus_fields	33	{"id":33,"collection":"seo_audit","field":"hasSiteMap","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":31,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSiteMap","sort":31,"group":null}	\N	\N
178	184	directus_fields	34	{"id":34,"collection":"seo_audit","field":"hasSSL","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":32,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSSL","sort":32,"group":null}	\N	\N
179	185	directus_fields	35	{"id":35,"collection":"seo_audit","field":"hasMobileFriendly","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":33,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMobileFriendly","sort":33,"group":null}	\N	\N
180	186	directus_fields	36	{"id":36,"collection":"seo_audit","field":"hasAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":34,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasAltTags","sort":34,"group":null}	\N	\N
181	187	directus_fields	37	{"id":37,"collection":"seo_audit","field":"hasH1H2Structure","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":35,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasH1H2Structure","sort":35,"group":null}	\N	\N
182	188	directus_fields	38	{"id":38,"collection":"seo_audit","field":"missingPages","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":36,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingPages","sort":36,"group":null}	\N	\N
183	189	directus_fields	39	{"id":39,"collection":"seo_audit","field":"missingSocialProfile","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":37,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingSocialProfile","sort":37,"group":null}	\N	\N
184	190	directus_fields	40	{"id":40,"collection":"seo_audit","field":"missingImageAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":38,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingImageAltTags","sort":38,"group":null}	\N	\N
185	191	directus_fields	41	{"id":41,"collection":"seo_audit","field":"missingVideoContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":39,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingVideoContent","sort":39,"group":null}	\N	\N
186	192	directus_fields	42	{"id":42,"collection":"seo_audit","field":"missingAudioContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":40,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAudioContent","sort":40,"group":null}	\N	\N
187	193	directus_fields	43	{"id":43,"collection":"seo_audit","field":"wordCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":41,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"wordCount","sort":41,"group":null}	\N	\N
188	194	directus_fields	44	{"id":44,"collection":"seo_audit","field":"imageCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":42,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"imageCount","sort":42,"group":null}	\N	\N
189	195	directus_fields	45	{"id":45,"collection":"seo_audit","field":"brokenLinks","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":43,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"brokenLinks","sort":43,"group":null}	\N	\N
190	196	directus_fields	46	{"id":46,"collection":"seo_audit","field":"internalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":44,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinks","sort":44,"group":null}	\N	\N
191	197	directus_fields	47	{"id":47,"collection":"seo_audit","field":"externalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":45,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"externalLinks","sort":45,"group":null}	\N	\N
192	198	directus_fields	48	{"id":48,"collection":"seo_audit","field":"primaryKeyword","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":46,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"primaryKeyword","sort":46,"group":null}	\N	\N
193	199	directus_fields	49	{"id":49,"collection":"seo_audit","field":"missingKeywordOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":47,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingKeywordOpportunities","sort":47,"group":null}	\N	\N
194	200	directus_fields	50	{"id":50,"collection":"seo_audit","field":"opportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":48,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"opportunitySummary","sort":48,"group":null}	\N	\N
195	201	directus_fields	51	{"id":51,"collection":"seo_audit","field":"cityKeywordGaps","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":49,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityKeywordGaps","sort":49,"group":null}	\N	\N
196	202	directus_fields	52	{"id":52,"collection":"seo_audit","field":"rawMetrics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":50,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawMetrics","sort":50,"group":null}	\N	\N
197	203	directus_fields	53	{"id":53,"collection":"seo_audit","field":"rawContentScan","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":51,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawContentScan","sort":51,"group":null}	\N	\N
198	204	directus_fields	54	{"id":54,"collection":"seo_audit","field":"relatedServicePages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":52,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedServicePages","sort":52,"group":null}	\N	\N
199	205	directus_fields	55	{"id":55,"collection":"seo_audit","field":"relatedCityPages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":53,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedCityPages","sort":53,"group":null}	\N	\N
200	206	directus_fields	56	{"id":56,"collection":"seo_audit","field":"internalLinkOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":54,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinkOpportunities","sort":54,"group":null}	\N	\N
201	207	directus_fields	57	{"id":57,"collection":"seo_audit","field":"conversionOpportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":55,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"conversionOpportunitySummary","sort":55,"group":null}	\N	\N
202	208	directus_fields	58	{"id":58,"collection":"seo_audit","field":"buyerIntenKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":56,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"buyerIntenKeywords","sort":56,"group":null}	\N	\N
203	209	directus_fields	59	{"id":59,"collection":"seo_audit","field":"nearMeKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":57,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeKeywords","sort":57,"group":null}	\N	\N
204	210	directus_fields	60	{"id":60,"collection":"seo_audit","field":"openNowKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":58,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"openNowKeywords","sort":58,"group":null}	\N	\N
205	211	directus_fields	61	{"id":61,"collection":"seo_audit","field":"localDiscountKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":59,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localDiscountKeywords","sort":59,"group":null}	\N	\N
206	212	directus_fields	62	{"id":62,"collection":"seo_audit","field":"serviceIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":60,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"serviceIntentKeywords","sort":60,"group":null}	\N	\N
207	213	directus_fields	63	{"id":63,"collection":"seo_audit","field":"neighborhoodKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":61,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"neighborhoodKeywords","sort":61,"group":null}	\N	\N
208	214	directus_fields	64	{"id":64,"collection":"seo_audit","field":"cityIntentGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":62,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityIntentGaps","sort":62,"group":null}	\N	\N
209	215	directus_fields	134	{"id":134,"collection":"seo_audit","field":"business","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":63,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"business","sort":63,"group":null}	\N	\N
210	216	directus_fields	65	{"id":65,"collection":"seo_audit","field":"geoCoverageGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":64,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"geoCoverageGaps","sort":64,"group":null}	\N	\N
211	217	directus_fields	66	{"id":66,"collection":"seo_audit","field":"localCompetitionGap","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":65,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localCompetitionGap","sort":65,"group":null}	\N	\N
212	218	directus_fields	67	{"id":67,"collection":"seo_audit","field":"categoryKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":66,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"categoryKeywords","sort":66,"group":null}	\N	\N
213	219	directus_fields	68	{"id":68,"collection":"seo_audit","field":"dealIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":67,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealIntentKeywords","sort":67,"group":null}	\N	\N
214	220	directus_fields	69	{"id":69,"collection":"seo_audit","field":"recommendedImagePrompts","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":68,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedImagePrompts","sort":68,"group":null}	\N	\N
215	221	directus_fields	71	{"id":71,"collection":"seo_audit","field":"recommendedAudioTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":69,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedAudioTopics","sort":69,"group":null}	\N	\N
216	222	directus_fields	72	{"id":72,"collection":"seo_audit","field":"recommendedVideoTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":70,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedVideoTopics","sort":70,"group":null}	\N	\N
217	223	directus_fields	1	{"id":1,"collection":"seo_audit","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"id","sort":1,"group":null}	\N	\N
218	224	directus_fields	4	{"id":4,"collection":"seo_audit","field":"domain","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"domain","sort":2,"group":null}	\N	\N
219	225	directus_fields	5	{"id":5,"collection":"seo_audit","field":"auditDate","special":null,"interface":"datetime","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"auditDate","sort":3,"group":null}	\N	\N
220	226	directus_fields	6	{"id":6,"collection":"seo_audit","field":"meataScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"meataScore","sort":4,"group":null}	\N	\N
221	227	directus_fields	7	{"id":7,"collection":"seo_audit","field":"contentScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"contentScore","sort":5,"group":null}	\N	\N
222	228	directus_fields	8	{"id":8,"collection":"seo_audit","field":"performanceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"performanceScore","sort":6,"group":null}	\N	\N
223	229	directus_fields	9	{"id":9,"collection":"seo_audit","field":"localSeoScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSeoScore","sort":7,"group":null}	\N	\N
224	230	directus_fields	10	{"id":10,"collection":"seo_audit","field":"technicalScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"technicalScore","sort":8,"group":null}	\N	\N
225	231	directus_fields	11	{"id":11,"collection":"seo_audit","field":"overallScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"overallScore","sort":9,"group":null}	\N	\N
226	232	directus_fields	12	{"id":12,"collection":"seo_audit","field":"entityClarityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityClarityScore","sort":10,"group":null}	\N	\N
227	233	directus_fields	13	{"id":13,"collection":"seo_audit","field":"aiFactScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiFactScore","sort":11,"group":null}	\N	\N
228	234	directus_fields	14	{"id":14,"collection":"seo_audit","field":"informationCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"informationCompletenessScore","sort":12,"group":null}	\N	\N
229	235	directus_fields	15	{"id":15,"collection":"seo_audit","field":"adwordsOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"adwordsOpportunityScore","sort":13,"group":null}	\N	\N
230	236	directus_fields	16	{"id":16,"collection":"seo_audit","field":"localRankOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localRankOpportunityScore","sort":14,"group":null}	\N	\N
231	237	directus_fields	17	{"id":17,"collection":"seo_audit","field":"voiceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"voiceScore","sort":15,"group":null}	\N	\N
232	238	directus_fields	18	{"id":18,"collection":"seo_audit","field":"aiVisibilityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":16,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiVisibilityScore","sort":16,"group":null}	\N	\N
233	239	directus_fields	19	{"id":19,"collection":"seo_audit","field":"aiContentCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":17,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiContentCompletenessScore","sort":17,"group":null}	\N	\N
234	240	directus_fields	20	{"id":20,"collection":"seo_audit","field":"missingAIDataPoints","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":18,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAIDataPoints","sort":18,"group":null}	\N	\N
235	241	directus_fields	21	{"id":21,"collection":"seo_audit","field":"entityConfusionRisk","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":19,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityConfusionRisk","sort":19,"group":null}	\N	\N
236	242	directus_fields	22	{"id":22,"collection":"seo_audit","field":"valueIntentValueScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":20,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"valueIntentValueScore","sort":20,"group":null}	\N	\N
237	243	directus_fields	23	{"id":23,"collection":"seo_audit","field":"localSearchOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":21,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSearchOpportunityScore","sort":21,"group":null}	\N	\N
238	244	directus_fields	24	{"id":24,"collection":"seo_audit","field":"nearMeRankingScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":22,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeRankingScore","sort":22,"group":null}	\N	\N
239	245	directus_fields	25	{"id":25,"collection":"seo_audit","field":"dealOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":23,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealOpportunityScore","sort":23,"group":null}	\N	\N
240	246	directus_fields	26	{"id":26,"collection":"seo_audit","field":"multiModalOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":24,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"multiModalOpportunityScore","sort":24,"group":null}	\N	\N
241	247	directus_fields	27	{"id":27,"collection":"seo_audit","field":"hasMetaTitle","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":25,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaTitle","sort":25,"group":null}	\N	\N
242	248	directus_fields	28	{"id":28,"collection":"seo_audit","field":"hasMetaDescription","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":26,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaDescription","sort":26,"group":null}	\N	\N
243	249	directus_fields	29	{"id":29,"collection":"seo_audit","field":"hasOgTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":27,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasOgTags","sort":27,"group":null}	\N	\N
244	250	directus_fields	30	{"id":30,"collection":"seo_audit","field":"hasTwitterCards","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":28,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasTwitterCards","sort":28,"group":null}	\N	\N
245	251	directus_fields	31	{"id":31,"collection":"seo_audit","field":"hasSchemaLD","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":29,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSchemaLD","sort":29,"group":null}	\N	\N
246	252	directus_fields	32	{"id":32,"collection":"seo_audit","field":"hasRobotsTXT","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":30,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasRobotsTXT","sort":30,"group":null}	\N	\N
247	253	directus_fields	33	{"id":33,"collection":"seo_audit","field":"hasSiteMap","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":31,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSiteMap","sort":31,"group":null}	\N	\N
248	254	directus_fields	34	{"id":34,"collection":"seo_audit","field":"hasSSL","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":32,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSSL","sort":32,"group":null}	\N	\N
249	255	directus_fields	35	{"id":35,"collection":"seo_audit","field":"hasMobileFriendly","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":33,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMobileFriendly","sort":33,"group":null}	\N	\N
250	256	directus_fields	36	{"id":36,"collection":"seo_audit","field":"hasAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":34,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasAltTags","sort":34,"group":null}	\N	\N
251	257	directus_fields	37	{"id":37,"collection":"seo_audit","field":"hasH1H2Structure","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":35,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasH1H2Structure","sort":35,"group":null}	\N	\N
252	258	directus_fields	38	{"id":38,"collection":"seo_audit","field":"missingPages","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":36,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingPages","sort":36,"group":null}	\N	\N
253	259	directus_fields	39	{"id":39,"collection":"seo_audit","field":"missingSocialProfile","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":37,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingSocialProfile","sort":37,"group":null}	\N	\N
254	260	directus_fields	40	{"id":40,"collection":"seo_audit","field":"missingImageAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":38,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingImageAltTags","sort":38,"group":null}	\N	\N
255	261	directus_fields	41	{"id":41,"collection":"seo_audit","field":"missingVideoContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":39,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingVideoContent","sort":39,"group":null}	\N	\N
256	262	directus_fields	42	{"id":42,"collection":"seo_audit","field":"missingAudioContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":40,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAudioContent","sort":40,"group":null}	\N	\N
257	263	directus_fields	43	{"id":43,"collection":"seo_audit","field":"wordCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":41,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"wordCount","sort":41,"group":null}	\N	\N
258	264	directus_fields	44	{"id":44,"collection":"seo_audit","field":"imageCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":42,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"imageCount","sort":42,"group":null}	\N	\N
259	265	directus_fields	45	{"id":45,"collection":"seo_audit","field":"brokenLinks","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":43,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"brokenLinks","sort":43,"group":null}	\N	\N
260	266	directus_fields	46	{"id":46,"collection":"seo_audit","field":"internalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":44,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinks","sort":44,"group":null}	\N	\N
261	267	directus_fields	47	{"id":47,"collection":"seo_audit","field":"externalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":45,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"externalLinks","sort":45,"group":null}	\N	\N
262	268	directus_fields	48	{"id":48,"collection":"seo_audit","field":"primaryKeyword","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":46,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"primaryKeyword","sort":46,"group":null}	\N	\N
263	269	directus_fields	49	{"id":49,"collection":"seo_audit","field":"missingKeywordOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":47,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingKeywordOpportunities","sort":47,"group":null}	\N	\N
264	270	directus_fields	50	{"id":50,"collection":"seo_audit","field":"opportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":48,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"opportunitySummary","sort":48,"group":null}	\N	\N
265	271	directus_fields	51	{"id":51,"collection":"seo_audit","field":"cityKeywordGaps","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":49,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityKeywordGaps","sort":49,"group":null}	\N	\N
266	272	directus_fields	52	{"id":52,"collection":"seo_audit","field":"rawMetrics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":50,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawMetrics","sort":50,"group":null}	\N	\N
267	273	directus_fields	53	{"id":53,"collection":"seo_audit","field":"rawContentScan","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":51,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawContentScan","sort":51,"group":null}	\N	\N
268	274	directus_fields	54	{"id":54,"collection":"seo_audit","field":"relatedServicePages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":52,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedServicePages","sort":52,"group":null}	\N	\N
269	275	directus_fields	55	{"id":55,"collection":"seo_audit","field":"relatedCityPages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":53,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedCityPages","sort":53,"group":null}	\N	\N
270	276	directus_fields	134	{"id":134,"collection":"seo_audit","field":"business","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":54,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"business","sort":54,"group":null}	\N	\N
271	277	directus_fields	56	{"id":56,"collection":"seo_audit","field":"internalLinkOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":55,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinkOpportunities","sort":55,"group":null}	\N	\N
272	278	directus_fields	57	{"id":57,"collection":"seo_audit","field":"conversionOpportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":56,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"conversionOpportunitySummary","sort":56,"group":null}	\N	\N
273	279	directus_fields	58	{"id":58,"collection":"seo_audit","field":"buyerIntenKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":57,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"buyerIntenKeywords","sort":57,"group":null}	\N	\N
274	280	directus_fields	59	{"id":59,"collection":"seo_audit","field":"nearMeKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":58,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeKeywords","sort":58,"group":null}	\N	\N
275	281	directus_fields	60	{"id":60,"collection":"seo_audit","field":"openNowKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":59,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"openNowKeywords","sort":59,"group":null}	\N	\N
276	282	directus_fields	61	{"id":61,"collection":"seo_audit","field":"localDiscountKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":60,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localDiscountKeywords","sort":60,"group":null}	\N	\N
277	283	directus_fields	62	{"id":62,"collection":"seo_audit","field":"serviceIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":61,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"serviceIntentKeywords","sort":61,"group":null}	\N	\N
278	284	directus_fields	63	{"id":63,"collection":"seo_audit","field":"neighborhoodKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":62,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"neighborhoodKeywords","sort":62,"group":null}	\N	\N
279	285	directus_fields	64	{"id":64,"collection":"seo_audit","field":"cityIntentGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":63,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityIntentGaps","sort":63,"group":null}	\N	\N
280	286	directus_fields	65	{"id":65,"collection":"seo_audit","field":"geoCoverageGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":64,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"geoCoverageGaps","sort":64,"group":null}	\N	\N
281	287	directus_fields	66	{"id":66,"collection":"seo_audit","field":"localCompetitionGap","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":65,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localCompetitionGap","sort":65,"group":null}	\N	\N
282	288	directus_fields	67	{"id":67,"collection":"seo_audit","field":"categoryKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":66,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"categoryKeywords","sort":66,"group":null}	\N	\N
283	289	directus_fields	68	{"id":68,"collection":"seo_audit","field":"dealIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":67,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealIntentKeywords","sort":67,"group":null}	\N	\N
284	290	directus_fields	69	{"id":69,"collection":"seo_audit","field":"recommendedImagePrompts","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":68,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedImagePrompts","sort":68,"group":null}	\N	\N
285	291	directus_fields	71	{"id":71,"collection":"seo_audit","field":"recommendedAudioTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":69,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedAudioTopics","sort":69,"group":null}	\N	\N
286	292	directus_fields	72	{"id":72,"collection":"seo_audit","field":"recommendedVideoTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":70,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedVideoTopics","sort":70,"group":null}	\N	\N
287	293	directus_fields	1	{"id":1,"collection":"seo_audit","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"id","sort":1,"group":null}	\N	\N
288	294	directus_fields	4	{"id":4,"collection":"seo_audit","field":"domain","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"domain","sort":2,"group":null}	\N	\N
289	295	directus_fields	5	{"id":5,"collection":"seo_audit","field":"auditDate","special":null,"interface":"datetime","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"auditDate","sort":3,"group":null}	\N	\N
290	296	directus_fields	6	{"id":6,"collection":"seo_audit","field":"meataScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"meataScore","sort":4,"group":null}	\N	\N
291	297	directus_fields	7	{"id":7,"collection":"seo_audit","field":"contentScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"contentScore","sort":5,"group":null}	\N	\N
292	298	directus_fields	8	{"id":8,"collection":"seo_audit","field":"performanceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"performanceScore","sort":6,"group":null}	\N	\N
293	299	directus_fields	9	{"id":9,"collection":"seo_audit","field":"localSeoScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSeoScore","sort":7,"group":null}	\N	\N
294	300	directus_fields	10	{"id":10,"collection":"seo_audit","field":"technicalScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"technicalScore","sort":8,"group":null}	\N	\N
295	301	directus_fields	11	{"id":11,"collection":"seo_audit","field":"overallScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"overallScore","sort":9,"group":null}	\N	\N
296	302	directus_fields	12	{"id":12,"collection":"seo_audit","field":"entityClarityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityClarityScore","sort":10,"group":null}	\N	\N
297	303	directus_fields	13	{"id":13,"collection":"seo_audit","field":"aiFactScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiFactScore","sort":11,"group":null}	\N	\N
298	304	directus_fields	14	{"id":14,"collection":"seo_audit","field":"informationCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"informationCompletenessScore","sort":12,"group":null}	\N	\N
299	305	directus_fields	15	{"id":15,"collection":"seo_audit","field":"adwordsOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"adwordsOpportunityScore","sort":13,"group":null}	\N	\N
300	306	directus_fields	16	{"id":16,"collection":"seo_audit","field":"localRankOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localRankOpportunityScore","sort":14,"group":null}	\N	\N
301	307	directus_fields	17	{"id":17,"collection":"seo_audit","field":"voiceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"voiceScore","sort":15,"group":null}	\N	\N
302	308	directus_fields	18	{"id":18,"collection":"seo_audit","field":"aiVisibilityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":16,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiVisibilityScore","sort":16,"group":null}	\N	\N
303	309	directus_fields	19	{"id":19,"collection":"seo_audit","field":"aiContentCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":17,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiContentCompletenessScore","sort":17,"group":null}	\N	\N
304	310	directus_fields	20	{"id":20,"collection":"seo_audit","field":"missingAIDataPoints","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":18,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAIDataPoints","sort":18,"group":null}	\N	\N
305	311	directus_fields	21	{"id":21,"collection":"seo_audit","field":"entityConfusionRisk","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":19,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityConfusionRisk","sort":19,"group":null}	\N	\N
306	312	directus_fields	22	{"id":22,"collection":"seo_audit","field":"valueIntentValueScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":20,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"valueIntentValueScore","sort":20,"group":null}	\N	\N
307	313	directus_fields	23	{"id":23,"collection":"seo_audit","field":"localSearchOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":21,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSearchOpportunityScore","sort":21,"group":null}	\N	\N
308	314	directus_fields	24	{"id":24,"collection":"seo_audit","field":"nearMeRankingScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":22,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeRankingScore","sort":22,"group":null}	\N	\N
309	315	directus_fields	25	{"id":25,"collection":"seo_audit","field":"dealOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":23,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealOpportunityScore","sort":23,"group":null}	\N	\N
310	316	directus_fields	26	{"id":26,"collection":"seo_audit","field":"multiModalOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":24,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"multiModalOpportunityScore","sort":24,"group":null}	\N	\N
311	317	directus_fields	27	{"id":27,"collection":"seo_audit","field":"hasMetaTitle","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":25,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaTitle","sort":25,"group":null}	\N	\N
312	318	directus_fields	28	{"id":28,"collection":"seo_audit","field":"hasMetaDescription","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":26,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaDescription","sort":26,"group":null}	\N	\N
313	319	directus_fields	29	{"id":29,"collection":"seo_audit","field":"hasOgTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":27,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasOgTags","sort":27,"group":null}	\N	\N
314	320	directus_fields	30	{"id":30,"collection":"seo_audit","field":"hasTwitterCards","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":28,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasTwitterCards","sort":28,"group":null}	\N	\N
315	321	directus_fields	31	{"id":31,"collection":"seo_audit","field":"hasSchemaLD","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":29,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSchemaLD","sort":29,"group":null}	\N	\N
316	322	directus_fields	32	{"id":32,"collection":"seo_audit","field":"hasRobotsTXT","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":30,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasRobotsTXT","sort":30,"group":null}	\N	\N
317	323	directus_fields	33	{"id":33,"collection":"seo_audit","field":"hasSiteMap","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":31,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSiteMap","sort":31,"group":null}	\N	\N
318	324	directus_fields	34	{"id":34,"collection":"seo_audit","field":"hasSSL","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":32,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSSL","sort":32,"group":null}	\N	\N
319	325	directus_fields	35	{"id":35,"collection":"seo_audit","field":"hasMobileFriendly","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":33,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMobileFriendly","sort":33,"group":null}	\N	\N
320	326	directus_fields	36	{"id":36,"collection":"seo_audit","field":"hasAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":34,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasAltTags","sort":34,"group":null}	\N	\N
321	327	directus_fields	37	{"id":37,"collection":"seo_audit","field":"hasH1H2Structure","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":35,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasH1H2Structure","sort":35,"group":null}	\N	\N
322	328	directus_fields	38	{"id":38,"collection":"seo_audit","field":"missingPages","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":36,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingPages","sort":36,"group":null}	\N	\N
323	329	directus_fields	39	{"id":39,"collection":"seo_audit","field":"missingSocialProfile","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":37,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingSocialProfile","sort":37,"group":null}	\N	\N
324	330	directus_fields	40	{"id":40,"collection":"seo_audit","field":"missingImageAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":38,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingImageAltTags","sort":38,"group":null}	\N	\N
325	331	directus_fields	41	{"id":41,"collection":"seo_audit","field":"missingVideoContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":39,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingVideoContent","sort":39,"group":null}	\N	\N
326	332	directus_fields	134	{"id":134,"collection":"seo_audit","field":"business","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":40,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"business","sort":40,"group":null}	\N	\N
327	333	directus_fields	42	{"id":42,"collection":"seo_audit","field":"missingAudioContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":41,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAudioContent","sort":41,"group":null}	\N	\N
328	334	directus_fields	43	{"id":43,"collection":"seo_audit","field":"wordCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":42,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"wordCount","sort":42,"group":null}	\N	\N
329	335	directus_fields	44	{"id":44,"collection":"seo_audit","field":"imageCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":43,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"imageCount","sort":43,"group":null}	\N	\N
330	336	directus_fields	45	{"id":45,"collection":"seo_audit","field":"brokenLinks","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":44,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"brokenLinks","sort":44,"group":null}	\N	\N
331	337	directus_fields	46	{"id":46,"collection":"seo_audit","field":"internalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":45,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinks","sort":45,"group":null}	\N	\N
332	338	directus_fields	47	{"id":47,"collection":"seo_audit","field":"externalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":46,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"externalLinks","sort":46,"group":null}	\N	\N
333	339	directus_fields	48	{"id":48,"collection":"seo_audit","field":"primaryKeyword","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":47,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"primaryKeyword","sort":47,"group":null}	\N	\N
334	340	directus_fields	49	{"id":49,"collection":"seo_audit","field":"missingKeywordOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":48,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingKeywordOpportunities","sort":48,"group":null}	\N	\N
335	341	directus_fields	50	{"id":50,"collection":"seo_audit","field":"opportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":49,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"opportunitySummary","sort":49,"group":null}	\N	\N
336	342	directus_fields	51	{"id":51,"collection":"seo_audit","field":"cityKeywordGaps","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":50,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityKeywordGaps","sort":50,"group":null}	\N	\N
337	343	directus_fields	52	{"id":52,"collection":"seo_audit","field":"rawMetrics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":51,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawMetrics","sort":51,"group":null}	\N	\N
338	344	directus_fields	53	{"id":53,"collection":"seo_audit","field":"rawContentScan","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":52,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawContentScan","sort":52,"group":null}	\N	\N
339	345	directus_fields	54	{"id":54,"collection":"seo_audit","field":"relatedServicePages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":53,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedServicePages","sort":53,"group":null}	\N	\N
340	346	directus_fields	55	{"id":55,"collection":"seo_audit","field":"relatedCityPages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":54,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedCityPages","sort":54,"group":null}	\N	\N
341	347	directus_fields	56	{"id":56,"collection":"seo_audit","field":"internalLinkOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":55,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinkOpportunities","sort":55,"group":null}	\N	\N
342	348	directus_fields	57	{"id":57,"collection":"seo_audit","field":"conversionOpportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":56,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"conversionOpportunitySummary","sort":56,"group":null}	\N	\N
343	349	directus_fields	58	{"id":58,"collection":"seo_audit","field":"buyerIntenKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":57,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"buyerIntenKeywords","sort":57,"group":null}	\N	\N
344	350	directus_fields	59	{"id":59,"collection":"seo_audit","field":"nearMeKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":58,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeKeywords","sort":58,"group":null}	\N	\N
345	351	directus_fields	60	{"id":60,"collection":"seo_audit","field":"openNowKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":59,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"openNowKeywords","sort":59,"group":null}	\N	\N
346	352	directus_fields	61	{"id":61,"collection":"seo_audit","field":"localDiscountKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":60,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localDiscountKeywords","sort":60,"group":null}	\N	\N
504	513	directus_fields	140	{"sort":5,"special":["cast-json"],"collection":"business_intel_reports","field":"payload"}	{"sort":5,"special":["cast-json"],"collection":"business_intel_reports","field":"payload"}	\N	\N
347	353	directus_fields	62	{"id":62,"collection":"seo_audit","field":"serviceIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":61,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"serviceIntentKeywords","sort":61,"group":null}	\N	\N
348	354	directus_fields	63	{"id":63,"collection":"seo_audit","field":"neighborhoodKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":62,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"neighborhoodKeywords","sort":62,"group":null}	\N	\N
349	355	directus_fields	64	{"id":64,"collection":"seo_audit","field":"cityIntentGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":63,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityIntentGaps","sort":63,"group":null}	\N	\N
350	356	directus_fields	65	{"id":65,"collection":"seo_audit","field":"geoCoverageGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":64,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"geoCoverageGaps","sort":64,"group":null}	\N	\N
351	357	directus_fields	66	{"id":66,"collection":"seo_audit","field":"localCompetitionGap","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":65,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localCompetitionGap","sort":65,"group":null}	\N	\N
352	358	directus_fields	67	{"id":67,"collection":"seo_audit","field":"categoryKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":66,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"categoryKeywords","sort":66,"group":null}	\N	\N
353	359	directus_fields	68	{"id":68,"collection":"seo_audit","field":"dealIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":67,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealIntentKeywords","sort":67,"group":null}	\N	\N
354	360	directus_fields	69	{"id":69,"collection":"seo_audit","field":"recommendedImagePrompts","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":68,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedImagePrompts","sort":68,"group":null}	\N	\N
355	361	directus_fields	71	{"id":71,"collection":"seo_audit","field":"recommendedAudioTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":69,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedAudioTopics","sort":69,"group":null}	\N	\N
356	362	directus_fields	72	{"id":72,"collection":"seo_audit","field":"recommendedVideoTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":70,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedVideoTopics","sort":70,"group":null}	\N	\N
357	363	directus_fields	1	{"id":1,"collection":"seo_audit","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"id","sort":1,"group":null}	\N	\N
358	364	directus_fields	4	{"id":4,"collection":"seo_audit","field":"domain","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"domain","sort":2,"group":null}	\N	\N
359	365	directus_fields	5	{"id":5,"collection":"seo_audit","field":"auditDate","special":null,"interface":"datetime","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"auditDate","sort":3,"group":null}	\N	\N
360	366	directus_fields	6	{"id":6,"collection":"seo_audit","field":"meataScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"meataScore","sort":4,"group":null}	\N	\N
361	367	directus_fields	7	{"id":7,"collection":"seo_audit","field":"contentScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"contentScore","sort":5,"group":null}	\N	\N
362	368	directus_fields	8	{"id":8,"collection":"seo_audit","field":"performanceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"performanceScore","sort":6,"group":null}	\N	\N
363	369	directus_fields	9	{"id":9,"collection":"seo_audit","field":"localSeoScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSeoScore","sort":7,"group":null}	\N	\N
505	514	directus_roles	85bf971e-6a2f-4ac8-8e78-32069eb6667e	{"name":"Business Intel Engine"}	{"name":"Business Intel Engine"}	\N	\N
364	370	directus_fields	10	{"id":10,"collection":"seo_audit","field":"technicalScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"technicalScore","sort":8,"group":null}	\N	\N
365	371	directus_fields	11	{"id":11,"collection":"seo_audit","field":"overallScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"overallScore","sort":9,"group":null}	\N	\N
366	372	directus_fields	12	{"id":12,"collection":"seo_audit","field":"entityClarityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityClarityScore","sort":10,"group":null}	\N	\N
367	373	directus_fields	13	{"id":13,"collection":"seo_audit","field":"aiFactScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiFactScore","sort":11,"group":null}	\N	\N
368	374	directus_fields	14	{"id":14,"collection":"seo_audit","field":"informationCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"informationCompletenessScore","sort":12,"group":null}	\N	\N
369	375	directus_fields	15	{"id":15,"collection":"seo_audit","field":"adwordsOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"adwordsOpportunityScore","sort":13,"group":null}	\N	\N
370	376	directus_fields	16	{"id":16,"collection":"seo_audit","field":"localRankOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localRankOpportunityScore","sort":14,"group":null}	\N	\N
371	377	directus_fields	17	{"id":17,"collection":"seo_audit","field":"voiceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"voiceScore","sort":15,"group":null}	\N	\N
372	378	directus_fields	18	{"id":18,"collection":"seo_audit","field":"aiVisibilityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":16,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiVisibilityScore","sort":16,"group":null}	\N	\N
373	379	directus_fields	19	{"id":19,"collection":"seo_audit","field":"aiContentCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":17,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiContentCompletenessScore","sort":17,"group":null}	\N	\N
374	380	directus_fields	20	{"id":20,"collection":"seo_audit","field":"missingAIDataPoints","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":18,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAIDataPoints","sort":18,"group":null}	\N	\N
375	381	directus_fields	21	{"id":21,"collection":"seo_audit","field":"entityConfusionRisk","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":19,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityConfusionRisk","sort":19,"group":null}	\N	\N
376	382	directus_fields	22	{"id":22,"collection":"seo_audit","field":"valueIntentValueScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":20,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"valueIntentValueScore","sort":20,"group":null}	\N	\N
377	383	directus_fields	23	{"id":23,"collection":"seo_audit","field":"localSearchOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":21,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSearchOpportunityScore","sort":21,"group":null}	\N	\N
378	384	directus_fields	24	{"id":24,"collection":"seo_audit","field":"nearMeRankingScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":22,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeRankingScore","sort":22,"group":null}	\N	\N
379	385	directus_fields	25	{"id":25,"collection":"seo_audit","field":"dealOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":23,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealOpportunityScore","sort":23,"group":null}	\N	\N
380	386	directus_fields	26	{"id":26,"collection":"seo_audit","field":"multiModalOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":24,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"multiModalOpportunityScore","sort":24,"group":null}	\N	\N
381	387	directus_fields	27	{"id":27,"collection":"seo_audit","field":"hasMetaTitle","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":25,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaTitle","sort":25,"group":null}	\N	\N
382	388	directus_fields	28	{"id":28,"collection":"seo_audit","field":"hasMetaDescription","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":26,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaDescription","sort":26,"group":null}	\N	\N
383	389	directus_fields	29	{"id":29,"collection":"seo_audit","field":"hasOgTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":27,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasOgTags","sort":27,"group":null}	\N	\N
384	390	directus_fields	30	{"id":30,"collection":"seo_audit","field":"hasTwitterCards","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":28,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasTwitterCards","sort":28,"group":null}	\N	\N
385	391	directus_fields	31	{"id":31,"collection":"seo_audit","field":"hasSchemaLD","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":29,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSchemaLD","sort":29,"group":null}	\N	\N
386	392	directus_fields	32	{"id":32,"collection":"seo_audit","field":"hasRobotsTXT","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":30,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasRobotsTXT","sort":30,"group":null}	\N	\N
387	393	directus_fields	33	{"id":33,"collection":"seo_audit","field":"hasSiteMap","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":31,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSiteMap","sort":31,"group":null}	\N	\N
388	394	directus_fields	134	{"id":134,"collection":"seo_audit","field":"business","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":32,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"business","sort":32,"group":null}	\N	\N
389	395	directus_fields	34	{"id":34,"collection":"seo_audit","field":"hasSSL","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":33,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSSL","sort":33,"group":null}	\N	\N
390	396	directus_fields	35	{"id":35,"collection":"seo_audit","field":"hasMobileFriendly","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":34,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMobileFriendly","sort":34,"group":null}	\N	\N
391	397	directus_fields	36	{"id":36,"collection":"seo_audit","field":"hasAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":35,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasAltTags","sort":35,"group":null}	\N	\N
392	398	directus_fields	37	{"id":37,"collection":"seo_audit","field":"hasH1H2Structure","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":36,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasH1H2Structure","sort":36,"group":null}	\N	\N
393	399	directus_fields	38	{"id":38,"collection":"seo_audit","field":"missingPages","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":37,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingPages","sort":37,"group":null}	\N	\N
394	400	directus_fields	39	{"id":39,"collection":"seo_audit","field":"missingSocialProfile","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":38,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingSocialProfile","sort":38,"group":null}	\N	\N
395	401	directus_fields	40	{"id":40,"collection":"seo_audit","field":"missingImageAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":39,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingImageAltTags","sort":39,"group":null}	\N	\N
396	402	directus_fields	41	{"id":41,"collection":"seo_audit","field":"missingVideoContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":40,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingVideoContent","sort":40,"group":null}	\N	\N
397	403	directus_fields	42	{"id":42,"collection":"seo_audit","field":"missingAudioContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":41,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAudioContent","sort":41,"group":null}	\N	\N
398	404	directus_fields	43	{"id":43,"collection":"seo_audit","field":"wordCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":42,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"wordCount","sort":42,"group":null}	\N	\N
399	405	directus_fields	44	{"id":44,"collection":"seo_audit","field":"imageCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":43,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"imageCount","sort":43,"group":null}	\N	\N
400	406	directus_fields	45	{"id":45,"collection":"seo_audit","field":"brokenLinks","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":44,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"brokenLinks","sort":44,"group":null}	\N	\N
401	407	directus_fields	46	{"id":46,"collection":"seo_audit","field":"internalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":45,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinks","sort":45,"group":null}	\N	\N
402	408	directus_fields	47	{"id":47,"collection":"seo_audit","field":"externalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":46,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"externalLinks","sort":46,"group":null}	\N	\N
403	409	directus_fields	48	{"id":48,"collection":"seo_audit","field":"primaryKeyword","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":47,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"primaryKeyword","sort":47,"group":null}	\N	\N
404	410	directus_fields	49	{"id":49,"collection":"seo_audit","field":"missingKeywordOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":48,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingKeywordOpportunities","sort":48,"group":null}	\N	\N
405	411	directus_fields	50	{"id":50,"collection":"seo_audit","field":"opportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":49,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"opportunitySummary","sort":49,"group":null}	\N	\N
406	412	directus_fields	51	{"id":51,"collection":"seo_audit","field":"cityKeywordGaps","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":50,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityKeywordGaps","sort":50,"group":null}	\N	\N
407	413	directus_fields	52	{"id":52,"collection":"seo_audit","field":"rawMetrics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":51,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawMetrics","sort":51,"group":null}	\N	\N
408	414	directus_fields	53	{"id":53,"collection":"seo_audit","field":"rawContentScan","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":52,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawContentScan","sort":52,"group":null}	\N	\N
409	415	directus_fields	54	{"id":54,"collection":"seo_audit","field":"relatedServicePages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":53,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedServicePages","sort":53,"group":null}	\N	\N
410	416	directus_fields	55	{"id":55,"collection":"seo_audit","field":"relatedCityPages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":54,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedCityPages","sort":54,"group":null}	\N	\N
411	417	directus_fields	56	{"id":56,"collection":"seo_audit","field":"internalLinkOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":55,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinkOpportunities","sort":55,"group":null}	\N	\N
412	418	directus_fields	57	{"id":57,"collection":"seo_audit","field":"conversionOpportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":56,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"conversionOpportunitySummary","sort":56,"group":null}	\N	\N
413	419	directus_fields	58	{"id":58,"collection":"seo_audit","field":"buyerIntenKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":57,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"buyerIntenKeywords","sort":57,"group":null}	\N	\N
414	420	directus_fields	59	{"id":59,"collection":"seo_audit","field":"nearMeKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":58,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeKeywords","sort":58,"group":null}	\N	\N
415	421	directus_fields	60	{"id":60,"collection":"seo_audit","field":"openNowKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":59,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"openNowKeywords","sort":59,"group":null}	\N	\N
416	422	directus_fields	61	{"id":61,"collection":"seo_audit","field":"localDiscountKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":60,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localDiscountKeywords","sort":60,"group":null}	\N	\N
417	423	directus_fields	62	{"id":62,"collection":"seo_audit","field":"serviceIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":61,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"serviceIntentKeywords","sort":61,"group":null}	\N	\N
418	424	directus_fields	63	{"id":63,"collection":"seo_audit","field":"neighborhoodKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":62,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"neighborhoodKeywords","sort":62,"group":null}	\N	\N
419	425	directus_fields	64	{"id":64,"collection":"seo_audit","field":"cityIntentGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":63,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityIntentGaps","sort":63,"group":null}	\N	\N
420	426	directus_fields	65	{"id":65,"collection":"seo_audit","field":"geoCoverageGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":64,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"geoCoverageGaps","sort":64,"group":null}	\N	\N
421	427	directus_fields	66	{"id":66,"collection":"seo_audit","field":"localCompetitionGap","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":65,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localCompetitionGap","sort":65,"group":null}	\N	\N
422	428	directus_fields	67	{"id":67,"collection":"seo_audit","field":"categoryKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":66,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"categoryKeywords","sort":66,"group":null}	\N	\N
423	429	directus_fields	68	{"id":68,"collection":"seo_audit","field":"dealIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":67,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealIntentKeywords","sort":67,"group":null}	\N	\N
424	430	directus_fields	69	{"id":69,"collection":"seo_audit","field":"recommendedImagePrompts","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":68,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedImagePrompts","sort":68,"group":null}	\N	\N
425	431	directus_fields	71	{"id":71,"collection":"seo_audit","field":"recommendedAudioTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":69,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedAudioTopics","sort":69,"group":null}	\N	\N
426	432	directus_fields	72	{"id":72,"collection":"seo_audit","field":"recommendedVideoTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":70,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedVideoTopics","sort":70,"group":null}	\N	\N
427	433	directus_fields	1	{"id":1,"collection":"seo_audit","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"id","sort":1,"group":null}	\N	\N
428	434	directus_fields	4	{"id":4,"collection":"seo_audit","field":"domain","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"domain","sort":2,"group":null}	\N	\N
429	435	directus_fields	5	{"id":5,"collection":"seo_audit","field":"auditDate","special":null,"interface":"datetime","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"auditDate","sort":3,"group":null}	\N	\N
430	436	directus_fields	6	{"id":6,"collection":"seo_audit","field":"meataScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"meataScore","sort":4,"group":null}	\N	\N
431	437	directus_fields	7	{"id":7,"collection":"seo_audit","field":"contentScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"contentScore","sort":5,"group":null}	\N	\N
432	438	directus_fields	8	{"id":8,"collection":"seo_audit","field":"performanceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"performanceScore","sort":6,"group":null}	\N	\N
433	439	directus_fields	9	{"id":9,"collection":"seo_audit","field":"localSeoScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSeoScore","sort":7,"group":null}	\N	\N
434	440	directus_fields	10	{"id":10,"collection":"seo_audit","field":"technicalScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"technicalScore","sort":8,"group":null}	\N	\N
435	441	directus_fields	11	{"id":11,"collection":"seo_audit","field":"overallScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"overallScore","sort":9,"group":null}	\N	\N
436	442	directus_fields	12	{"id":12,"collection":"seo_audit","field":"entityClarityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityClarityScore","sort":10,"group":null}	\N	\N
437	443	directus_fields	13	{"id":13,"collection":"seo_audit","field":"aiFactScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiFactScore","sort":11,"group":null}	\N	\N
438	444	directus_fields	14	{"id":14,"collection":"seo_audit","field":"informationCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":12,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"informationCompletenessScore","sort":12,"group":null}	\N	\N
439	445	directus_fields	15	{"id":15,"collection":"seo_audit","field":"adwordsOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"adwordsOpportunityScore","sort":13,"group":null}	\N	\N
440	446	directus_fields	16	{"id":16,"collection":"seo_audit","field":"localRankOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":14,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localRankOpportunityScore","sort":14,"group":null}	\N	\N
441	447	directus_fields	17	{"id":17,"collection":"seo_audit","field":"voiceScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"voiceScore","sort":15,"group":null}	\N	\N
442	448	directus_fields	18	{"id":18,"collection":"seo_audit","field":"aiVisibilityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":16,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiVisibilityScore","sort":16,"group":null}	\N	\N
443	449	directus_fields	19	{"id":19,"collection":"seo_audit","field":"aiContentCompletenessScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":17,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"aiContentCompletenessScore","sort":17,"group":null}	\N	\N
444	450	directus_fields	20	{"id":20,"collection":"seo_audit","field":"missingAIDataPoints","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":18,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAIDataPoints","sort":18,"group":null}	\N	\N
445	451	directus_fields	21	{"id":21,"collection":"seo_audit","field":"entityConfusionRisk","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":19,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"entityConfusionRisk","sort":19,"group":null}	\N	\N
446	452	directus_fields	22	{"id":22,"collection":"seo_audit","field":"valueIntentValueScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":20,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"valueIntentValueScore","sort":20,"group":null}	\N	\N
447	453	directus_fields	23	{"id":23,"collection":"seo_audit","field":"localSearchOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":21,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localSearchOpportunityScore","sort":21,"group":null}	\N	\N
448	454	directus_fields	24	{"id":24,"collection":"seo_audit","field":"nearMeRankingScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":22,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeRankingScore","sort":22,"group":null}	\N	\N
449	455	directus_fields	25	{"id":25,"collection":"seo_audit","field":"dealOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":23,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealOpportunityScore","sort":23,"group":null}	\N	\N
450	456	directus_fields	134	{"id":134,"collection":"seo_audit","field":"business","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":24,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"business","sort":24,"group":null}	\N	\N
451	457	directus_fields	26	{"id":26,"collection":"seo_audit","field":"multiModalOpportunityScore","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":25,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"multiModalOpportunityScore","sort":25,"group":null}	\N	\N
452	458	directus_fields	27	{"id":27,"collection":"seo_audit","field":"hasMetaTitle","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":26,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaTitle","sort":26,"group":null}	\N	\N
453	459	directus_fields	28	{"id":28,"collection":"seo_audit","field":"hasMetaDescription","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":27,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMetaDescription","sort":27,"group":null}	\N	\N
454	460	directus_fields	29	{"id":29,"collection":"seo_audit","field":"hasOgTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":28,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasOgTags","sort":28,"group":null}	\N	\N
455	461	directus_fields	30	{"id":30,"collection":"seo_audit","field":"hasTwitterCards","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":29,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasTwitterCards","sort":29,"group":null}	\N	\N
456	462	directus_fields	31	{"id":31,"collection":"seo_audit","field":"hasSchemaLD","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":30,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSchemaLD","sort":30,"group":null}	\N	\N
457	463	directus_fields	32	{"id":32,"collection":"seo_audit","field":"hasRobotsTXT","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":31,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasRobotsTXT","sort":31,"group":null}	\N	\N
458	464	directus_fields	33	{"id":33,"collection":"seo_audit","field":"hasSiteMap","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":32,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSiteMap","sort":32,"group":null}	\N	\N
459	465	directus_fields	34	{"id":34,"collection":"seo_audit","field":"hasSSL","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":33,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasSSL","sort":33,"group":null}	\N	\N
460	466	directus_fields	35	{"id":35,"collection":"seo_audit","field":"hasMobileFriendly","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":34,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasMobileFriendly","sort":34,"group":null}	\N	\N
461	467	directus_fields	36	{"id":36,"collection":"seo_audit","field":"hasAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":35,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasAltTags","sort":35,"group":null}	\N	\N
462	468	directus_fields	37	{"id":37,"collection":"seo_audit","field":"hasH1H2Structure","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":36,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"hasH1H2Structure","sort":36,"group":null}	\N	\N
463	469	directus_fields	38	{"id":38,"collection":"seo_audit","field":"missingPages","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":37,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingPages","sort":37,"group":null}	\N	\N
464	470	directus_fields	39	{"id":39,"collection":"seo_audit","field":"missingSocialProfile","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":38,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingSocialProfile","sort":38,"group":null}	\N	\N
465	471	directus_fields	40	{"id":40,"collection":"seo_audit","field":"missingImageAltTags","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":39,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingImageAltTags","sort":39,"group":null}	\N	\N
466	472	directus_fields	41	{"id":41,"collection":"seo_audit","field":"missingVideoContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":40,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingVideoContent","sort":40,"group":null}	\N	\N
467	473	directus_fields	42	{"id":42,"collection":"seo_audit","field":"missingAudioContent","special":["cast-boolean"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":41,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingAudioContent","sort":41,"group":null}	\N	\N
468	474	directus_fields	43	{"id":43,"collection":"seo_audit","field":"wordCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":42,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"wordCount","sort":42,"group":null}	\N	\N
469	475	directus_fields	44	{"id":44,"collection":"seo_audit","field":"imageCount","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":43,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"imageCount","sort":43,"group":null}	\N	\N
470	476	directus_fields	45	{"id":45,"collection":"seo_audit","field":"brokenLinks","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":44,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"brokenLinks","sort":44,"group":null}	\N	\N
471	477	directus_fields	46	{"id":46,"collection":"seo_audit","field":"internalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":45,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinks","sort":45,"group":null}	\N	\N
472	478	directus_fields	47	{"id":47,"collection":"seo_audit","field":"externalLinks","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":46,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"externalLinks","sort":46,"group":null}	\N	\N
473	479	directus_fields	48	{"id":48,"collection":"seo_audit","field":"primaryKeyword","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":47,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"primaryKeyword","sort":47,"group":null}	\N	\N
474	480	directus_fields	49	{"id":49,"collection":"seo_audit","field":"missingKeywordOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":48,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"missingKeywordOpportunities","sort":48,"group":null}	\N	\N
475	481	directus_fields	50	{"id":50,"collection":"seo_audit","field":"opportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":49,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"opportunitySummary","sort":49,"group":null}	\N	\N
476	482	directus_fields	51	{"id":51,"collection":"seo_audit","field":"cityKeywordGaps","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":50,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityKeywordGaps","sort":50,"group":null}	\N	\N
477	483	directus_fields	52	{"id":52,"collection":"seo_audit","field":"rawMetrics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":51,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawMetrics","sort":51,"group":null}	\N	\N
478	484	directus_fields	53	{"id":53,"collection":"seo_audit","field":"rawContentScan","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":52,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"rawContentScan","sort":52,"group":null}	\N	\N
479	485	directus_fields	54	{"id":54,"collection":"seo_audit","field":"relatedServicePages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":53,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedServicePages","sort":53,"group":null}	\N	\N
480	486	directus_fields	55	{"id":55,"collection":"seo_audit","field":"relatedCityPages","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":54,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"relatedCityPages","sort":54,"group":null}	\N	\N
481	487	directus_fields	56	{"id":56,"collection":"seo_audit","field":"internalLinkOpportunities","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":55,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"internalLinkOpportunities","sort":55,"group":null}	\N	\N
482	488	directus_fields	57	{"id":57,"collection":"seo_audit","field":"conversionOpportunitySummary","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":56,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"conversionOpportunitySummary","sort":56,"group":null}	\N	\N
483	489	directus_fields	58	{"id":58,"collection":"seo_audit","field":"buyerIntenKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":57,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"buyerIntenKeywords","sort":57,"group":null}	\N	\N
484	490	directus_fields	59	{"id":59,"collection":"seo_audit","field":"nearMeKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":58,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"nearMeKeywords","sort":58,"group":null}	\N	\N
485	491	directus_fields	60	{"id":60,"collection":"seo_audit","field":"openNowKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":59,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"openNowKeywords","sort":59,"group":null}	\N	\N
486	492	directus_fields	61	{"id":61,"collection":"seo_audit","field":"localDiscountKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":60,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localDiscountKeywords","sort":60,"group":null}	\N	\N
487	493	directus_fields	62	{"id":62,"collection":"seo_audit","field":"serviceIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":61,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"serviceIntentKeywords","sort":61,"group":null}	\N	\N
488	494	directus_fields	63	{"id":63,"collection":"seo_audit","field":"neighborhoodKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":62,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"neighborhoodKeywords","sort":62,"group":null}	\N	\N
489	495	directus_fields	64	{"id":64,"collection":"seo_audit","field":"cityIntentGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":63,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"cityIntentGaps","sort":63,"group":null}	\N	\N
490	496	directus_fields	65	{"id":65,"collection":"seo_audit","field":"geoCoverageGaps","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":64,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"geoCoverageGaps","sort":64,"group":null}	\N	\N
491	497	directus_fields	66	{"id":66,"collection":"seo_audit","field":"localCompetitionGap","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":65,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"localCompetitionGap","sort":65,"group":null}	\N	\N
492	498	directus_fields	67	{"id":67,"collection":"seo_audit","field":"categoryKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":66,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"categoryKeywords","sort":66,"group":null}	\N	\N
493	499	directus_fields	68	{"id":68,"collection":"seo_audit","field":"dealIntentKeywords","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":67,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"dealIntentKeywords","sort":67,"group":null}	\N	\N
494	500	directus_fields	69	{"id":69,"collection":"seo_audit","field":"recommendedImagePrompts","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":68,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedImagePrompts","sort":68,"group":null}	\N	\N
495	501	directus_fields	71	{"id":71,"collection":"seo_audit","field":"recommendedAudioTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":69,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedAudioTopics","sort":69,"group":null}	\N	\N
496	502	directus_fields	72	{"id":72,"collection":"seo_audit","field":"recommendedVideoTopics","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":70,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seo_audit","field":"recommendedVideoTopics","sort":70,"group":null}	\N	\N
497	504	directus_fields	135	{"sort":71,"interface":"input","special":null,"collection":"seo_audit","field":"metaScore"}	{"sort":71,"interface":"input","special":null,"collection":"seo_audit","field":"metaScore"}	\N	\N
498	506	directus_roles	3e0d7012-e3c5-4671-906a-42d210df64dc	{"name":"LGR Ops Hub"}	{"name":"LGR Ops Hub"}	\N	\N
499	508	directus_fields	136	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"business_intel_reports"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"business_intel_reports"}	\N	\N
500	509	directus_collections	business_intel_reports	{"singleton":false,"collection":"business_intel_reports"}	{"singleton":false,"collection":"business_intel_reports"}	\N	\N
501	510	directus_fields	137	{"sort":2,"interface":"input","special":null,"collection":"business_intel_reports","field":"primary_keyword"}	{"sort":2,"interface":"input","special":null,"collection":"business_intel_reports","field":"primary_keyword"}	\N	\N
502	511	directus_fields	138	{"sort":3,"interface":"input","special":null,"collection":"business_intel_reports","field":"location"}	{"sort":3,"interface":"input","special":null,"collection":"business_intel_reports","field":"location"}	\N	\N
507	516	directus_roles	85bf971e-6a2f-4ac8-8e78-32069eb6667e	{"id":"85bf971e-6a2f-4ac8-8e78-32069eb6667e","name":"Business Intel Engine","icon":"supervised_user_circle","description":null,"parent":"4b9c2a26-828b-4a29-92db-a4e714d6f484","children":[],"policies":[],"users":["280a3e38-bd6d-41d2-a260-593c2d615d27"]}	{"parent":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}	\N	\N
506	515	directus_users	280a3e38-bd6d-41d2-a260-593c2d615d27	{"email":"engine@lgr.ai","first_name":"BusinessIntel","last_name":"Engine","token":"**********","role":"85bf971e-6a2f-4ac8-8e78-32069eb6667e"}	{"email":"engine@lgr.ai","first_name":"BusinessIntel","last_name":"Engine","token":"**********","role":"85bf971e-6a2f-4ac8-8e78-32069eb6667e"}	507	\N
508	517	directus_fields	141	{"sort":6,"interface":"input-multiline","special":null,"collection":"business_intel_reports","field":"summary"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"business_intel_reports","field":"summary"}	\N	\N
509	518	directus_fields	142	{"sort":7,"interface":"input","special":null,"collection":"business_intel_reports","field":"sentiment_score"}	{"sort":7,"interface":"input","special":null,"collection":"business_intel_reports","field":"sentiment_score"}	\N	\N
510	519	directus_policies	3f28eae1-ef20-479d-bf86-24b4ea652cc9	{"name":"Business Intel Engine","admin_access":false,"app_access":false}	{"name":"Business Intel Engine","admin_access":false,"app_access":false}	\N	\N
511	520	directus_access	8097b12c-b5b4-4926-ad0d-3ba05636b586	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","user":{"id":"280a3e38-bd6d-41d2-a260-593c2d615d27"}}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","user":{"id":"280a3e38-bd6d-41d2-a260-593c2d615d27"}}	\N	\N
512	522	directus_access	a551b288-3e2d-4815-8ff3-c3a228d9fc78	{"role":"85bf971e-6a2f-4ac8-8e78-32069eb6667e","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	{"role":"85bf971e-6a2f-4ac8-8e78-32069eb6667e","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	\N	\N
513	524	business_intel_reports	1	{"primary_keyword":"AI Automation","summary":"AI Automation Agency in Chicago is a leading provider of innovative solutions for businesses looking to streamline their operations and improve efficiency. With a team of experts in artificial intelligence, machine learning, and automation, they offer customized services that cater to the unique needs of each client.","sentiment_score":4.5,"location":{"city":"Chicago","state":"Illinois"},"engine":"business-intel-v1","payload":{"primary_keyword":"AI Automation","sentiment_score":4.5,"summary":"AI Automation Agency in Chicago is a leading provider of innovative solutions for businesses looking to streamline their operations and improve efficiency. With a team of experts in artificial intelligence, machine learning, and automation, they offer customized services that cater to the unique needs of each client.","location":{"city":"Chicago","state":"Illinois"}}}	{"primary_keyword":"AI Automation","summary":"AI Automation Agency in Chicago is a leading provider of innovative solutions for businesses looking to streamline their operations and improve efficiency. With a team of experts in artificial intelligence, machine learning, and automation, they offer customized services that cater to the unique needs of each client.","sentiment_score":4.5,"location":{"city":"Chicago","state":"Illinois"},"engine":"business-intel-v1","payload":{"primary_keyword":"AI Automation","sentiment_score":4.5,"summary":"AI Automation Agency in Chicago is a leading provider of innovative solutions for businesses looking to streamline their operations and improve efficiency. With a team of experts in artificial intelligence, machine learning, and automation, they offer customized services that cater to the unique needs of each client.","location":{"city":"Chicago","state":"Illinois"}}}	\N	\N
514	525	directus_fields	143	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"target_cities"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"target_cities"}	\N	\N
515	526	directus_collections	target_cities	{"singleton":false,"collection":"target_cities"}	{"singleton":false,"collection":"target_cities"}	\N	\N
516	527	directus_fields	144	{"sort":2,"interface":"input","special":null,"collection":"target_cities","field":"city_name"}	{"sort":2,"interface":"input","special":null,"collection":"target_cities","field":"city_name"}	\N	\N
517	528	directus_fields	145	{"sort":3,"interface":"input","special":null,"collection":"target_cities","field":"state"}	{"sort":3,"interface":"input","special":null,"collection":"target_cities","field":"state"}	\N	\N
518	529	directus_fields	146	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"target_services"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"target_services"}	\N	\N
519	530	directus_collections	target_services	{"singleton":false,"collection":"target_services"}	{"singleton":false,"collection":"target_services"}	\N	\N
520	531	directus_fields	147	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"keyword_opportunities"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"keyword_opportunities"}	\N	\N
521	532	directus_collections	keyword_opportunities	{"singleton":false,"collection":"keyword_opportunities"}	{"singleton":false,"collection":"keyword_opportunities"}	\N	\N
522	533	directus_fields	148	{"sort":2,"interface":"input","special":null,"collection":"target_services","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"target_services","field":"name"}	\N	\N
523	534	directus_fields	149	{"sort":3,"interface":"input","special":null,"collection":"target_services","field":"category"}	{"sort":3,"interface":"input","special":null,"collection":"target_services","field":"category"}	\N	\N
524	535	directus_fields	150	{"sort":2,"interface":"input","special":null,"collection":"keyword_opportunities","field":"keyword"}	{"sort":2,"interface":"input","special":null,"collection":"keyword_opportunities","field":"keyword"}	\N	\N
525	536	directus_fields	151	{"sort":3,"interface":"input","special":null,"collection":"keyword_opportunities","field":"volume"}	{"sort":3,"interface":"input","special":null,"collection":"keyword_opportunities","field":"volume"}	\N	\N
526	537	directus_fields	152	{"sort":4,"interface":"input","special":null,"collection":"keyword_opportunities","field":"difficulty"}	{"sort":4,"interface":"input","special":null,"collection":"keyword_opportunities","field":"difficulty"}	\N	\N
527	538	directus_fields	153	{"sort":5,"interface":"input","special":null,"collection":"keyword_opportunities","field":"opportunity_score"}	{"sort":5,"interface":"input","special":null,"collection":"keyword_opportunities","field":"opportunity_score"}	\N	\N
576	595	directus_collections	audience_profiles	{"singleton":false,"collection":"audience_profiles"}	{"singleton":false,"collection":"audience_profiles"}	\N	\N
577	596	directus_fields	189	{"sort":2,"interface":"input","special":null,"collection":"audience_profiles","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"audience_profiles","field":"name"}	\N	\N
528	539	directus_fields	154	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"New","value":"New"},{"text":"Content Created","value":"Content Created"},{"text":"Published","value":"Published"}]},"collection":"keyword_opportunities","field":"status"}	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"New","value":"New"},{"text":"Content Created","value":"Content Created"},{"text":"Published","value":"Published"}]},"collection":"keyword_opportunities","field":"status"}	\N	\N
529	540	directus_fields	155	{"sort":4,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Active","value":"Active"},{"text":"Inactive","value":"Inactive"}]},"collection":"target_cities","field":"status"}	{"sort":4,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Active","value":"Active"},{"text":"Inactive","value":"Inactive"}]},"collection":"target_cities","field":"status"}	\N	\N
530	541	directus_permissions	1	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"keyword_opportunities","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"keyword_opportunities","action":"create"}	\N	\N
531	542	directus_permissions	2	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"keyword_opportunities","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"keyword_opportunities","action":"read"}	\N	\N
532	543	directus_permissions	3	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"target_services","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"target_services","action":"create"}	\N	\N
533	544	directus_permissions	4	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"target_services","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"target_services","action":"read"}	\N	\N
534	545	directus_permissions	5	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"target_cities","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"target_cities","action":"read"}	\N	\N
535	547	directus_access	87c485bc-9987-489d-8da6-fc8a945ee3cb	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","user":{"id":"280a3e38-bd6d-41d2-a260-593c2d615d27"}}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","user":{"id":"280a3e38-bd6d-41d2-a260-593c2d615d27"}}	\N	\N
536	551	directus_permissions	6	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"read"}	\N	\N
537	553	directus_access	acc9fe5a-017f-4a42-bb3c-5b5bbddbd1b3	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","user":{"id":"280a3e38-bd6d-41d2-a260-593c2d615d27"}}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","user":{"id":"280a3e38-bd6d-41d2-a260-593c2d615d27"}}	\N	\N
538	557	directus_fields	156	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_requests"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_requests"}	\N	\N
539	558	directus_collections	content_requests	{"singleton":false,"collection":"content_requests"}	{"singleton":false,"collection":"content_requests"}	\N	\N
540	559	directus_fields	157	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"pending","value":"pending"},{"text":"researching","value":"researching"},{"text":"drafting","value":"drafting"},{"text":"humanizing","value":"humanizing"},{"text":"imagery","value":"imagery"},{"text":"shortform","value":"shortform"},{"text":"ready","value":"ready"},{"text":"publishing","value":"publishing"},{"text":"published","value":"published"},{"text":"failed","value":"failed"}]},"collection":"content_requests","field":"status"}	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"pending","value":"pending"},{"text":"researching","value":"researching"},{"text":"drafting","value":"drafting"},{"text":"humanizing","value":"humanizing"},{"text":"imagery","value":"imagery"},{"text":"shortform","value":"shortform"},{"text":"ready","value":"ready"},{"text":"publishing","value":"publishing"},{"text":"published","value":"published"},{"text":"failed","value":"failed"}]},"collection":"content_requests","field":"status"}	\N	\N
541	560	directus_fields	158	{"sort":3,"interface":"input","special":null,"collection":"content_requests","field":"topic"}	{"sort":3,"interface":"input","special":null,"collection":"content_requests","field":"topic"}	\N	\N
542	561	directus_fields	159	{"sort":4,"interface":"input","special":null,"collection":"content_requests","field":"primary_keyword"}	{"sort":4,"interface":"input","special":null,"collection":"content_requests","field":"primary_keyword"}	\N	\N
543	562	directus_fields	160	{"sort":5,"interface":"input","special":null,"collection":"content_requests","field":"location"}	{"sort":5,"interface":"input","special":null,"collection":"content_requests","field":"location"}	\N	\N
544	563	directus_fields	161	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"}]},"collection":"content_requests","field":"content_type"}	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"}]},"collection":"content_requests","field":"content_type"}	\N	\N
545	564	directus_fields	161	{"id":161,"collection":"content_requests","field":"content_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"},{"text":"comparison_post","value":"comparison_post"},{"text":"legal_explainer","value":"legal_explainer"},{"text":"blog_post","value":"blog_post"},{"text":"buying_guide","value":"buying_guide"},{"text":"shortform_only","value":"shortform_only"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"content_type","options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"},{"text":"comparison_post","value":"comparison_post"},{"text":"legal_explainer","value":"legal_explainer"},{"text":"blog_post","value":"blog_post"},{"text":"buying_guide","value":"buying_guide"},{"text":"shortform_only","value":"shortform_only"}]}}	\N	\N
546	565	directus_fields	162	{"sort":7,"interface":"select-dropdown","special":null,"options":{"choices":null},"collection":"content_requests","field":"source"}	{"sort":7,"interface":"select-dropdown","special":null,"options":{"choices":null},"collection":"content_requests","field":"source"}	\N	\N
547	566	directus_fields	162	{"id":162,"collection":"content_requests","field":"source","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"manual","value":"manual"},{"text":"trend_monitor","value":"trend_monitor"},{"text":"api","value":"api"},{"text":"feed","value":"feed"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"source","options":{"choices":[{"text":"manual","value":"manual"},{"text":"trend_monitor","value":"trend_monitor"},{"text":"api","value":"api"},{"text":"feed","value":"feed"}]}}	\N	\N
548	567	directus_fields	163	{"sort":8,"special":["cast-boolean"],"collection":"content_requests","field":"auto_published"}	{"sort":8,"special":["cast-boolean"],"collection":"content_requests","field":"auto_published"}	\N	\N
549	568	directus_fields	164	{"sort":9,"special":["cast-json"],"collection":"content_requests","field":"style"}	{"sort":9,"special":["cast-json"],"collection":"content_requests","field":"style"}	\N	\N
550	569	directus_fields	165	{"sort":10,"interface":"datetime","special":null,"collection":"content_requests","field":"created_at"}	{"sort":10,"interface":"datetime","special":null,"collection":"content_requests","field":"created_at"}	\N	\N
551	570	directus_fields	166	{"sort":11,"interface":"datetime","special":null,"collection":"content_requests","field":"updated_at"}	{"sort":11,"interface":"datetime","special":null,"collection":"content_requests","field":"updated_at"}	\N	\N
552	571	directus_fields	167	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_outputs"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_outputs"}	\N	\N
553	572	directus_collections	content_outputs	{"singleton":false,"collection":"content_outputs"}	{"singleton":false,"collection":"content_outputs"}	\N	\N
554	573	directus_fields	168	{"sort":2,"special":["m2o"],"collection":"content_outputs","field":"request_id"}	{"sort":2,"special":["m2o"],"collection":"content_outputs","field":"request_id"}	\N	\N
555	574	directus_fields	169	{"sort":3,"interface":"input","special":null,"collection":"content_outputs","field":"title"}	{"sort":3,"interface":"input","special":null,"collection":"content_outputs","field":"title"}	\N	\N
556	575	directus_fields	170	{"sort":4,"interface":"input","special":null,"collection":"content_outputs","field":"slug"}	{"sort":4,"interface":"input","special":null,"collection":"content_outputs","field":"slug"}	\N	\N
557	576	directus_fields	171	{"sort":5,"interface":"input","special":null,"collection":"content_outputs","field":"meta_title"}	{"sort":5,"interface":"input","special":null,"collection":"content_outputs","field":"meta_title"}	\N	\N
558	577	directus_fields	172	{"sort":6,"interface":"input-multiline","special":null,"collection":"content_outputs","field":"meta_description"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"content_outputs","field":"meta_description"}	\N	\N
559	578	directus_fields	173	{"sort":7,"interface":"input-multiline","special":null,"collection":"content_outputs","field":"summary"}	{"sort":7,"interface":"input-multiline","special":null,"collection":"content_outputs","field":"summary"}	\N	\N
560	579	directus_fields	174	{"sort":8,"interface":"input-rich-text-md","special":null,"collection":"content_outputs","field":"outline_markdown"}	{"sort":8,"interface":"input-rich-text-md","special":null,"collection":"content_outputs","field":"outline_markdown"}	\N	\N
561	580	directus_fields	175	{"sort":9,"interface":"input-rich-text-md","special":null,"collection":"content_outputs","field":"body_markdown"}	{"sort":9,"interface":"input-rich-text-md","special":null,"collection":"content_outputs","field":"body_markdown"}	\N	\N
562	581	directus_fields	176	{"sort":10,"interface":"input","special":null,"collection":"content_outputs","field":"seo_score"}	{"sort":10,"interface":"input","special":null,"collection":"content_outputs","field":"seo_score"}	\N	\N
563	582	directus_fields	177	{"sort":11,"interface":"input-code","special":null,"collection":"content_outputs","field":"body_html"}	{"sort":11,"interface":"input-code","special":null,"collection":"content_outputs","field":"body_html"}	\N	\N
564	583	directus_fields	178	{"sort":12,"interface":"input","special":null,"collection":"content_outputs","field":"published_url"}	{"sort":12,"interface":"input","special":null,"collection":"content_outputs","field":"published_url"}	\N	\N
565	584	directus_fields	179	{"sort":13,"special":["cast-json"],"collection":"content_outputs","field":"schema_json"}	{"sort":13,"special":["cast-json"],"collection":"content_outputs","field":"schema_json"}	\N	\N
566	585	directus_fields	180	{"sort":14,"special":["cast-json"],"collection":"content_outputs","field":"faqs"}	{"sort":14,"special":["cast-json"],"collection":"content_outputs","field":"faqs"}	\N	\N
567	586	directus_fields	181	{"sort":15,"special":["cast-json"],"collection":"content_outputs","field":"short_form_snippets"}	{"sort":15,"special":["cast-json"],"collection":"content_outputs","field":"short_form_snippets"}	\N	\N
568	587	directus_fields	182	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"writing_personas"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"writing_personas"}	\N	\N
569	588	directus_collections	writing_personas	{"singleton":false,"collection":"writing_personas"}	{"singleton":false,"collection":"writing_personas"}	\N	\N
570	589	directus_fields	183	{"sort":2,"interface":"input","special":null,"collection":"writing_personas","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"writing_personas","field":"name"}	\N	\N
571	590	directus_fields	184	{"sort":3,"interface":"input-multiline","special":null,"collection":"writing_personas","field":"description"}	{"sort":3,"interface":"input-multiline","special":null,"collection":"writing_personas","field":"description"}	\N	\N
572	591	directus_fields	185	{"sort":4,"interface":"input-rich-text-md","special":null,"collection":"writing_personas","field":"style_notes"}	{"sort":4,"interface":"input-rich-text-md","special":null,"collection":"writing_personas","field":"style_notes"}	\N	\N
573	592	directus_fields	186	{"sort":5,"special":["cast-json"],"collection":"writing_personas","field":"default_industries"}	{"sort":5,"special":["cast-json"],"collection":"writing_personas","field":"default_industries"}	\N	\N
574	593	directus_fields	187	{"sort":6,"special":["cast-boolean"],"collection":"writing_personas","field":"active"}	{"sort":6,"special":["cast-boolean"],"collection":"writing_personas","field":"active"}	\N	\N
575	594	directus_fields	188	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"audience_profiles"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"audience_profiles"}	\N	\N
578	597	directus_fields	190	{"sort":3,"interface":"input","special":null,"options":{"placeholder":"e.g., \\"35-60\\", \\"65+\\""},"collection":"audience_profiles","field":"age_range"}	{"sort":3,"interface":"input","special":null,"options":{"placeholder":"e.g., \\"35-60\\", \\"65+\\""},"collection":"audience_profiles","field":"age_range"}	\N	\N
579	598	directus_fields	191	{"sort":4,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"6th Grade","value":"6th Grade"},{"text":"High School","value":"High School"},{"text":"Technical/PhD","value":"Technical/PhD"}]},"collection":"audience_profiles","field":"reading_level"}	{"sort":4,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"6th Grade","value":"6th Grade"},{"text":"High School","value":"High School"},{"text":"Technical/PhD","value":"Technical/PhD"}]},"collection":"audience_profiles","field":"reading_level"}	\N	\N
580	599	directus_fields	192	{"sort":5,"interface":"input-multiline","special":null,"collection":"audience_profiles","field":"pain_points"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"audience_profiles","field":"pain_points"}	\N	\N
581	600	directus_fields	193	{"sort":6,"interface":"input-multiline","special":null,"collection":"audience_profiles","field":"goals"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"audience_profiles","field":"goals"}	\N	\N
582	601	directus_fields	194	{"sort":7,"interface":"input-rich-text-md","special":null,"collection":"audience_profiles","field":"notes"}	{"sort":7,"interface":"input-rich-text-md","special":null,"collection":"audience_profiles","field":"notes"}	\N	\N
583	602	directus_fields	195	{"sort":8,"interface":"input","special":null,"collection":"audience_profiles","field":"industries"}	{"sort":8,"interface":"input","special":null,"collection":"audience_profiles","field":"industries"}	\N	\N
584	603	directus_fields	196	{"sort":9,"interface":"input","special":null,"collection":"audience_profiles","field":"sources"}	{"sort":9,"interface":"input","special":null,"collection":"audience_profiles","field":"sources"}	\N	\N
585	604	directus_fields	197	{"sort":10,"interface":"input","special":null,"collection":"audience_profiles","field":"trend_score"}	{"sort":10,"interface":"input","special":null,"collection":"audience_profiles","field":"trend_score"}	\N	\N
586	605	directus_fields	198	{"sort":11,"interface":"datetime","special":null,"collection":"audience_profiles","field":"latst_seen_as"}	{"sort":11,"interface":"datetime","special":null,"collection":"audience_profiles","field":"latst_seen_as"}	\N	\N
587	606	directus_fields	199	{"sort":12,"special":["cast-json"],"collection":"audience_profiles","field":"meta"}	{"sort":12,"special":["cast-json"],"collection":"audience_profiles","field":"meta"}	\N	\N
588	607	directus_fields	200	{"sort":12,"special":["m2o"],"collection":"content_requests","field":"forget_audience"}	{"sort":12,"special":["m2o"],"collection":"content_requests","field":"forget_audience"}	\N	\N
589	608	directus_fields	201	{"sort":13,"special":["m2o"],"collection":"content_requests","field":"style_persona_id"}	{"sort":13,"special":["m2o"],"collection":"content_requests","field":"style_persona_id"}	\N	\N
590	609	directus_permissions	7	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"create"}	\N	\N
591	610	directus_permissions	8	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"}	\N	\N
592	611	directus_permissions	9	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"}	\N	\N
593	612	directus_permissions	10	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"writing_personas","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"writing_personas","action":"create"}	\N	\N
594	613	directus_permissions	11	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"writing_personas","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"writing_personas","action":"read"}	\N	\N
595	614	directus_permissions	12	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"writing_personas","action":"update"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"writing_personas","action":"update"}	\N	\N
596	615	directus_permissions	13	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"create"}	\N	\N
597	616	directus_permissions	14	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"}	\N	\N
598	617	directus_permissions	15	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"}	\N	\N
599	618	directus_permissions	16	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"create"}	\N	\N
600	619	directus_permissions	17	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"}	\N	\N
601	620	directus_permissions	18	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"update"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"update"}	\N	\N
602	622	directus_fields	202	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"image_assets"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"image_assets"}	\N	\N
603	623	directus_collections	image_assets	{"singleton":false,"collection":"image_assets"}	{"singleton":false,"collection":"image_assets"}	\N	\N
604	624	directus_fields	203	{"sort":2,"interface":"input","special":["uuid"],"collection":"image_assets","field":"request_id"}	{"sort":2,"interface":"input","special":["uuid"],"collection":"image_assets","field":"request_id"}	\N	\N
605	625	directus_fields	204	{"sort":3,"interface":"input","special":null,"collection":"image_assets","field":"slot"}	{"sort":3,"interface":"input","special":null,"collection":"image_assets","field":"slot"}	\N	\N
606	626	directus_fields	205	{"sort":4,"interface":"input","special":null,"collection":"image_assets","field":"title"}	{"sort":4,"interface":"input","special":null,"collection":"image_assets","field":"title"}	\N	\N
607	628	directus_fields	206	{"sort":5,"interface":"input","special":null,"collection":"image_assets","field":"slug"}	{"sort":5,"interface":"input","special":null,"collection":"image_assets","field":"slug"}	\N	\N
608	629	directus_fields	207	{"sort":6,"interface":"input-multiline","special":null,"collection":"image_assets","field":"purpose"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"image_assets","field":"purpose"}	\N	\N
609	630	directus_fields	208	{"sort":7,"interface":"tags","special":["cast-json"],"collection":"image_assets","field":"source_tags"}	{"sort":7,"interface":"tags","special":["cast-json"],"collection":"image_assets","field":"source_tags"}	\N	\N
610	632	directus_fields	209	{"sort":7,"interface":"input","special":null,"collection":"image_assets","field":"source_type"}	{"sort":7,"interface":"input","special":null,"collection":"image_assets","field":"source_type"}	\N	\N
611	633	directus_fields	210	{"sort":8,"interface":"input","special":null,"collection":"image_assets","field":"url"}	{"sort":8,"interface":"input","special":null,"collection":"image_assets","field":"url"}	\N	\N
612	634	directus_fields	211	{"sort":9,"interface":"input","special":null,"collection":"image_assets","field":"alt_text"}	{"sort":9,"interface":"input","special":null,"collection":"image_assets","field":"alt_text"}	\N	\N
613	635	directus_fields	212	{"sort":10,"interface":"input","special":null,"collection":"image_assets","field":"caption"}	{"sort":10,"interface":"input","special":null,"collection":"image_assets","field":"caption"}	\N	\N
614	636	directus_fields	213	{"sort":11,"interface":"input","special":null,"collection":"image_assets","field":"filename"}	{"sort":11,"interface":"input","special":null,"collection":"image_assets","field":"filename"}	\N	\N
615	637	directus_fields	214	{"sort":12,"interface":"input","special":null,"collection":"image_assets","field":"license_info"}	{"sort":12,"interface":"input","special":null,"collection":"image_assets","field":"license_info"}	\N	\N
616	638	directus_fields	215	{"sort":13,"special":["cast-json"],"collection":"image_assets","field":"meta"}	{"sort":13,"special":["cast-json"],"collection":"image_assets","field":"meta"}	\N	\N
617	639	directus_fields	216	{"sort":14,"interface":"datetime","special":null,"collection":"image_assets","field":"created_at"}	{"sort":14,"interface":"datetime","special":null,"collection":"image_assets","field":"created_at"}	\N	\N
618	640	directus_fields	217	{"sort":15,"interface":"input","special":null,"collection":"image_assets","field":"image_assets"}	{"sort":15,"interface":"input","special":null,"collection":"image_assets","field":"image_assets"}	\N	\N
619	642	directus_fields	218	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_silos"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_silos"}	\N	\N
620	643	directus_collections	content_silos	{"singleton":false,"collection":"content_silos"}	{"singleton":false,"collection":"content_silos"}	\N	\N
621	644	directus_fields	219	{"sort":2,"interface":"input","special":["uuid"],"collection":"content_silos","field":"silo_id"}	{"sort":2,"interface":"input","special":["uuid"],"collection":"content_silos","field":"silo_id"}	\N	\N
622	645	directus_fields	220	{"sort":3,"interface":"input","special":null,"collection":"content_silos","field":"name"}	{"sort":3,"interface":"input","special":null,"collection":"content_silos","field":"name"}	\N	\N
623	646	directus_fields	221	{"sort":4,"interface":"input","special":null,"collection":"content_silos","field":"industry"}	{"sort":4,"interface":"input","special":null,"collection":"content_silos","field":"industry"}	\N	\N
624	647	directus_fields	222	{"sort":5,"interface":"input","special":null,"collection":"content_silos","field":"root_topic"}	{"sort":5,"interface":"input","special":null,"collection":"content_silos","field":"root_topic"}	\N	\N
625	648	directus_fields	223	{"sort":6,"interface":"input","special":["uuid"],"collection":"content_silos","field":"site_id"}	{"sort":6,"interface":"input","special":["uuid"],"collection":"content_silos","field":"site_id"}	\N	\N
626	649	directus_fields	224	{"sort":7,"interface":"datetime","special":null,"collection":"content_silos","field":"created_at"}	{"sort":7,"interface":"datetime","special":null,"collection":"content_silos","field":"created_at"}	\N	\N
627	650	directus_fields	225	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_nodes"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"content_nodes"}	\N	\N
628	651	directus_collections	content_nodes	{"singleton":false,"collection":"content_nodes"}	{"singleton":false,"collection":"content_nodes"}	\N	\N
629	652	directus_fields	226	{"sort":2,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"silo_id"}	{"sort":2,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"silo_id"}	\N	\N
630	653	directus_fields	227	{"sort":3,"interface":"input","special":null,"collection":"content_nodes","field":"title"}	{"sort":3,"interface":"input","special":null,"collection":"content_nodes","field":"title"}	\N	\N
631	654	directus_fields	228	{"sort":4,"interface":"input","special":null,"collection":"content_nodes","field":"target_keyword"}	{"sort":4,"interface":"input","special":null,"collection":"content_nodes","field":"target_keyword"}	\N	\N
632	655	directus_fields	229	{"sort":5,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"perent_node_id"}	{"sort":5,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"perent_node_id"}	\N	\N
633	657	directus_fields	230	{"sort":5,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"parent_node_id"}	{"sort":5,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"parent_node_id"}	\N	\N
634	658	directus_fields	231	{"sort":6,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"content_request_id"}	{"sort":6,"interface":"input","special":["uuid"],"collection":"content_nodes","field":"content_request_id"}	\N	\N
635	659	directus_fields	232	{"sort":7,"interface":"input","special":null,"collection":"content_nodes","field":"status"}	{"sort":7,"interface":"input","special":null,"collection":"content_nodes","field":"status"}	\N	\N
636	660	directus_fields	233	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"viral_patterns"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"viral_patterns"}	\N	\N
637	661	directus_collections	viral_patterns	{"singleton":false,"collection":"viral_patterns"}	{"singleton":false,"collection":"viral_patterns"}	\N	\N
638	662	directus_fields	234	{"sort":2,"interface":"input","special":null,"collection":"viral_patterns","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"viral_patterns","field":"name"}	\N	\N
639	663	directus_fields	235	{"sort":3,"interface":"input","special":null,"collection":"viral_patterns","field":"description"}	{"sort":3,"interface":"input","special":null,"collection":"viral_patterns","field":"description"}	\N	\N
640	664	directus_fields	236	{"sort":4,"interface":"input-multiline","special":null,"collection":"viral_patterns","field":"prompt_template"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"viral_patterns","field":"prompt_template"}	\N	\N
641	665	directus_fields	237	{"sort":5,"interface":"input","special":null,"collection":"viral_patterns","field":"content_type"}	{"sort":5,"interface":"input","special":null,"collection":"viral_patterns","field":"content_type"}	\N	\N
642	666	directus_fields	238	{"sort":6,"interface":"input","special":null,"collection":"viral_patterns","field":"industry_scope"}	{"sort":6,"interface":"input","special":null,"collection":"viral_patterns","field":"industry_scope"}	\N	\N
643	675	directus_fields	239	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"silo_nodes"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"silo_nodes"}	\N	\N
644	676	directus_collections	silo_nodes	{"singleton":false,"collection":"silo_nodes"}	{"singleton":false,"collection":"silo_nodes"}	\N	\N
645	677	directus_fields	240	{"sort":2,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"silo_id"}	{"sort":2,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"silo_id"}	\N	\N
646	678	directus_fields	241	{"sort":3,"interface":"input","special":null,"collection":"silo_nodes","field":"node_type"}	{"sort":3,"interface":"input","special":null,"collection":"silo_nodes","field":"node_type"}	\N	\N
647	679	directus_fields	242	{"sort":4,"interface":"input","special":null,"collection":"silo_nodes","field":"title"}	{"sort":4,"interface":"input","special":null,"collection":"silo_nodes","field":"title"}	\N	\N
648	680	directus_fields	243	{"sort":5,"interface":"input","special":null,"collection":"silo_nodes","field":"target_keyword"}	{"sort":5,"interface":"input","special":null,"collection":"silo_nodes","field":"target_keyword"}	\N	\N
649	681	directus_fields	244	{"sort":6,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"parent_node_id"}	{"sort":6,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"parent_node_id"}	\N	\N
650	682	directus_fields	245	{"sort":7,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"content_request_id"}	{"sort":7,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"content_request_id"}	\N	\N
651	683	directus_fields	246	{"sort":8,"interface":"input","special":null,"collection":"silo_nodes","field":"status"}	{"sort":8,"interface":"input","special":null,"collection":"silo_nodes","field":"status"}	\N	\N
652	684	directus_fields	247	{"sort":9,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"topic_id"}	{"sort":9,"interface":"input","special":["uuid"],"collection":"silo_nodes","field":"topic_id"}	\N	\N
653	685	directus_fields	248	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"fact_candidates"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"fact_candidates"}	\N	\N
654	686	directus_collections	fact_candidates	{"singleton":false,"collection":"fact_candidates"}	{"singleton":false,"collection":"fact_candidates"}	\N	\N
655	687	directus_fields	249	{"sort":2,"interface":"input","special":["uuid"],"collection":"fact_candidates","field":"request_id"}	{"sort":2,"interface":"input","special":["uuid"],"collection":"fact_candidates","field":"request_id"}	\N	\N
656	688	directus_fields	250	{"sort":3,"interface":"input","special":null,"collection":"fact_candidates","field":"source_url"}	{"sort":3,"interface":"input","special":null,"collection":"fact_candidates","field":"source_url"}	\N	\N
657	689	directus_fields	251	{"sort":4,"interface":"input","special":null,"collection":"fact_candidates","field":"fact_text"}	{"sort":4,"interface":"input","special":null,"collection":"fact_candidates","field":"fact_text"}	\N	\N
658	690	directus_fields	252	{"sort":5,"interface":"input","special":null,"collection":"fact_candidates","field":"type"}	{"sort":5,"interface":"input","special":null,"collection":"fact_candidates","field":"type"}	\N	\N
659	692	directus_fields	253	{"sort":5,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"law","value":"law"},{"text":"regulation","value":"regulation"},{"text":"case","value":"case"},{"text":"statistic","value":"statistic"},{"text":"study","value":"study"},{"text":"definition","value":"definition"},{"text":"medical_finding","value":"medical_finding"},{"text":"quote","value":"quote"}]},"collection":"fact_candidates","field":"type"}	{"sort":5,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"law","value":"law"},{"text":"regulation","value":"regulation"},{"text":"case","value":"case"},{"text":"statistic","value":"statistic"},{"text":"study","value":"study"},{"text":"definition","value":"definition"},{"text":"medical_finding","value":"medical_finding"},{"text":"quote","value":"quote"}]},"collection":"fact_candidates","field":"type"}	\N	\N
660	693	directus_fields	254	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"gov","value":"gov"},{"text":"edu","value":"edu"},{"text":"peer_review","value":"peer_review"},{"text":"legal_ruling","value":"legal_ruling"},{"text":"trusted_org","value":"trusted_org"}]},"collection":"fact_candidates","field":"source_authority"}	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"gov","value":"gov"},{"text":"edu","value":"edu"},{"text":"peer_review","value":"peer_review"},{"text":"legal_ruling","value":"legal_ruling"},{"text":"trusted_org","value":"trusted_org"}]},"collection":"fact_candidates","field":"source_authority"}	\N	\N
661	694	directus_fields	255	{"sort":7,"interface":"input","special":null,"collection":"fact_candidates","field":"jurisdiction"}	{"sort":7,"interface":"input","special":null,"collection":"fact_candidates","field":"jurisdiction"}	\N	\N
662	695	directus_fields	256	{"sort":8,"interface":"input","special":null,"collection":"fact_candidates","field":"study_year"}	{"sort":8,"interface":"input","special":null,"collection":"fact_candidates","field":"study_year"}	\N	\N
663	696	directus_fields	257	{"sort":9,"interface":"datetime","special":null,"collection":"fact_candidates","field":"published_at"}	{"sort":9,"interface":"datetime","special":null,"collection":"fact_candidates","field":"published_at"}	\N	\N
664	697	directus_fields	258	{"sort":10,"special":["cast-json"],"collection":"fact_candidates","field":"meta"}	{"sort":10,"special":["cast-json"],"collection":"fact_candidates","field":"meta"}	\N	\N
665	698	directus_fields	259	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"industries"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"industries"}	\N	\N
666	699	directus_collections	industries	{"singleton":false,"collection":"industries"}	{"singleton":false,"collection":"industries"}	\N	\N
705	742	directus_fields	191	{"id":191,"collection":"audience_profiles","field":"reading_level","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"grade6","value":"grade6"},{"text":"grade8","value":"grade8"},{"text":"professional","value":"professional"},{"text":"senior_plain","value":"senior_plain"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"audience_profiles","field":"reading_level","options":{"choices":[{"text":"grade6","value":"grade6"},{"text":"grade8","value":"grade8"},{"text":"professional","value":"professional"},{"text":"senior_plain","value":"senior_plain"}]}}	\N	\N
667	700	directus_fields	260	{"sort":2,"interface":"input","special":null,"collection":"industries","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"industries","field":"name"}	\N	\N
668	701	directus_fields	261	{"sort":3,"interface":"input","special":null,"collection":"industries","field":"description"}	{"sort":3,"interface":"input","special":null,"collection":"industries","field":"description"}	\N	\N
669	702	directus_fields	262	{"sort":4,"special":["cast-boolean"],"collection":"industries","field":"active"}	{"sort":4,"special":["cast-boolean"],"collection":"industries","field":"active"}	\N	\N
670	703	directus_fields	263	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"sub_industry"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"sub_industry"}	\N	\N
671	704	directus_collections	sub_industry	{"singleton":false,"collection":"sub_industry"}	{"singleton":false,"collection":"sub_industry"}	\N	\N
672	705	directus_fields	264	{"sort":2,"interface":"input","special":null,"collection":"sub_industry","field":"sub_industries"}	{"sort":2,"interface":"input","special":null,"collection":"sub_industry","field":"sub_industries"}	\N	\N
673	707	directus_fields	265	{"sort":2,"interface":"input","special":["uuid"],"collection":"sub_industry","field":"industry_id"}	{"sort":2,"interface":"input","special":["uuid"],"collection":"sub_industry","field":"industry_id"}	\N	\N
674	708	directus_fields	266	{"sort":3,"interface":"input","special":null,"collection":"sub_industry","field":"name"}	{"sort":3,"interface":"input","special":null,"collection":"sub_industry","field":"name"}	\N	\N
675	709	directus_fields	267	{"sort":4,"interface":"input","special":null,"collection":"sub_industry","field":"description"}	{"sort":4,"interface":"input","special":null,"collection":"sub_industry","field":"description"}	\N	\N
676	710	directus_fields	268	{"sort":5,"special":["cast-boolean"],"collection":"sub_industry","field":"active"}	{"sort":5,"special":["cast-boolean"],"collection":"sub_industry","field":"active"}	\N	\N
677	711	directus_fields	269	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"topics"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"topics"}	\N	\N
678	712	directus_collections	topics	{"singleton":false,"collection":"topics"}	{"singleton":false,"collection":"topics"}	\N	\N
679	713	directus_fields	270	{"sort":2,"interface":"input","special":["uuid"],"collection":"topics","field":"sub_industry_id"}	{"sort":2,"interface":"input","special":["uuid"],"collection":"topics","field":"sub_industry_id"}	\N	\N
680	714	directus_fields	271	{"sort":3,"interface":"input","special":null,"collection":"topics","field":"topic_name"}	{"sort":3,"interface":"input","special":null,"collection":"topics","field":"topic_name"}	\N	\N
681	715	directus_fields	272	{"sort":4,"interface":"input","special":null,"collection":"topics","field":"keyword_root"}	{"sort":4,"interface":"input","special":null,"collection":"topics","field":"keyword_root"}	\N	\N
682	716	directus_fields	273	{"sort":5,"interface":"input-multiline","special":null,"collection":"topics","field":"description"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"topics","field":"description"}	\N	\N
683	717	directus_fields	274	{"sort":6,"special":["cast-boolean"],"collection":"topics","field":"active"}	{"sort":6,"special":["cast-boolean"],"collection":"topics","field":"active"}	\N	\N
684	718	directus_fields	275	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"trend_topics"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"trend_topics"}	\N	\N
685	719	directus_collections	trend_topics	{"singleton":false,"collection":"trend_topics"}	{"singleton":false,"collection":"trend_topics"}	\N	\N
686	720	directus_fields	276	{"sort":2,"interface":"input","special":null,"collection":"trend_topics","field":"topic"}	{"sort":2,"interface":"input","special":null,"collection":"trend_topics","field":"topic"}	\N	\N
687	721	directus_fields	277	{"sort":3,"interface":"input","special":["uuid"],"collection":"trend_topics","field":"topic_id"}	{"sort":3,"interface":"input","special":["uuid"],"collection":"trend_topics","field":"topic_id"}	\N	\N
688	722	directus_fields	278	{"sort":4,"interface":"input","special":["uuid"],"collection":"trend_topics","field":"industry_id"}	{"sort":4,"interface":"input","special":["uuid"],"collection":"trend_topics","field":"industry_id"}	\N	\N
689	723	directus_fields	279	{"sort":5,"interface":"input","special":["uuid"],"collection":"trend_topics","field":"sub_industry_id"}	{"sort":5,"interface":"input","special":["uuid"],"collection":"trend_topics","field":"sub_industry_id"}	\N	\N
690	724	directus_fields	280	{"sort":6,"interface":"input","special":null,"options":{"placeholder":"localrank, rss, manual, google_trends"},"collection":"trend_topics","field":"source"}	{"sort":6,"interface":"input","special":null,"options":{"placeholder":"localrank, rss, manual, google_trends"},"collection":"trend_topics","field":"source"}	\N	\N
691	725	directus_fields	281	{"sort":7,"interface":"input","special":null,"collection":"trend_topics","field":"trend_score"}	{"sort":7,"interface":"input","special":null,"collection":"trend_topics","field":"trend_score"}	\N	\N
692	726	directus_fields	282	{"sort":8,"interface":"input","special":null,"options":{"placeholder":"(new, queued, used, ignored)"},"collection":"trend_topics","field":"status"}	{"sort":8,"interface":"input","special":null,"options":{"placeholder":"(new, queued, used, ignored)"},"collection":"trend_topics","field":"status"}	\N	\N
693	727	directus_fields	283	{"sort":9,"interface":"datetime","special":null,"collection":"trend_topics","field":"lat_seen_at"}	{"sort":9,"interface":"datetime","special":null,"collection":"trend_topics","field":"lat_seen_at"}	\N	\N
694	729	directus_fields	284	{"sort":9,"special":["cast-json"],"collection":"trend_topics","field":"meta"}	{"sort":9,"special":["cast-json"],"collection":"trend_topics","field":"meta"}	\N	\N
695	730	directus_fields	285	{"sort":10,"interface":"datetime","special":null,"collection":"trend_topics","field":"last_seen_at"}	{"sort":10,"interface":"datetime","special":null,"collection":"trend_topics","field":"last_seen_at"}	\N	\N
696	731	directus_fields	286	{"sort":11,"interface":"datetime","special":null,"collection":"trend_topics","field":"create_at"}	{"sort":11,"interface":"datetime","special":null,"collection":"trend_topics","field":"create_at"}	\N	\N
697	732	directus_fields	287	{"sort":12,"interface":"input","special":null,"collection":"trend_topics","field":"updated_at"}	{"sort":12,"interface":"input","special":null,"collection":"trend_topics","field":"updated_at"}	\N	\N
698	734	directus_fields	288	{"sort":13,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"localrank","value":"localrank"},{"text":"rss","value":"rss"}]},"collection":"trend_topics","field":"source"}	{"sort":13,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"localrank","value":"localrank"},{"text":"rss","value":"rss"}]},"collection":"trend_topics","field":"source"}	\N	\N
699	735	directus_fields	288	{"id":288,"collection":"trend_topics","field":"source","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"localrank","value":"localrank"},{"text":"rss","value":"rss"},{"text":"google_trends","value":"google_trends"},{"text":"manual","value":"manual"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":13,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"trend_topics","field":"source","options":{"choices":[{"text":"localrank","value":"localrank"},{"text":"rss","value":"rss"},{"text":"google_trends","value":"google_trends"},{"text":"manual","value":"manual"}]}}	\N	\N
700	737	directus_fields	289	{"sort":14,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"new","value":"new"},{"text":"queued","value":"queued"},{"text":"used","value":"used"},{"text":"ignored","value":"ignored"}]},"collection":"trend_topics","field":"status"}	{"sort":14,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"new","value":"new"},{"text":"queued","value":"queued"},{"text":"used","value":"used"},{"text":"ignored","value":"ignored"}]},"collection":"trend_topics","field":"status"}	\N	\N
701	738	directus_fields	241	{"id":241,"collection":"silo_nodes","field":"node_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"pillar","value":"pillar"},{"text":"cluster","value":"cluster"},{"text":"faq","value":"faq"},{"text":"city_page","value":"city_page"},{"text":"product_page","value":"product_page"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"silo_nodes","field":"node_type","interface":"select-dropdown","options":{"choices":[{"text":"pillar","value":"pillar"},{"text":"cluster","value":"cluster"},{"text":"faq","value":"faq"},{"text":"city_page","value":"city_page"},{"text":"product_page","value":"product_page"}]}}	\N	\N
702	739	directus_fields	246	{"id":246,"collection":"silo_nodes","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"planned","value":"planned"},{"text":"requested","value":"requested"},{"text":"drafted","value":"drafted"},{"text":"published","value":"published"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"silo_nodes","field":"status","interface":"select-dropdown","options":{"choices":[{"text":"planned","value":"planned"},{"text":"requested","value":"requested"},{"text":"drafted","value":"drafted"},{"text":"published","value":"published"}]}}	\N	\N
703	740	directus_fields	161	{"id":161,"collection":"content_requests","field":"content_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"},{"text":"comparison_post","value":"comparison_post"},{"text":"legal_explainer","value":"legal_explainer"},{"text":"blog_post","value":"blog_post"},{"text":"buying_guide","value":"buying_guide"},{"text":"short_form_only","value":"short_form_only"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"content_type","options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"},{"text":"comparison_post","value":"comparison_post"},{"text":"legal_explainer","value":"legal_explainer"},{"text":"blog_post","value":"blog_post"},{"text":"buying_guide","value":"buying_guide"},{"text":"short_form_only","value":"short_form_only"}]}}	\N	\N
741	781	directus_collections	topics	{"collection":"topics","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
742	782	directus_collections	viral_patterns	{"collection":"viral_patterns","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
1087	1249	directus_fields	352	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"ai_calls"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"ai_calls"}	\N	\N
704	741	directus_fields	161	{"id":161,"collection":"content_requests","field":"content_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"},{"text":"comparison_post","value":"comparison_post"},{"text":"legal_explainer","value":"legal_explainer"},{"text":"blog_post","value":"blog_post"},{"text":"buying_guide","value":"buying_guide"},{"text":"short_form_only","value":"short_form_only"},{"text":"viral_post","value":"viral_post"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"content_type","options":{"choices":[{"text":"how_to","value":"how_to"},{"text":"list_post","value":"list_post"},{"text":"service_page","value":"service_page"},{"text":"ecommerce_product","value":"ecommerce_product"},{"text":"ecommerce_products","value":"ecommerce_products"},{"text":"comparison_post","value":"comparison_post"},{"text":"legal_explainer","value":"legal_explainer"},{"text":"blog_post","value":"blog_post"},{"text":"buying_guide","value":"buying_guide"},{"text":"short_form_only","value":"short_form_only"},{"text":"viral_post","value":"viral_post"}]}}	\N	\N
706	744	directus_fields	290	{"sort":13,"interface":"datetime","special":null,"collection":"audience_profiles","field":"last_seen_at"}	{"sort":13,"interface":"datetime","special":null,"collection":"audience_profiles","field":"last_seen_at"}	\N	\N
707	745	directus_fields	291	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"banned_phrases"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"banned_phrases"}	\N	\N
708	746	directus_collections	banned_phrases	{"singleton":false,"collection":"banned_phrases"}	{"singleton":false,"collection":"banned_phrases"}	\N	\N
709	747	directus_fields	292	{"sort":2,"interface":"input","special":null,"collection":"banned_phrases","field":"phrase"}	{"sort":2,"interface":"input","special":null,"collection":"banned_phrases","field":"phrase"}	\N	\N
710	748	directus_fields	293	{"sort":3,"interface":"input","special":null,"collection":"banned_phrases","field":"replacement_hint"}	{"sort":3,"interface":"input","special":null,"collection":"banned_phrases","field":"replacement_hint"}	\N	\N
711	749	directus_fields	294	{"sort":4,"interface":"datetime","special":null,"collection":"banned_phrases","field":"create_at"}	{"sort":4,"interface":"datetime","special":null,"collection":"banned_phrases","field":"create_at"}	\N	\N
712	750	directus_fields	295	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"experience_snippets"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"experience_snippets"}	\N	\N
713	751	directus_collections	experience_snippets	{"singleton":false,"collection":"experience_snippets"}	{"singleton":false,"collection":"experience_snippets"}	\N	\N
714	752	directus_fields	296	{"sort":2,"interface":"input-multiline","special":null,"collection":"experience_snippets","field":"snippet_text"}	{"sort":2,"interface":"input-multiline","special":null,"collection":"experience_snippets","field":"snippet_text"}	\N	\N
715	753	directus_fields	297	{"sort":3,"special":["cast-json"],"collection":"experience_snippets","field":"tags"}	{"sort":3,"special":["cast-json"],"collection":"experience_snippets","field":"tags"}	\N	\N
716	754	directus_fields	298	{"sort":4,"interface":"datetime","special":null,"collection":"experience_snippets","field":"created_at"}	{"sort":4,"interface":"datetime","special":null,"collection":"experience_snippets","field":"created_at"}	\N	\N
717	755	directus_fields	299	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"snippet_category"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"snippet_category"}	\N	\N
718	756	directus_collections	snippet_category	{"singleton":false,"collection":"snippet_category"}	{"singleton":false,"collection":"snippet_category"}	\N	\N
719	759	directus_collections	audience_profiles	{"collection":"audience_profiles","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
720	760	directus_collections	banned_phrases	{"collection":"banned_phrases","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
721	761	directus_collections	business_intel_reports	{"collection":"business_intel_reports","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
722	762	directus_collections	content_outputs	{"collection":"content_outputs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
723	763	directus_collections	content_requests	{"collection":"content_requests","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
724	764	directus_collections	content_silos	{"collection":"content_silos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
1088	1250	directus_collections	ai_calls	{"singleton":false,"collection":"ai_calls"}	{"singleton":false,"collection":"ai_calls"}	\N	\N
725	765	directus_collections	experience_snippets	{"collection":"experience_snippets","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
726	766	directus_collections	fact_candidates	{"collection":"fact_candidates","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
727	767	directus_collections	image_assets	{"collection":"image_assets","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
728	768	directus_collections	industries	{"collection":"industries","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
729	769	directus_collections	intel_debug	{"collection":"intel_debug","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
730	770	directus_collections	intel_provenance	{"collection":"intel_provenance","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
731	771	directus_collections	kb_chunks	{"collection":"kb_chunks","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
732	772	directus_collections	kb_documents	{"collection":"kb_documents","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
733	773	directus_collections	keyword_opportunities	{"collection":"keyword_opportunities","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
734	774	directus_collections	learning_queue	{"collection":"learning_queue","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
735	775	directus_collections	seo_audit	{"collection":"seo_audit","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
736	776	directus_collections	seo_enrichment	{"collection":"seo_enrichment","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
737	777	directus_collections	silo_nodes	{"collection":"silo_nodes","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
738	778	directus_collections	sub_industry	{"collection":"sub_industry","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
739	779	directus_collections	target_cities	{"collection":"target_cities","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
740	780	directus_collections	target_services	{"collection":"target_services","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
1089	1251	directus_fields	353	{"sort":2,"interface":"input","special":null,"collection":"ai_calls","field":"lead_id"}	{"sort":2,"interface":"input","special":null,"collection":"ai_calls","field":"lead_id"}	\N	\N
743	783	directus_collections	trend_topics	{"collection":"trend_topics","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
744	784	directus_collections	writing_personas	{"collection":"writing_personas","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
745	785	directus_fields	300	{"sort":5,"interface":"select-dropdown","special":null,"collection":"experience_snippets","field":"snippet_category"}	{"sort":5,"interface":"select-dropdown","special":null,"collection":"experience_snippets","field":"snippet_category"}	\N	\N
746	786	directus_fields	300	{"id":300,"collection":"experience_snippets","field":"snippet_category","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"story","value":"story"},{"text":"analogy","value":"analogy"},{"text":"warning","value":"warning"},{"text":"testimonial _style","value":"testimonial _style"},{"text":"mistake","value":"mistake"},{"text":"transformation","value":"transformation"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"snippet_category","options":{"choices":[{"text":"story","value":"story"},{"text":"analogy","value":"analogy"},{"text":"warning","value":"warning"},{"text":"testimonial _style","value":"testimonial _style"},{"text":"mistake","value":"mistake"},{"text":"transformation","value":"transformation"}]}}	\N	\N
747	787	directus_fields	301	{"sort":6,"interface":"input","special":null,"collection":"experience_snippets","field":"industry_id"}	{"sort":6,"interface":"input","special":null,"collection":"experience_snippets","field":"industry_id"}	\N	\N
748	788	directus_fields	302	{"sort":7,"interface":"input","special":["uuid"],"collection":"experience_snippets","field":"sub_industry_id"}	{"sort":7,"interface":"input","special":["uuid"],"collection":"experience_snippets","field":"sub_industry_id"}	\N	\N
749	789	directus_fields	303	{"sort":8,"interface":"input","special":["uuid"],"collection":"experience_snippets","field":"persona_id"}	{"sort":8,"interface":"input","special":["uuid"],"collection":"experience_snippets","field":"persona_id"}	\N	\N
750	790	directus_fields	304	{"sort":9,"interface":"datetime","special":null,"collection":"experience_snippets","field":"create_at"}	{"sort":9,"interface":"datetime","special":null,"collection":"experience_snippets","field":"create_at"}	\N	\N
751	791	directus_fields	295	{"id":295,"collection":"experience_snippets","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"id","sort":1,"group":null}	\N	\N
752	792	directus_fields	296	{"id":296,"collection":"experience_snippets","field":"snippet_text","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"snippet_text","sort":2,"group":null}	\N	\N
753	793	directus_fields	297	{"id":297,"collection":"experience_snippets","field":"tags","special":["cast-json"],"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"tags","sort":3,"group":null}	\N	\N
754	794	directus_fields	298	{"id":298,"collection":"experience_snippets","field":"created_at","special":null,"interface":"datetime","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"created_at","sort":4,"group":null}	\N	\N
755	795	directus_fields	300	{"id":300,"collection":"experience_snippets","field":"snippet_category","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"story","value":"story"},{"text":"analogy","value":"analogy"},{"text":"warning","value":"warning"},{"text":"testimonial _style","value":"testimonial _style"},{"text":"mistake","value":"mistake"},{"text":"transformation","value":"transformation"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"snippet_category","sort":5,"group":null}	\N	\N
756	796	directus_fields	302	{"id":302,"collection":"experience_snippets","field":"sub_industry_id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"sub_industry_id","sort":6,"group":null}	\N	\N
757	797	directus_fields	301	{"id":301,"collection":"experience_snippets","field":"industry_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"industry_id","sort":7,"group":null}	\N	\N
758	798	directus_fields	303	{"id":303,"collection":"experience_snippets","field":"persona_id","special":["uuid"],"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"persona_id","sort":8,"group":null}	\N	\N
759	799	directus_fields	304	{"id":304,"collection":"experience_snippets","field":"create_at","special":null,"interface":"datetime","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"experience_snippets","field":"create_at","sort":9,"group":null}	\N	\N
760	800	directus_collections	industries	{"collection":"industries","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"image_assets","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"image_assets"}	\N	\N
761	801	directus_collections	audience_profiles	{"collection":"audience_profiles","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
762	802	directus_collections	banned_phrases	{"collection":"banned_phrases","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
763	803	directus_collections	business_intel_reports	{"collection":"business_intel_reports","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
764	804	directus_collections	content_outputs	{"collection":"content_outputs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
765	805	directus_collections	content_requests	{"collection":"content_requests","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
766	806	directus_collections	content_silos	{"collection":"content_silos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
767	807	directus_collections	experience_snippets	{"collection":"experience_snippets","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
768	808	directus_collections	fact_candidates	{"collection":"fact_candidates","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
769	809	directus_collections	image_assets	{"collection":"image_assets","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
770	810	directus_collections	intel_debug	{"collection":"intel_debug","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
771	811	directus_collections	intel_provenance	{"collection":"intel_provenance","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
772	812	directus_collections	kb_chunks	{"collection":"kb_chunks","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
773	813	directus_collections	kb_documents	{"collection":"kb_documents","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
774	814	directus_collections	keyword_opportunities	{"collection":"keyword_opportunities","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
775	815	directus_collections	learning_queue	{"collection":"learning_queue","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
776	816	directus_collections	seo_audit	{"collection":"seo_audit","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
777	817	directus_collections	seo_enrichment	{"collection":"seo_enrichment","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
778	818	directus_collections	silo_nodes	{"collection":"silo_nodes","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
779	819	directus_collections	sub_industry	{"collection":"sub_industry","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
780	820	directus_collections	target_cities	{"collection":"target_cities","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
781	821	directus_collections	target_services	{"collection":"target_services","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
782	822	directus_collections	topics	{"collection":"topics","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
783	823	directus_collections	viral_patterns	{"collection":"viral_patterns","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
784	824	directus_collections	trend_topics	{"collection":"trend_topics","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
785	825	directus_collections	writing_personas	{"collection":"writing_personas","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
786	827	directus_fields	305	{"sort":15,"special":["m2o"],"collection":"image_assets","field":"request_id"}	{"sort":15,"special":["m2o"],"collection":"image_assets","field":"request_id"}	\N	\N
787	829	directus_fields	306	{"sort":16,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"hero","value":"hero"},{"text":"section_1","value":"section_1"},{"text":"section_2","value":"section_2"},{"text":"section_3","value":"section_3"},{"text":"inline","value":"inline"},{"text":"cta_badge","value":"cta_badge"},{"text":"comparison","value":"comparison"},{"text":"thumbnail","value":"thumbnail"}]},"collection":"image_assets","field":"slot"}	{"sort":16,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"hero","value":"hero"},{"text":"section_1","value":"section_1"},{"text":"section_2","value":"section_2"},{"text":"section_3","value":"section_3"},{"text":"inline","value":"inline"},{"text":"cta_badge","value":"cta_badge"},{"text":"comparison","value":"comparison"},{"text":"thumbnail","value":"thumbnail"}]},"collection":"image_assets","field":"slot"}	\N	\N
788	831	directus_fields	307	{"sort":17,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"trust","value":"trust"},{"text":"explain","value":"explain"},{"text":"visual_support","value":"visual_support"},{"text":"cta","value":"cta"},{"text":"diagram","value":"diagram"},{"text":"branding","value":"branding"}]},"collection":"image_assets","field":"purpose"}	{"sort":17,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"trust","value":"trust"},{"text":"explain","value":"explain"},{"text":"visual_support","value":"visual_support"},{"text":"cta","value":"cta"},{"text":"diagram","value":"diagram"},{"text":"branding","value":"branding"}]},"collection":"image_assets","field":"purpose"}	\N	\N
789	832	directus_fields	209	{"id":209,"collection":"image_assets","field":"source_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"ai","value":"ai"},{"text":"stock","value":"stock"},{"text":"manual","value":"manual"},{"text":"upload","value":"upload"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"image_assets","field":"source_type","interface":"select-dropdown","options":{"choices":[{"text":"ai","value":"ai"},{"text":"stock","value":"stock"},{"text":"manual","value":"manual"},{"text":"upload","value":"upload"}]}}	\N	\N
790	834	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	{"name":"N8N Content Engine"}	{"name":"N8N Content Engine"}	\N	\N
1090	1252	directus_fields	354	{"sort":3,"interface":"input","special":null,"collection":"ai_calls","field":"caller_phone"}	{"sort":3,"interface":"input","special":null,"collection":"ai_calls","field":"caller_phone"}	\N	\N
791	835	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","token":"**********","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}	{"first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","token":"**********","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}	\N	\N
792	836	directus_access	69ab4824-ba9b-40fc-be17-38bb215023ff	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	\N	\N
793	838	directus_access	1848ad92-c8f4-4001-bab2-8d8f3621b441	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	\N	\N
794	840	directus_roles	6544cab5-a43c-45fe-8f20-976eaa3a234d	{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d","name":"N8N Content Engine","icon":"supervised_user_circle","description":null,"parent":"4b9c2a26-828b-4a29-92db-a4e714d6f484","children":[],"policies":["69ab4824-ba9b-40fc-be17-38bb215023ff"],"users":["09004418-6a01-4c82-825a-6e34cdf19fd9"]}	{"parent":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}	\N	\N
796	842	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	{"id":"24f7d0fe-8079-4470-a550-625130a01a4c","first_name":null,"last_name":null,"email":"jlanders@leadsgrowrevenue.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":"2025-12-10T00:35:08.401Z","last_page":"/users","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":"Directus Default","theme_light":"Directus Color Match","theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["b9cc95dc-0d64-463b-b866-48c731720125"]}	{"token":"**********"}	\N	\N
795	841	directus_access	b9cc95dc-0d64-463b-b866-48c731720125	{"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	{"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	796	\N
812	864	directus_collections	industries	{"collection":"industries","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
797	845	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["1848ad92-c8f4-4001-bab2-8d8f3621b441"]}	{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}	\N	\N
798	846	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	{"name":"Content Engine API","admin_access":false,"app_access":false}	{"name":"Content Engine API","admin_access":false,"app_access":false}	\N	\N
799	847	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["1848ad92-c8f4-4001-bab2-8d8f3621b441"]}	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}	\N	\N
800	852	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","token":null,"last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"token":null}	\N	\N
801	853	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"token":"**********"}	\N	\N
802	854	content_requests	1	{"topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois"}	{"topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois"}	\N	\N
803	855	directus_fields	308	{"sort":5,"interface":"input","special":null,"collection":"industries","field":"slug"}	{"sort":5,"interface":"input","special":null,"collection":"industries","field":"slug"}	\N	\N
804	856	directus_collections	audience_profiles	{"collection":"audience_profiles","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
805	857	directus_collections	banned_phrases	{"collection":"banned_phrases","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
806	858	directus_collections	business_intel_reports	{"collection":"business_intel_reports","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
807	859	directus_collections	content_outputs	{"collection":"content_outputs","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
808	860	directus_collections	content_requests	{"collection":"content_requests","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
809	861	directus_collections	content_silos	{"collection":"content_silos","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
810	862	directus_collections	experience_snippets	{"collection":"experience_snippets","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
811	863	directus_collections	fact_candidates	{"collection":"fact_candidates","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
813	865	directus_collections	image_assets	{"collection":"image_assets","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":10,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":10,"group":null}	\N	\N
814	866	directus_collections	intel_debug	{"collection":"intel_debug","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":11,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":11,"group":null}	\N	\N
815	867	directus_collections	intel_provenance	{"collection":"intel_provenance","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":12,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":12,"group":null}	\N	\N
816	868	directus_collections	kb_chunks	{"collection":"kb_chunks","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":13,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":13,"group":null}	\N	\N
817	869	directus_collections	kb_documents	{"collection":"kb_documents","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":14,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":14,"group":null}	\N	\N
818	870	directus_collections	keyword_opportunities	{"collection":"keyword_opportunities","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":15,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":15,"group":null}	\N	\N
819	871	directus_collections	learning_queue	{"collection":"learning_queue","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":16,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":16,"group":null}	\N	\N
820	872	directus_collections	seo_audit	{"collection":"seo_audit","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":17,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":17,"group":null}	\N	\N
821	873	directus_collections	seo_enrichment	{"collection":"seo_enrichment","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":18,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":18,"group":null}	\N	\N
822	874	directus_collections	silo_nodes	{"collection":"silo_nodes","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":19,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":19,"group":null}	\N	\N
823	875	directus_collections	sub_industry	{"collection":"sub_industry","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":20,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":20,"group":null}	\N	\N
824	876	directus_collections	target_cities	{"collection":"target_cities","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":21,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":21,"group":null}	\N	\N
825	877	directus_collections	target_services	{"collection":"target_services","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":22,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":22,"group":null}	\N	\N
826	878	directus_collections	topics	{"collection":"topics","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":23,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":23,"group":null}	\N	\N
827	879	directus_collections	viral_patterns	{"collection":"viral_patterns","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":24,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":24,"group":null}	\N	\N
828	880	directus_collections	trend_topics	{"collection":"trend_topics","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":25,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":25,"group":null}	\N	\N
829	881	directus_collections	writing_personas	{"collection":"writing_personas","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":26,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":26,"group":null}	\N	\N
830	888	directus_fields	309	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"sub_industries"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"sub_industries"}	\N	\N
831	889	directus_collections	sub_industries	{"singleton":false,"collection":"sub_industries"}	{"singleton":false,"collection":"sub_industries"}	\N	\N
832	890	directus_fields	310	{"sort":2,"interface":"input","special":null,"collection":"sub_industries","field":"slug"}	{"sort":2,"interface":"input","special":null,"collection":"sub_industries","field":"slug"}	\N	\N
833	891	directus_fields	311	{"sort":3,"interface":"input","special":null,"collection":"sub_industries","field":"name"}	{"sort":3,"interface":"input","special":null,"collection":"sub_industries","field":"name"}	\N	\N
834	892	directus_fields	312	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Home Services","value":"home_services"},{"text":"Legal Services","value":"legal_services"},{"text":"Healthcare & Wellness","value":"healthcare_wellness"},{"text":"Real Estate","value":"real_estate"},{"text":"Finance & Insurance","value":"finance_insurance"},{"text":"Education & Training","value":"education_training"},{"text":"Technology & Software","value":"technology_software"},{"text":"Marketing & Advertising","value":"marketing_advertising"},{"text":"Retail & Ecommerce","value":"retail_ecommerce"},{"text":"Automotive","value":"automotive"},{"text":"Food & Beverage","value":"food_beverage"},{"text":"Construction & Contracting","value":"construction_contracting"},{"text":"Manufacturing & Industrial","value":"manufacturing_industrial"},{"text":"Hospitality & Travel","value":"hospitality_travel"},{"text":"Beauty & Personal Care","value":"beauty_personal_care"},{"text":"Fitness & Sports","value":"fitness_sports"},{"text":"Government & Public Sector","value":"government_public_sector"},{"text":"Non-Profit & Community Services","value":"nonprofit_community_services"},{"text":"Arts, Media & Entertainment","value":"arts_media_entertainment"},{"text":"Agriculture & Farming","value":"agriculture_farming"},{"text":"Energy & Utilities","value":"energy_utilities"},{"text":"Transportation & Logistics","value":"transportation_logistics"},{"text":"Human Resources & Recruiting","value":"hr_recruiting"},{"text":"Professional Services","value":"professional_services"},{"text":"Science & Research","value":"science_research"}]},"collection":"industries","field":"industries"}	{"sort":6,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Home Services","value":"home_services"},{"text":"Legal Services","value":"legal_services"},{"text":"Healthcare & Wellness","value":"healthcare_wellness"},{"text":"Real Estate","value":"real_estate"},{"text":"Finance & Insurance","value":"finance_insurance"},{"text":"Education & Training","value":"education_training"},{"text":"Technology & Software","value":"technology_software"},{"text":"Marketing & Advertising","value":"marketing_advertising"},{"text":"Retail & Ecommerce","value":"retail_ecommerce"},{"text":"Automotive","value":"automotive"},{"text":"Food & Beverage","value":"food_beverage"},{"text":"Construction & Contracting","value":"construction_contracting"},{"text":"Manufacturing & Industrial","value":"manufacturing_industrial"},{"text":"Hospitality & Travel","value":"hospitality_travel"},{"text":"Beauty & Personal Care","value":"beauty_personal_care"},{"text":"Fitness & Sports","value":"fitness_sports"},{"text":"Government & Public Sector","value":"government_public_sector"},{"text":"Non-Profit & Community Services","value":"nonprofit_community_services"},{"text":"Arts, Media & Entertainment","value":"arts_media_entertainment"},{"text":"Agriculture & Farming","value":"agriculture_farming"},{"text":"Energy & Utilities","value":"energy_utilities"},{"text":"Transportation & Logistics","value":"transportation_logistics"},{"text":"Human Resources & Recruiting","value":"hr_recruiting"},{"text":"Professional Services","value":"professional_services"},{"text":"Science & Research","value":"science_research"}]},"collection":"industries","field":"industries"}	\N	\N
835	893	directus_fields	313	{"sort":7,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Home Services","value":"home_services"},{"text":"Legal Services","value":"legal_services"},{"text":"Healthcare & Wellness","value":"healthcare_wellness"},{"text":"Real Estate","value":"real_estate"},{"text":"Finance & Insurance","value":"finance_insurance"},{"text":"Education & Training","value":"education_training"},{"text":"Technology & Software","value":"technology_software"},{"text":"Marketing & Advertising","value":"marketing_advertising"},{"text":"Retail & Ecommerce","value":"retail_ecommerce"},{"text":"Automotive","value":"automotive"},{"text":"Food & Beverage","value":"food_beverage"},{"text":"Construction & Contracting","value":"construction_contracting"},{"text":"Manufacturing & Industrial","value":"manufacturing_industrial"},{"text":"Hospitality & Travel","value":"hospitality_travel"},{"text":"Beauty & Personal Care","value":"beauty_personal_care"},{"text":"Fitness & Sports","value":"fitness_sports"},{"text":"Government & Public Sector","value":"government_public_sector"},{"text":"Non-Profit & Community Services","value":"nonprofit_community_services"},{"text":"Arts, Media & Entertainment","value":"arts_media_entertainment"},{"text":"Agriculture & Farming","value":"agriculture_farming"},{"text":"Energy & Utilities","value":"energy_utilities"},{"text":"Transportation & Logistics","value":"transportation_logistics"},{"text":"Human Resources & Recruiting","value":"hr_recruiting"},{"text":"Professional Services","value":"professional_services"},{"text":"Science & Research","value":"science_research"}]},"collection":"industries","field":"sub_industries"}	{"sort":7,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Home Services","value":"home_services"},{"text":"Legal Services","value":"legal_services"},{"text":"Healthcare & Wellness","value":"healthcare_wellness"},{"text":"Real Estate","value":"real_estate"},{"text":"Finance & Insurance","value":"finance_insurance"},{"text":"Education & Training","value":"education_training"},{"text":"Technology & Software","value":"technology_software"},{"text":"Marketing & Advertising","value":"marketing_advertising"},{"text":"Retail & Ecommerce","value":"retail_ecommerce"},{"text":"Automotive","value":"automotive"},{"text":"Food & Beverage","value":"food_beverage"},{"text":"Construction & Contracting","value":"construction_contracting"},{"text":"Manufacturing & Industrial","value":"manufacturing_industrial"},{"text":"Hospitality & Travel","value":"hospitality_travel"},{"text":"Beauty & Personal Care","value":"beauty_personal_care"},{"text":"Fitness & Sports","value":"fitness_sports"},{"text":"Government & Public Sector","value":"government_public_sector"},{"text":"Non-Profit & Community Services","value":"nonprofit_community_services"},{"text":"Arts, Media & Entertainment","value":"arts_media_entertainment"},{"text":"Agriculture & Farming","value":"agriculture_farming"},{"text":"Energy & Utilities","value":"energy_utilities"},{"text":"Transportation & Logistics","value":"transportation_logistics"},{"text":"Human Resources & Recruiting","value":"hr_recruiting"},{"text":"Professional Services","value":"professional_services"},{"text":"Science & Research","value":"science_research"}]},"collection":"industries","field":"sub_industries"}	\N	\N
836	896	directus_fields	314	{"sort":4,"special":["m2o"],"collection":"sub_industries","field":"industry"}	{"sort":4,"special":["m2o"],"collection":"sub_industries","field":"industry"}	\N	\N
837	897	directus_settings	1	{"id":1,"project_name":"LGR Data Engine","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":"Directus Color Match","theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"accepted_terms":true,"project_id":"019a9ec1-bd01-7363-aa4c-f4af8e6c87b0","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null}	{"default_theme_light":"Directus Color Match"}	\N	\N
856	923	directus_fields	315	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"industries"}	{"sort":1,"hidden":true,"readonly":true,"interface":"input","special":["uuid"],"field":"id","collection":"industries"}	\N	\N
857	924	directus_collections	industries	{"singleton":false,"collection":"industries"}	{"singleton":false,"collection":"industries"}	\N	\N
858	925	directus_fields	316	{"sort":2,"interface":"input","special":null,"collection":"industries","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"industries","field":"name"}	\N	\N
859	926	directus_fields	317	{"sort":3,"interface":"input","special":null,"collection":"industries","field":"slug"}	{"sort":3,"interface":"input","special":null,"collection":"industries","field":"slug"}	\N	\N
860	927	directus_fields	318	{"sort":4,"special":["cast-boolean"],"collection":"industries","field":"active"}	{"sort":4,"special":["cast-boolean"],"collection":"industries","field":"active"}	\N	\N
861	928	directus_fields	319	{"sort":5,"interface":"input-multiline","special":null,"collection":"industries","field":"description"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"industries","field":"description"}	\N	\N
862	929	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}	\N	\N
863	931	directus_access	d50f18bb-e405-4a29-a69a-79ffd6586c66	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	\N	\N
864	933	directus_permissions	19	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	\N	\N
865	934	directus_permissions	20	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	\N	\N
866	936	directus_permissions	21	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"create"}	\N	\N
867	937	directus_permissions	22	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"create"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"create"}	\N	\N
868	939	directus_permissions	23	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"create"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"create"}	\N	\N
869	940	directus_permissions	24	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"create"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"create"}	\N	\N
870	942	directus_access	dd941938-759f-4666-8681-e1c9b4db2938	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	\N	\N
871	943	directus_access	badeb774-00c5-47f7-9330-4c08983bebcc	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	\N	\N
872	944	directus_access	3818cac1-1014-46b1-b3db-23961b035d54	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	\N	\N
873	946	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["3818cac1-1014-46b1-b3db-23961b035d54"]}	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}	\N	\N
874	948	directus_permissions	25	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"update"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"update"}	\N	\N
875	949	directus_permissions	26	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"delete"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"delete"}	\N	\N
976	1095	content_outputs	14	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
876	950	directus_permissions	27	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"update"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"update"}	\N	\N
877	951	directus_permissions	28	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"delete"}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"delete"}	\N	\N
878	953	directus_permissions	29	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	\N	\N
879	954	directus_permissions	30	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	\N	\N
880	955	directus_permissions	31	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"update"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"update"}	\N	\N
881	956	directus_permissions	32	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"update"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"update"}	\N	\N
882	957	directus_permissions	33	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"delete"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"delete"}	\N	\N
883	958	directus_permissions	34	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"delete"}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"delete"}	\N	\N
884	960	directus_access	ae95c5f0-0e71-4987-b4d2-0f452447a6c5	{"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	{"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	\N	\N
885	961	directus_access	a92f6ea1-ee97-46cc-848e-635f14593901	{"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":{"id":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26"},"sort":2}	{"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":{"id":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26"},"sort":2}	\N	\N
886	963	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["3818cac1-1014-46b1-b3db-23961b035d54"]}	{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}	\N	\N
887	965	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	{"id":"24f7d0fe-8079-4470-a550-625130a01a4c","first_name":null,"last_name":null,"email":"jlanders@leadsgrowrevenue.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":null,"token":"**********","last_access":"2025-12-10T19:40:29.804Z","last_page":"/settings/roles/4b9c2a26-828b-4a29-92db-a4e714d6f484","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":"Directus Default","theme_light":"Directus Color Match","theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["ae95c5f0-0e71-4987-b4d2-0f452447a6c5","a92f6ea1-ee97-46cc-848e-635f14593901"]}	{"role":null}	\N	\N
888	967	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["3818cac1-1014-46b1-b3db-23961b035d54"]}	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}	\N	\N
890	972	directus_access	a92f6ea1-ee97-46cc-848e-635f14593901	{"id":"a92f6ea1-ee97-46cc-848e-635f14593901","role":null,"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","sort":2}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26"}	\N	\N
1091	1253	directus_fields	355	{"sort":4,"interface":"input-multiline","special":null,"collection":"ai_calls","field":"caller_input"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"ai_calls","field":"caller_input"}	\N	\N
1092	1254	directus_fields	356	{"sort":5,"interface":"input-multiline","special":null,"collection":"ai_calls","field":"ai_response"}	{"sort":5,"interface":"input-multiline","special":null,"collection":"ai_calls","field":"ai_response"}	\N	\N
889	971	directus_policies	233baca0-0e60-495a-bcd0-d5ed9aa0ae26	{"id":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","name":"Content Engine API","icon":"badge","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":false,"permissions":[23,24,29,30,31,32,33,34],"users":["a92f6ea1-ee97-46cc-848e-635f14593901","dd941938-759f-4666-8681-e1c9b4db2938","badeb774-00c5-47f7-9330-4c08983bebcc","3818cac1-1014-46b1-b3db-23961b035d54"],"roles":["a92f6ea1-ee97-46cc-848e-635f14593901","dd941938-759f-4666-8681-e1c9b4db2938","badeb774-00c5-47f7-9330-4c08983bebcc","3818cac1-1014-46b1-b3db-23961b035d54"]}	{"admin_access":true}	890	\N
891	976	directus_access	7debc28d-5fbd-4742-8a2f-77dfc59b29c3	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	\N	\N
892	978	directus_policies	d80ee19f-598d-48f6-98e9-994edd627596	{"name":"Dev Superuser","admin_access":true,"app_access":true}	{"name":"Dev Superuser","admin_access":true,"app_access":true}	\N	\N
894	980	directus_policies	d80ee19f-598d-48f6-98e9-994edd627596	{"id":"d80ee19f-598d-48f6-98e9-994edd627596","name":"Dev Superuser","icon":"badge","description":"Any role attached to this policy can do anything on any collection.","ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":true,"permissions":[],"users":["9f0a6d28-2d14-4712-bbdf-6345ffaab41b"],"roles":["9f0a6d28-2d14-4712-bbdf-6345ffaab41b"]}	{"description":"Any role attached to this policy can do anything on any collection."}	\N	\N
893	979	directus_access	9f0a6d28-2d14-4712-bbdf-6345ffaab41b	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","user":{"id":"24f7d0fe-8079-4470-a550-625130a01a4c"}}	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","user":{"id":"24f7d0fe-8079-4470-a550-625130a01a4c"}}	894	\N
895	982	directus_access	6e5376d8-86bb-43b2-8ca9-8750517b06eb	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	\N	\N
896	983	directus_access	b80270be-d6bd-404c-968e-c02920fc7176	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	\N	\N
897	985	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	{"id":"24f7d0fe-8079-4470-a550-625130a01a4c","first_name":null,"last_name":null,"email":"jlanders@leadsgrowrevenue.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":"2025-12-10T20:20:37.666Z","last_page":"/users/24f7d0fe-8079-4470-a550-625130a01a4c","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":"Directus Default","theme_light":"Directus Color Match","theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["ae95c5f0-0e71-4987-b4d2-0f452447a6c5","9f0a6d28-2d14-4712-bbdf-6345ffaab41b"]}	{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}	\N	\N
898	986	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["3818cac1-1014-46b1-b3db-23961b035d54","b80270be-d6bd-404c-968e-c02920fc7176"]}	{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}	\N	\N
899	987	directus_fields	320	{"sort":4,"interface":"input-multiline","special":null,"collection":"sub_industries","field":"description"}	{"sort":4,"interface":"input-multiline","special":null,"collection":"sub_industries","field":"description"}	\N	\N
900	988	directus_fields	321	{"sort":5,"special":["cast-boolean"],"collection":"sub_industries","field":"active"}	{"sort":5,"special":["cast-boolean"],"collection":"sub_industries","field":"active"}	\N	\N
901	989	directus_fields	322	{"sort":6,"special":["m2o"],"collection":"sub_industries","field":"industry"}	{"sort":6,"special":["m2o"],"collection":"sub_industries","field":"industry"}	\N	\N
902	990	directus_fields	323	{"sort":14,"special":["m2o"],"collection":"content_requests","field":"industry"}	{"sort":14,"special":["m2o"],"collection":"content_requests","field":"industry"}	\N	\N
903	991	directus_fields	324	{"sort":15,"special":["m2o"],"collection":"content_requests","field":"sub_industry"}	{"sort":15,"special":["m2o"],"collection":"content_requests","field":"sub_industry"}	\N	\N
904	993	directus_fields	325	{"sort":16,"special":["m2o"],"collection":"content_requests","field":"industry"}	{"sort":16,"special":["m2o"],"collection":"content_requests","field":"industry"}	\N	\N
905	995	directus_fields	326	{"sort":16,"special":["m2o"],"collection":"content_requests","field":"industry"}	{"sort":16,"special":["m2o"],"collection":"content_requests","field":"industry"}	\N	\N
906	996	directus_fields	327	{"sort":6,"special":["m2o"],"collection":"industries","field":"industry"}	{"sort":6,"special":["m2o"],"collection":"industries","field":"industry"}	\N	\N
907	997	directus_fields	327	{"id":327,"collection":"industries","field":"industry","special":["m2o"],"interface":null,"options":null,"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"industries","field":"industry","display":"raw"}	\N	\N
908	999	directus_fields	324	{"id":324,"collection":"content_requests","field":"sub_industry","special":["m2o"],"interface":null,"options":null,"display":"related-values","display_options":{"template":"{{ name }}"},"readonly":false,"hidden":false,"sort":15,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"sub_industry","display":"related-values","display_options":{"template":"{{ name }}"}}	\N	\N
909	1000	directus_fields	326	{"id":326,"collection":"content_requests","field":"industry","special":["m2o"],"interface":null,"options":null,"display":"related-values","display_options":{"template":"{{ name }}"},"readonly":false,"hidden":false,"sort":16,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"industry","display":"related-values","display_options":{"template":"{{ name }}"}}	\N	\N
910	1002	directus_fields	328	{"sort":17,"special":["m2o"],"collection":"content_requests","field":"sub_industry"}	{"sort":17,"special":["m2o"],"collection":"content_requests","field":"sub_industry"}	\N	\N
911	1003	directus_fields	326	{"id":326,"collection":"content_requests","field":"industry","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{ name }}"},"display":"related-values","display_options":{"template":"{{ name }}"},"readonly":false,"hidden":false,"sort":16,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"industry","interface":"select-dropdown-m2o","options":{"template":"{{ name }}"}}	\N	\N
912	1004	directus_fields	328	{"id":328,"collection":"content_requests","field":"sub_industry","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{ name }}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":17,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"content_requests","field":"sub_industry","interface":"select-dropdown-m2o","options":{"template":"{{ name }}"}}	\N	\N
913	1005	sub_industries	129	{"name":"hvac"}	{"name":"hvac"}	914	\N
914	1006	content_requests	2	{"status":"drafting","content_type":"how_to","source":"trend_monitor","industry":"6774f0be-0669-4ffb-9df5-0bd378359769","sub_industry":{"name":"hvac"}}	{"status":"drafting","content_type":"how_to","source":"trend_monitor","industry":"6774f0be-0669-4ffb-9df5-0bd378359769","sub_industry":{"name":"hvac"}}	\N	\N
915	1008	content_requests	3	{"status":"researching","topic":"cold weather in chicago","primary_keyword":"cold weather in chicago","location":"Chicago, Illinois","content_type":"how_to","industry":"6774f0be-0669-4ffb-9df5-0bd378359769","sub_industry":2}	{"status":"researching","topic":"cold weather in chicago","primary_keyword":"cold weather in chicago","location":"Chicago, Illinois","content_type":"how_to","industry":"6774f0be-0669-4ffb-9df5-0bd378359769","sub_industry":2}	\N	\N
916	1009	directus_access	4299dc4a-2c97-4229-a451-146d207c7aeb	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","policy":{"id":"3f28eae1-ef20-479d-bf86-24b4ea652cc9"},"sort":1}	\N	\N
917	1011	directus_users	09004418-6a01-4c82-825a-6e34cdf19fd9	{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9","first_name":"N8N_Content","last_name":"Engine","email":"leadsgrowrevenue@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["3818cac1-1014-46b1-b3db-23961b035d54","b80270be-d6bd-404c-968e-c02920fc7176"]}	{"role":"6544cab5-a43c-45fe-8f20-976eaa3a234d","token":"**********"}	\N	\N
918	1013	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	{"id":"24f7d0fe-8079-4470-a550-625130a01a4c","first_name":"John","last_name":"Landers","email":"jlanders@leadsgrowrevenue.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":"2025-12-11T13:33:36.469Z","last_page":"/settings/data-model","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":"Directus Default","theme_light":"Directus Color Match","theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["ae95c5f0-0e71-4987-b4d2-0f452447a6c5","9f0a6d28-2d14-4712-bbdf-6345ffaab41b"]}	{"first_name":"John","last_name":"Landers","token":"**********"}	\N	\N
919	1014	directus_access	a0e7dc05-0e0e-4c48-ac98-4bf154278e10	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	{"policy":"d80ee19f-598d-48f6-98e9-994edd627596","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	\N	\N
920	1016	directus_access	9860b111-c409-48c8-a521-1f48c53b21c1	{"user":"09004418-6a01-4c82-825a-6e34cdf19fd9","policy":{"id":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b"},"sort":1}	{"user":"09004418-6a01-4c82-825a-6e34cdf19fd9","policy":{"id":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b"},"sort":1}	\N	\N
921	1019	directus_access	4938d5ed-0183-433a-a184-5eb6797b1fcd	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	{"policy":"3f28eae1-ef20-479d-bf86-24b4ea652cc9","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	\N	\N
922	1021	directus_access	a181eebc-5563-462d-bbb9-bf3cdae69d39	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","user":{"id":"bf970007-d005-407c-a1e6-399bba718004"}}	{"policy":"233baca0-0e60-495a-bcd0-d5ed9aa0ae26","user":{"id":"bf970007-d005-407c-a1e6-399bba718004"}}	\N	\N
923	1023	directus_access	44ab486d-50d1-402f-91a3-798066e2777e	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","role":{"id":"85bf971e-6a2f-4ac8-8e78-32069eb6667e"}}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","role":{"id":"85bf971e-6a2f-4ac8-8e78-32069eb6667e"}}	\N	\N
924	1024	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","user":{"id":"24f7d0fe-8079-4470-a550-625130a01a4c"}}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","user":{"id":"24f7d0fe-8079-4470-a550-625130a01a4c"}}	\N	\N
925	1027	directus_permissions	35	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"}	933	\N
926	1028	directus_permissions	36	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"}	933	\N
927	1029	directus_permissions	37	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"}	933	\N
928	1030	directus_permissions	38	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"}	933	\N
929	1031	directus_permissions	39	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"}	933	\N
930	1032	directus_permissions	40	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	933	\N
931	1033	directus_permissions	41	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	933	\N
932	1034	directus_permissions	42	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"topics","action":"read"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"topics","action":"read"}	933	\N
934	1036	directus_access	6655e9e9-38fd-4332-b566-4b93eeb5908a	{"policy":{"name":"Content Engine API","permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"topics","action":"read"}],"update":[],"delete":[]}},"sort":2,"user":"24f7d0fe-8079-4470-a550-625130a01a4c"}	{"policy":{"name":"Content Engine API","permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"topics","action":"read"}],"update":[],"delete":[]}},"sort":2,"user":"24f7d0fe-8079-4470-a550-625130a01a4c"}	\N	\N
933	1035	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	{"name":"Content Engine API","permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"topics","action":"read"}],"update":[],"delete":[]}}	{"name":"Content Engine API","permissions":{"create":[{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"},{"policy":"+","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"topics","action":"read"}],"update":[],"delete":[]}}	934	\N
935	1038	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	{"id":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","name":"Content Engine API","icon":"badge","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":true,"permissions":[35,36,37,38,39,40,41,42],"users":["6655e9e9-38fd-4332-b566-4b93eeb5908a"],"roles":["6655e9e9-38fd-4332-b566-4b93eeb5908a"]}	{"admin_access":true,"app_access":true}	\N	\N
936	1040	directus_access	4716c113-ef2d-4fe3-b45f-fd39560894c3	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","role":{"id":"6544cab5-a43c-45fe-8f20-976eaa3a234d"}}	\N	\N
937	1041	directus_access	3083f9b8-f4cc-4384-b809-c5195d8b9c32	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","role":{"id":"4b9c2a26-828b-4a29-92db-a4e714d6f484"}}	\N	\N
938	1042	directus_access	f09817eb-f7c7-430b-961d-7aac47fb93c3	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","user":{"id":"09004418-6a01-4c82-825a-6e34cdf19fd9"}}	\N	\N
950	1057	directus_permissions	50	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"update"}	\N	\N
940	1045	directus_access	6655e9e9-38fd-4332-b566-4b93eeb5908a	{"id":"6655e9e9-38fd-4332-b566-4b93eeb5908a","role":null,"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","sort":2}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7"}	\N	\N
939	1044	directus_policies	92f10ed0-cdd9-4575-bc0e-f96f5abe09d7	{"id":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","name":"Content Engine API","icon":"badge","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true,"permissions":[35,36,37,38,39,40,41,42],"users":["6655e9e9-38fd-4332-b566-4b93eeb5908a","4716c113-ef2d-4fe3-b45f-fd39560894c3","3083f9b8-f4cc-4384-b809-c5195d8b9c32","f09817eb-f7c7-430b-961d-7aac47fb93c3"],"roles":["6655e9e9-38fd-4332-b566-4b93eeb5908a","4716c113-ef2d-4fe3-b45f-fd39560894c3","3083f9b8-f4cc-4384-b809-c5195d8b9c32","f09817eb-f7c7-430b-961d-7aac47fb93c3"]}	{"admin_access":false}	940	\N
941	1047	directus_permissions	43	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"read"}	945	\N
942	1048	directus_permissions	44	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"read"}	945	\N
1093	1255	directus_fields	357	{"sort":6,"interface":"input","special":null,"collection":"ai_calls","field":"sync_status"}	{"sort":6,"interface":"input","special":null,"collection":"ai_calls","field":"sync_status"}	\N	\N
943	1049	directus_permissions	45	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"create"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"industries","action":"create"}	945	\N
944	1050	directus_permissions	46	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"create"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"sub_industries","action":"create"}	945	\N
946	1052	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	{"id":"be2b842a-9bb7-4ced-9b59-394612771d26","role":null,"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","sort":null}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b"}	\N	\N
945	1051	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	{"id":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","name":"Administrator","icon":"verified","description":"$t:admin_description","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true,"permissions":[43,44,45,46],"users":["9860b111-c409-48c8-a521-1f48c53b21c1","d41cae59-b171-4a82-b36f-65504e894fbd","87c485bc-9987-489d-8da6-fc8a945ee3cb","7debc28d-5fbd-4742-8a2f-77dfc59b29c3","44ab486d-50d1-402f-91a3-798066e2777e","be2b842a-9bb7-4ced-9b59-394612771d26"],"roles":["9860b111-c409-48c8-a521-1f48c53b21c1","d41cae59-b171-4a82-b36f-65504e894fbd","87c485bc-9987-489d-8da6-fc8a945ee3cb","7debc28d-5fbd-4742-8a2f-77dfc59b29c3","44ab486d-50d1-402f-91a3-798066e2777e","be2b842a-9bb7-4ced-9b59-394612771d26"]}	{"admin_access":false}	946	\N
947	1054	directus_permissions	47	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"read"}	\N	\N
948	1055	directus_permissions	48	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"read"}	\N	\N
949	1056	directus_permissions	49	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"create"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_requests","action":"create"}	\N	\N
951	1058	directus_permissions	51	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"create"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"create"}	\N	\N
952	1059	directus_permissions	52	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"update"}	\N	\N
953	1061	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	{"id":"be2b842a-9bb7-4ced-9b59-394612771d26","role":null,"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","sort":null}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b"}	\N	\N
954	1065	directus_permissions	53	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"create"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"create"}	\N	\N
955	1066	directus_permissions	54	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"read"}	\N	\N
956	1067	directus_permissions	55	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"update"}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"audience_profiles","action":"update"}	\N	\N
958	1070	directus_users	24f7d0fe-8079-4470-a550-625130a01a4c	{"id":"24f7d0fe-8079-4470-a550-625130a01a4c","first_name":"John","last_name":"Landers","email":"jlanders@leadsgrowrevenue.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":"2025-12-11T13:33:36.469Z","last_page":"/users/24f7d0fe-8079-4470-a550-625130a01a4c","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":"Directus Default","theme_light":"Directus Color Match","theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":["ae95c5f0-0e71-4987-b4d2-0f452447a6c5","6655e9e9-38fd-4332-b566-4b93eeb5908a","be2b842a-9bb7-4ced-9b59-394612771d26"]}	{"token":"**********"}	\N	\N
957	1069	directus_access	be2b842a-9bb7-4ced-9b59-394612771d26	{"id":"be2b842a-9bb7-4ced-9b59-394612771d26","role":null,"user":"24f7d0fe-8079-4470-a550-625130a01a4c","policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","sort":null}	{"policy":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b"}	958	\N
959	1071	content_outputs	1	\N	\N	\N	\N
960	1072	content_outputs	2	\N	\N	\N	\N
961	1074	content_outputs	3	\N	\N	\N	\N
962	1075	content_outputs	4	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
963	1076	content_outputs	5	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
964	1077	content_outputs	6	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
965	1078	content_outputs	7	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
966	1079	content_outputs	8	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
967	1080	content_outputs	9	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
968	1081	content_outputs	10	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
969	1082	content_outputs	11	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
970	1083	directus_permissions	56	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"create"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"content_outputs","action":"create"}	\N	\N
971	1084	directus_permissions	35	{"id":35,"collection":"content_outputs","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7"}	{"collection":"content_outputs","action":"read","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7"}	\N	\N
972	1085	directus_permissions	36	{"id":36,"collection":"content_outputs","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7"}	{"collection":"content_outputs","action":"update","permissions":null,"validation":null,"presets":null,"fields":["*"],"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7"}	\N	\N
973	1087	content_outputs	12	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
974	1090	directus_permissions	57	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"update"}	{"policy":"92f10ed0-cdd9-4575-bc0e-f96f5abe09d7","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"update"}	\N	\N
975	1092	content_outputs	13	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
1024	1179	directus_fields	344	{"sort":5,"special":["m2o"],"collection":"AR_Tenants","field":"snapshots"}	{"sort":5,"special":["m2o"],"collection":"AR_Tenants","field":"snapshots"}	\N	\N
977	1097	content_outputs	15	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
978	1098	content_outputs	15	{"id":15,"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago","meta_title":null,"meta_description":null,"summary":null,"outline_markdown":null,"body_markdown":"In today’s competitive landscape, businesses need to leverage every advantage they can find. One of the most effective ways to enhance your online presence is through search engine optimization (SEO). It’s not just about using the right keywords; it’s about understanding the intent behind those keywords and how they relate to your audience.\\n\\nFirst off, let’s break down what SEO really means. At its core, SEO is about optimizing your website so that it ranks higher on search engine results pages (SERPs). This means using relevant keywords, but also focusing on creating high-quality content that answers users’ questions and provides real value.\\n\\nA crucial aspect of SEO is on-page optimization. This involves tweaking elements on your website—like title tags, meta descriptions, and headers—to make sure they’re aligned with the keywords you’re targeting. Don’t forget about images and alt text, as these can also play a role in how your site is indexed.\\n\\nOff-page SEO is just as important. Building backlinks from reputable sites can significantly boost your authority in the eyes of search engines. The more high-quality links you have pointing back to your site, the better your chances of ranking well.\\n\\nContent is king, but context is queen. It’s vital to create content that not only incorporates keywords but also engages your audience. Think about what your potential customers are searching for and how you can provide them with answers. Blogs, infographics, videos, and podcasts are all effective formats that can help convey your message and improve your SEO.\\n\\nLastly, don’t underestimate the importance of analytics. Use tools like Google Analytics to track your progress and see what’s working—and what isn’t. This data can help you refine your strategy over time, ensuring you stay ahead of the competition.\\n\\nIn summary, SEO is a multi-faceted approach that requires attention to detail and a commitment to quality. By focusing on both on-page and off-page strategies, and continuously analyzing your efforts, you can enhance your online visibility and drive more traffic to your site.","seo_score":null,"body_html":null,"published_url":null,"schema_json":null,"faqs":null,"short_form_snippets":null}	{"body_markdown":"In today’s competitive landscape, businesses need to leverage every advantage they can find. One of the most effective ways to enhance your online presence is through search engine optimization (SEO). It’s not just about using the right keywords; it’s about understanding the intent behind those keywords and how they relate to your audience.\\n\\nFirst off, let’s break down what SEO really means. At its core, SEO is about optimizing your website so that it ranks higher on search engine results pages (SERPs). This means using relevant keywords, but also focusing on creating high-quality content that answers users’ questions and provides real value.\\n\\nA crucial aspect of SEO is on-page optimization. This involves tweaking elements on your website—like title tags, meta descriptions, and headers—to make sure they’re aligned with the keywords you’re targeting. Don’t forget about images and alt text, as these can also play a role in how your site is indexed.\\n\\nOff-page SEO is just as important. Building backlinks from reputable sites can significantly boost your authority in the eyes of search engines. The more high-quality links you have pointing back to your site, the better your chances of ranking well.\\n\\nContent is king, but context is queen. It’s vital to create content that not only incorporates keywords but also engages your audience. Think about what your potential customers are searching for and how you can provide them with answers. Blogs, infographics, videos, and podcasts are all effective formats that can help convey your message and improve your SEO.\\n\\nLastly, don’t underestimate the importance of analytics. Use tools like Google Analytics to track your progress and see what’s working—and what isn’t. This data can help you refine your strategy over time, ensuring you stay ahead of the competition.\\n\\nIn summary, SEO is a multi-faceted approach that requires attention to detail and a commitment to quality. By focusing on both on-page and off-page strategies, and continuously analyzing your efforts, you can enhance your online visibility and drive more traffic to your site."}	\N	\N
979	1099	content_outputs	16	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
980	1100	content_outputs	16	{"id":16,"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago","meta_title":null,"meta_description":null,"summary":null,"outline_markdown":null,"body_markdown":"When it comes to boosting your website’s visibility, understanding SEO is key. Search engine optimization isn’t just a buzzword; it’s a crucial strategy for driving organic traffic. Let’s break down some essential components that can elevate your online presence.\\n\\n**Keyword Research**  \\nStart with thorough keyword research. Identify the terms your target audience is searching for. Tools like Google Keyword Planner or SEMrush can help you find relevant keywords with good search volume. Focus on long-tail keywords, as they often have less competition and can lead to higher conversion rates.\\n\\n**On-Page SEO**  \\nOnce you’ve pinpointed your keywords, it’s time to implement them effectively on your site. This includes optimizing title tags, meta descriptions, and header tags. Make sure your content is structured well; use bullet points and short paragraphs to enhance readability. Remember, the goal is to provide value to your readers while naturally incorporating your keywords.\\n\\n**Quality Content**  \\nContent is king. Producing high-quality, engaging content should be your top priority. Aim to answer questions and solve problems for your audience. Regularly update your blog or website with fresh material to keep visitors coming back.  \\n\\n**Link Building**  \\nBuilding backlinks is another vital aspect of SEO. Focus on acquiring links from reputable sites in your niche. Guest blogging, creating shareable infographics, and engaging in online communities can help you establish authority and improve your site’s ranking.\\n\\n**Technical SEO**  \\nDon’t overlook the technical side of SEO. Ensure your website loads quickly, is mobile-friendly, and has a clear site structure. Use tools like Google Search Console to monitor your site’s performance and identify any issues that need fixing.\\n\\n**Analytics and Adjustments**  \\nFinally, keep an eye on your analytics. Use Google Analytics to track your traffic and user behavior. This data will provide insights into what’s working and what needs improvement. Adjust your strategies accordingly to stay ahead of the competition.\\n\\nIn summary, mastering SEO involves a mix of research, quality content, and ongoing adjustments. Stay informed about industry trends, and don’t hesitate to adapt your strategies as needed. With consistent effort, you’ll see your website climb the search rankings.","seo_score":null,"body_html":null,"published_url":null,"schema_json":null,"faqs":null,"short_form_snippets":null}	{"body_markdown":"When it comes to boosting your website’s visibility, understanding SEO is key. Search engine optimization isn’t just a buzzword; it’s a crucial strategy for driving organic traffic. Let’s break down some essential components that can elevate your online presence.\\n\\n**Keyword Research**  \\nStart with thorough keyword research. Identify the terms your target audience is searching for. Tools like Google Keyword Planner or SEMrush can help you find relevant keywords with good search volume. Focus on long-tail keywords, as they often have less competition and can lead to higher conversion rates.\\n\\n**On-Page SEO**  \\nOnce you’ve pinpointed your keywords, it’s time to implement them effectively on your site. This includes optimizing title tags, meta descriptions, and header tags. Make sure your content is structured well; use bullet points and short paragraphs to enhance readability. Remember, the goal is to provide value to your readers while naturally incorporating your keywords.\\n\\n**Quality Content**  \\nContent is king. Producing high-quality, engaging content should be your top priority. Aim to answer questions and solve problems for your audience. Regularly update your blog or website with fresh material to keep visitors coming back.  \\n\\n**Link Building**  \\nBuilding backlinks is another vital aspect of SEO. Focus on acquiring links from reputable sites in your niche. Guest blogging, creating shareable infographics, and engaging in online communities can help you establish authority and improve your site’s ranking.\\n\\n**Technical SEO**  \\nDon’t overlook the technical side of SEO. Ensure your website loads quickly, is mobile-friendly, and has a clear site structure. Use tools like Google Search Console to monitor your site’s performance and identify any issues that need fixing.\\n\\n**Analytics and Adjustments**  \\nFinally, keep an eye on your analytics. Use Google Analytics to track your traffic and user behavior. This data will provide insights into what’s working and what needs improvement. Adjust your strategies accordingly to stay ahead of the competition.\\n\\nIn summary, mastering SEO involves a mix of research, quality content, and ongoing adjustments. Stay informed about industry trends, and don’t hesitate to adapt your strategies as needed. With consistent effort, you’ll see your website climb the search rankings."}	\N	\N
981	1101	content_requests	1	{"id":1,"status":"Ready","topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois","content_type":null,"source":null,"auto_published":false,"style":null,"created_at":null,"updated_at":null,"forget_audience":null,"style_persona_id":null,"industry":null,"sub_industry":null}	{"status":"Ready"}	\N	\N
982	1102	content_outputs	17	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
983	1103	content_outputs	17	{"id":17,"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago","meta_title":null,"meta_description":null,"summary":null,"outline_markdown":null,"body_markdown":"SEO is a crucial part of online marketing. It helps businesses improve their visibility on search engines, driving more traffic to their websites. To get started with SEO, you need to understand a few key concepts.  \\n\\nFirst, focus on keyword research. This involves finding the terms your potential customers are using when they search for products or services like yours. Tools like Google Keyword Planner can help you identify these keywords. Once you have a list, integrate these keywords into your website content naturally.  \\n\\nNext up is on-page optimization. This means optimizing individual pages on your site to rank higher. Pay attention to title tags, meta descriptions, and header tags. These elements should include your target keywords and provide clear, concise information about the content.  \\n\\nDon’t overlook the importance of quality content. Search engines favor websites that offer valuable, relevant, and engaging content. Regularly updating your blog or website with fresh material can help retain visitors and attract new ones.  \\n\\nLink building is another essential aspect. This involves acquiring backlinks from other reputable websites. Backlinks signal to search engines that your site is trustworthy and authoritative. You can gain backlinks through guest blogging, partnerships, or by creating shareable content.  \\n\\nLastly, track your progress. Use tools like Google Analytics to monitor your website's performance. Keep an eye on metrics such as organic traffic, bounce rate, and conversion rate. This data will help you refine your SEO strategy over time.  \\n\\nIn summary, mastering SEO takes time and effort. By focusing on keyword research, on-page optimization, quality content, link building, and analytics, you can significantly improve your online presence.","seo_score":null,"body_html":null,"published_url":null,"schema_json":null,"faqs":null,"short_form_snippets":null}	{"body_markdown":"SEO is a crucial part of online marketing. It helps businesses improve their visibility on search engines, driving more traffic to their websites. To get started with SEO, you need to understand a few key concepts.  \\n\\nFirst, focus on keyword research. This involves finding the terms your potential customers are using when they search for products or services like yours. Tools like Google Keyword Planner can help you identify these keywords. Once you have a list, integrate these keywords into your website content naturally.  \\n\\nNext up is on-page optimization. This means optimizing individual pages on your site to rank higher. Pay attention to title tags, meta descriptions, and header tags. These elements should include your target keywords and provide clear, concise information about the content.  \\n\\nDon’t overlook the importance of quality content. Search engines favor websites that offer valuable, relevant, and engaging content. Regularly updating your blog or website with fresh material can help retain visitors and attract new ones.  \\n\\nLink building is another essential aspect. This involves acquiring backlinks from other reputable websites. Backlinks signal to search engines that your site is trustworthy and authoritative. You can gain backlinks through guest blogging, partnerships, or by creating shareable content.  \\n\\nLastly, track your progress. Use tools like Google Analytics to monitor your website's performance. Keep an eye on metrics such as organic traffic, bounce rate, and conversion rate. This data will help you refine your SEO strategy over time.  \\n\\nIn summary, mastering SEO takes time and effort. By focusing on keyword research, on-page optimization, quality content, link building, and analytics, you can significantly improve your online presence."}	\N	\N
984	1104	content_requests	1	{"id":1,"status":"Ready","topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois","content_type":null,"source":null,"auto_published":false,"style":null,"created_at":null,"updated_at":null,"forget_audience":null,"style_persona_id":null,"industry":null,"sub_industry":null}	{"status":"Ready"}	\N	\N
985	1105	content_outputs	18	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
1005	1159	niche_snapshots	1	{"niche_name":"Legal","urgency_level":["medium"],"industry_vocabulary":["plaintiff","defendant","liability","statute of limitations","contingency fee","retainer","deposition","tort"],"default_tools":["legal_intake_form","conflict_check","schedule_consultation","emergency_escalation_sms"],"system_prompt_base":"You are an Intake Specialist for {{business_name}}. You are NOT an attorney and cannot give legal advice. YOUR GOAL: Gather the facts of the potential client's case with empathy and professionalism, then schedule a consultation if they qualify. MANDATORY SCRIPT:\\n\\nDisclaimer: If a user asks for advice (e.g., \\"Will I win?\\"), reply: \\"I cannot provide legal advice, but I can set up a free consultation with an attorney who can evaluate your case.\\"\\n\\nIntake Phase: Before booking, you must ask:\\n\\n\\"When did the incident occur?\\"\\n\\n\\"Were there any injuries?\\"\\n\\n\\"Have you already spoken to another law firm?\\"\\n\\nTONE: Empathetic, discreet, professional, and calm. Never use slang.\\n\\nESCALATION: If the caller mentions being currently arrested, in jail, or served with papers for court tomorrow, use the emergency_escalation_sms tool immediately."}	{"niche_name":"Legal","urgency_level":["medium"],"industry_vocabulary":["plaintiff","defendant","liability","statute of limitations","contingency fee","retainer","deposition","tort"],"default_tools":["legal_intake_form","conflict_check","schedule_consultation","emergency_escalation_sms"],"system_prompt_base":"You are an Intake Specialist for {{business_name}}. You are NOT an attorney and cannot give legal advice. YOUR GOAL: Gather the facts of the potential client's case with empathy and professionalism, then schedule a consultation if they qualify. MANDATORY SCRIPT:\\n\\nDisclaimer: If a user asks for advice (e.g., \\"Will I win?\\"), reply: \\"I cannot provide legal advice, but I can set up a free consultation with an attorney who can evaluate your case.\\"\\n\\nIntake Phase: Before booking, you must ask:\\n\\n\\"When did the incident occur?\\"\\n\\n\\"Were there any injuries?\\"\\n\\n\\"Have you already spoken to another law firm?\\"\\n\\nTONE: Empathetic, discreet, professional, and calm. Never use slang.\\n\\nESCALATION: If the caller mentions being currently arrested, in jail, or served with papers for court tomorrow, use the emergency_escalation_sms tool immediately."}	\N	\N
986	1106	content_outputs	18	{"id":18,"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago","meta_title":null,"meta_description":null,"summary":null,"outline_markdown":null,"body_markdown":"When it comes to enhancing your website's visibility, understanding search engine optimization (SEO) is vital. SEO isn’t just about using the right keywords; it’s about creating a seamless experience for your visitors. Here’s a breakdown of key strategies to implement for better results.\\n\\n**Focus on Quality Content**  \\nGreat content is the backbone of any successful SEO strategy. It’s not enough to simply stuff your articles with keywords. Instead, aim for informative, engaging, and original content that truly addresses the needs of your audience. Regularly updating your blog with relevant topics can also keep your site fresh in the eyes of search engines.\\n\\n**Keyword Research**  \\nEffective keyword research is crucial. Use tools like Google Keyword Planner or SEMrush to identify keywords that your target audience is searching for. Look for a mix of long-tail and short-tail keywords to optimize your content effectively.\\n\\n**On-Page SEO**  \\nOptimize your website's structure and content. Use header tags to break up text and include keywords naturally. Meta descriptions and alt tags for images should also be crafted thoughtfully, as they play a role in how search engines interpret your content.\\n\\n**Mobile Optimization**  \\nWith the increasing use of mobile devices, ensuring your site is mobile-friendly is essential. A responsive design improves user experience and can positively impact your search rankings. \\n\\n**Link Building**  \\nBuilding high-quality backlinks can significantly boost your website's authority. Reach out to relevant sites for guest blogging opportunities and consider engaging with your audience on social media to drive traffic back to your site.\\n\\n**Monitor and Adjust**  \\nSEO isn’t a one-and-done deal. It requires constant monitoring and adjustments. Use tools like Google Analytics to track your performance and make data-driven decisions.\\n\\nBy implementing these strategies, you can improve your website’s SEO, attract more visitors, and ultimately achieve your business goals.","seo_score":null,"body_html":null,"published_url":null,"schema_json":null,"faqs":null,"short_form_snippets":null}	{"body_markdown":"When it comes to enhancing your website's visibility, understanding search engine optimization (SEO) is vital. SEO isn’t just about using the right keywords; it’s about creating a seamless experience for your visitors. Here’s a breakdown of key strategies to implement for better results.\\n\\n**Focus on Quality Content**  \\nGreat content is the backbone of any successful SEO strategy. It’s not enough to simply stuff your articles with keywords. Instead, aim for informative, engaging, and original content that truly addresses the needs of your audience. Regularly updating your blog with relevant topics can also keep your site fresh in the eyes of search engines.\\n\\n**Keyword Research**  \\nEffective keyword research is crucial. Use tools like Google Keyword Planner or SEMrush to identify keywords that your target audience is searching for. Look for a mix of long-tail and short-tail keywords to optimize your content effectively.\\n\\n**On-Page SEO**  \\nOptimize your website's structure and content. Use header tags to break up text and include keywords naturally. Meta descriptions and alt tags for images should also be crafted thoughtfully, as they play a role in how search engines interpret your content.\\n\\n**Mobile Optimization**  \\nWith the increasing use of mobile devices, ensuring your site is mobile-friendly is essential. A responsive design improves user experience and can positively impact your search rankings. \\n\\n**Link Building**  \\nBuilding high-quality backlinks can significantly boost your website's authority. Reach out to relevant sites for guest blogging opportunities and consider engaging with your audience on social media to drive traffic back to your site.\\n\\n**Monitor and Adjust**  \\nSEO isn’t a one-and-done deal. It requires constant monitoring and adjustments. Use tools like Google Analytics to track your performance and make data-driven decisions.\\n\\nBy implementing these strategies, you can improve your website’s SEO, attract more visitors, and ultimately achieve your business goals."}	\N	\N
987	1107	content_requests	1	{"id":1,"status":"Ready","topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois","content_type":null,"source":null,"auto_published":false,"style":null,"created_at":null,"updated_at":null,"forget_audience":null,"style_persona_id":null,"industry":null,"sub_industry":null}	{"status":"Ready"}	\N	\N
988	1108	content_outputs	19	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
989	1109	content_outputs	19	{"id":19,"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago","meta_title":null,"meta_description":null,"summary":null,"outline_markdown":null,"body_markdown":"When it comes to home improvement, many homeowners wonder whether they should tackle projects themselves or hire a professional. Each option has its pros and cons, and the right choice often depends on the specific project and your own skills.\\n\\nDIY projects can be incredibly rewarding. They allow you to save money and customize your home exactly how you want it. Plus, there’s a certain satisfaction that comes from completing a project with your own hands. However, not every task is suitable for DIY. Some projects require specialized knowledge or tools that can be expensive to rent or buy. If you're not careful, you could end up causing more damage, which might cost you even more in the long run.\\n\\nOn the flip side, hiring a professional can take the stress off your shoulders. Pros have the experience and tools needed to get the job done efficiently and correctly. They can also spot potential issues that you might overlook. That said, hiring someone can be a significant financial investment, and it’s crucial to choose someone reliable to avoid any headaches.\\n\\nIn the end, it’s about weighing your options. Think about your skill level, the complexity of the project, and your budget. If you're unsure, consulting with a professional before making a decision can help clarify the best path forward. Whether you choose DIY or professional help, the goal is a successful home improvement that enhances your living space.","seo_score":null,"body_html":null,"published_url":null,"schema_json":null,"faqs":null,"short_form_snippets":null}	{"body_markdown":"When it comes to home improvement, many homeowners wonder whether they should tackle projects themselves or hire a professional. Each option has its pros and cons, and the right choice often depends on the specific project and your own skills.\\n\\nDIY projects can be incredibly rewarding. They allow you to save money and customize your home exactly how you want it. Plus, there’s a certain satisfaction that comes from completing a project with your own hands. However, not every task is suitable for DIY. Some projects require specialized knowledge or tools that can be expensive to rent or buy. If you're not careful, you could end up causing more damage, which might cost you even more in the long run.\\n\\nOn the flip side, hiring a professional can take the stress off your shoulders. Pros have the experience and tools needed to get the job done efficiently and correctly. They can also spot potential issues that you might overlook. That said, hiring someone can be a significant financial investment, and it’s crucial to choose someone reliable to avoid any headaches.\\n\\nIn the end, it’s about weighing your options. Think about your skill level, the complexity of the project, and your budget. If you're unsure, consulting with a professional before making a decision can help clarify the best path forward. Whether you choose DIY or professional help, the goal is a successful home improvement that enhances your living space."}	\N	\N
990	1110	content_requests	1	{"id":1,"status":"Ready","topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois","content_type":null,"source":null,"auto_published":false,"style":null,"created_at":null,"updated_at":null,"forget_audience":null,"style_persona_id":null,"industry":null,"sub_industry":null}	{"status":"Ready"}	\N	\N
991	1111	content_outputs	20	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
1094	1256	directus_fields	358	{"sort":7,"interface":"input","special":null,"collection":"ai_calls","field":"client_response"}	{"sort":7,"interface":"input","special":null,"collection":"ai_calls","field":"client_response"}	\N	\N
992	1112	content_outputs	20	{"id":20,"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago","meta_title":null,"meta_description":null,"summary":null,"outline_markdown":null,"body_markdown":"When it comes to boosting your website's visibility, understanding SEO is essential. You don’t need to be a tech wizard to get started, but knowing the basics can make a significant difference.\\n\\nFirst off, keyword research is crucial. You want to identify the terms and phrases your audience is searching for. Tools like Google Keyword Planner can help you find popular keywords relevant to your niche. Focus on long-tail keywords; they may have lower search volumes but often lead to higher conversion rates.\\n\\nNext, on-page SEO is where you can really shine. This involves optimizing individual pages on your site. Make sure your title tags and meta descriptions are compelling and include your target keywords. Also, use headings (H1, H2, H3) effectively to structure your content and improve readability. \\n\\nDon’t overlook the importance of quality content. Google rewards sites that provide valuable, informative, and engaging content. Regularly update your blog or articles to keep your audience coming back for more. \\n\\nLink building is another vital aspect of SEO. Aim to get backlinks from reputable sites in your industry. This can enhance your site's authority and improve your search rankings. \\n\\nLastly, monitor your progress. Use analytics tools to track your traffic and see which strategies are working. Adjust your approach based on the data you gather. SEO isn’t a one-time task; it requires ongoing effort and fine-tuning.\\n\\nBy focusing on these key areas, you can enhance your website’s SEO and reach a broader audience. Remember, the goal is not just to attract visitors but to convert them into loyal customers.","seo_score":null,"body_html":null,"published_url":null,"schema_json":null,"faqs":null,"short_form_snippets":null}	{"body_markdown":"When it comes to boosting your website's visibility, understanding SEO is essential. You don’t need to be a tech wizard to get started, but knowing the basics can make a significant difference.\\n\\nFirst off, keyword research is crucial. You want to identify the terms and phrases your audience is searching for. Tools like Google Keyword Planner can help you find popular keywords relevant to your niche. Focus on long-tail keywords; they may have lower search volumes but often lead to higher conversion rates.\\n\\nNext, on-page SEO is where you can really shine. This involves optimizing individual pages on your site. Make sure your title tags and meta descriptions are compelling and include your target keywords. Also, use headings (H1, H2, H3) effectively to structure your content and improve readability. \\n\\nDon’t overlook the importance of quality content. Google rewards sites that provide valuable, informative, and engaging content. Regularly update your blog or articles to keep your audience coming back for more. \\n\\nLink building is another vital aspect of SEO. Aim to get backlinks from reputable sites in your industry. This can enhance your site's authority and improve your search rankings. \\n\\nLastly, monitor your progress. Use analytics tools to track your traffic and see which strategies are working. Adjust your approach based on the data you gather. SEO isn’t a one-time task; it requires ongoing effort and fine-tuning.\\n\\nBy focusing on these key areas, you can enhance your website’s SEO and reach a broader audience. Remember, the goal is not just to attract visitors but to convert them into loyal customers."}	\N	\N
993	1113	content_requests	1	{"id":1,"status":"Ready","topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois","content_type":null,"source":null,"auto_published":false,"style":null,"created_at":null,"updated_at":null,"forget_audience":null,"style_persona_id":null,"industry":null,"sub_industry":null}	{"status":"Ready"}	\N	\N
1017	1172	directus_fields	338	{"sort":3,"interface":"input","special":null,"collection":"AR_Tenants","field":"twilio_name"}	{"sort":3,"interface":"input","special":null,"collection":"AR_Tenants","field":"twilio_name"}	\N	\N
1019	1174	directus_fields	340	{"sort":5,"special":["m2m"],"collection":"AR_Tenants","field":"snapshot"}	{"sort":5,"special":["m2m"],"collection":"AR_Tenants","field":"snapshot"}	\N	\N
1023	1178	directus_fields	343	{"sort":3,"hidden":true,"collection":"AR_Tenants_niche_snapshots","field":"niche_snapshots_id"}	{"sort":3,"hidden":true,"collection":"AR_Tenants_niche_snapshots","field":"niche_snapshots_id"}	\N	\N
1025	1180	directus_fields	344	{"id":344,"collection":"AR_Tenants","field":"snapshots","special":["m2o"],"interface":"select-dropdown-m2o","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"AR_Tenants","field":"snapshots","interface":"select-dropdown-m2o"}	\N	\N
1027	1182	directus_fields	345	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"knowledge_base"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"knowledge_base"}	\N	\N
994	1114	content_outputs	21	{"request_id":1,"body_markdown":"If you're facing an HVAC emergency in Chicago, you're not alone. Many residents experience unexpected heating or cooling issues that require immediate attention. In such situations, finding reliable emergency HVAC repair services in Chicago is crucial. Whether your system has broken down in the middle of a heatwave or you're dealing with a furnace failure during a winter storm, professional help is just a call away. Make sure to choose a service that is available 24/7, as HVAC problems can arise at any time. Expert technicians will quickly diagnose the issue and provide the necessary repairs to restore comfort to your home.","title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	{"request_id":1,"body_markdown":"If you're facing an HVAC emergency in Chicago, you're not alone. Many residents experience unexpected heating or cooling issues that require immediate attention. In such situations, finding reliable emergency HVAC repair services in Chicago is crucial. Whether your system has broken down in the middle of a heatwave or you're dealing with a furnace failure during a winter storm, professional help is just a call away. Make sure to choose a service that is available 24/7, as HVAC problems can arise at any time. Expert technicians will quickly diagnose the issue and provide the necessary repairs to restore comfort to your home.","title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago"}	\N	\N
995	1115	content_outputs	21	{"id":21,"request_id":1,"title":" Emergency HVAC Repair Chicago","slug":"emergency-hvac-repair-chicago","meta_title":null,"meta_description":null,"summary":null,"outline_markdown":null,"body_markdown":"When you're looking to improve your website's search engine optimization (SEO), understanding how search engines work is crucial. Search engines like Google use complex algorithms to determine which websites to rank higher based on various factors. It's not just about keywords anymore; it's about the overall user experience.\\n\\nOne key aspect to consider is the importance of quality content. Search engines prioritize content that provides value to users. This means your articles should be informative, engaging, and relevant to your target audience. Use clear language and avoid jargon where possible. \\n\\nAnother element is website speed. A fast-loading site enhances user experience, reducing bounce rates. If your site takes too long to load, users will likely leave before even seeing your content. Tools like Google PageSpeed Insights can help you analyze and improve your site's speed.\\n\\nMobile-friendliness also plays a significant role in SEO. With more users accessing the web via mobile devices, it's essential to ensure your site is responsive. A mobile-friendly design improves usability and can boost your search rankings.\\n\\nDon't forget about backlinks. Quality backlinks from reputable sites can significantly enhance your site's authority. Focus on building relationships within your industry to foster natural linking opportunities.\\n\\nLastly, keep an eye on analytics. Regularly reviewing your site's performance helps you understand what's working and what isn't. Use this data to refine your strategy continually.\\n\\nIn summary, effective SEO requires a multifaceted approach. By focusing on quality content, site speed, mobile optimization, backlinks, and analytics, you can enhance your site's visibility and attract more visitors.","seo_score":null,"body_html":null,"published_url":null,"schema_json":null,"faqs":null,"short_form_snippets":null}	{"body_markdown":"When you're looking to improve your website's search engine optimization (SEO), understanding how search engines work is crucial. Search engines like Google use complex algorithms to determine which websites to rank higher based on various factors. It's not just about keywords anymore; it's about the overall user experience.\\n\\nOne key aspect to consider is the importance of quality content. Search engines prioritize content that provides value to users. This means your articles should be informative, engaging, and relevant to your target audience. Use clear language and avoid jargon where possible. \\n\\nAnother element is website speed. A fast-loading site enhances user experience, reducing bounce rates. If your site takes too long to load, users will likely leave before even seeing your content. Tools like Google PageSpeed Insights can help you analyze and improve your site's speed.\\n\\nMobile-friendliness also plays a significant role in SEO. With more users accessing the web via mobile devices, it's essential to ensure your site is responsive. A mobile-friendly design improves usability and can boost your search rankings.\\n\\nDon't forget about backlinks. Quality backlinks from reputable sites can significantly enhance your site's authority. Focus on building relationships within your industry to foster natural linking opportunities.\\n\\nLastly, keep an eye on analytics. Regularly reviewing your site's performance helps you understand what's working and what isn't. Use this data to refine your strategy continually.\\n\\nIn summary, effective SEO requires a multifaceted approach. By focusing on quality content, site speed, mobile optimization, backlinks, and analytics, you can enhance your site's visibility and attract more visitors."}	\N	\N
996	1116	content_requests	1	{"id":1,"status":"Ready","topic":" Emergency HVAC Repair Chicago","primary_keyword":"emergency hvac repair chicago","location":"Chicago, Illinois","content_type":null,"source":null,"auto_published":false,"style":null,"created_at":null,"updated_at":null,"forget_audience":null,"style_persona_id":null,"industry":null,"sub_industry":null}	{"status":"Ready"}	\N	\N
1095	1257	directus_users	985a9afa-a39b-4b34-9dbf-18a8d7ba216a	{"id":"985a9afa-a39b-4b34-9dbf-18a8d7ba216a","first_name":"n8n","last_name":"agent","email":"leadsgrowrevenue_agent@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":null,"token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"role":null}	\N	\N
997	1124	directus_settings	1	{"id":1,"project_name":"LGR Data Engine","project_url":null,"project_color":"#6644FF","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":"Directus Color Match","theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"report_error_url":null,"report_bug_url":null,"report_feature_url":null,"public_registration":false,"public_registration_verify_email":true,"public_registration_role":null,"public_registration_email_filter":null,"visual_editor_urls":null,"project_id":"019a9ec1-bd01-7363-aa4c-f4af8e6c87b0","mcp_enabled":false,"mcp_allow_deletes":false,"mcp_prompts_collection":null,"mcp_system_prompt_enabled":true,"mcp_system_prompt":null,"project_owner":"jlanders@leadsgrowrevenue.com","project_usage":"commercial","org_name":"Leads Grow Revenue","product_updates":true,"project_status":null,"ai_openai_api_key":null,"ai_anthropic_api_key":null,"ai_system_prompt":null}	{"project_owner":"jlanders@leadsgrowrevenue.com","project_usage":"commercial","org_name":"Leads Grow Revenue","product_updates":true,"project_status":null}	\N	\N
998	1152	directus_fields	329	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"niche_snapshots"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"niche_snapshots"}	\N	\N
999	1153	directus_collections	niche_snapshots	{"singleton":false,"collection":"niche_snapshots"}	{"singleton":false,"collection":"niche_snapshots"}	\N	\N
1000	1154	directus_fields	330	{"sort":2,"interface":"input","special":null,"collection":"niche_snapshots","field":"niche_name"}	{"sort":2,"interface":"input","special":null,"collection":"niche_snapshots","field":"niche_name"}	\N	\N
1001	1155	directus_fields	331	{"sort":3,"interface":"select-multiple-dropdown","special":["cast-json"],"options":{"choices":[{"text":"Medium","value":"medium"},{"text":"High","value":"High"},{"text":"Low","value":"Low"}]},"collection":"niche_snapshots","field":"urgency_level"}	{"sort":3,"interface":"select-multiple-dropdown","special":["cast-json"],"options":{"choices":[{"text":"Medium","value":"medium"},{"text":"High","value":"High"},{"text":"Low","value":"Low"}]},"collection":"niche_snapshots","field":"urgency_level"}	\N	\N
1002	1156	directus_fields	332	{"sort":4,"special":["cast-json"],"collection":"niche_snapshots","field":"industry_vocabulary"}	{"sort":4,"special":["cast-json"],"collection":"niche_snapshots","field":"industry_vocabulary"}	\N	\N
1003	1157	directus_fields	333	{"sort":5,"special":["cast-json"],"collection":"niche_snapshots","field":"default_tools"}	{"sort":5,"special":["cast-json"],"collection":"niche_snapshots","field":"default_tools"}	\N	\N
1004	1158	directus_fields	334	{"sort":6,"interface":"input-multiline","special":null,"collection":"niche_snapshots","field":"system_prompt_base"}	{"sort":6,"interface":"input-multiline","special":null,"collection":"niche_snapshots","field":"system_prompt_base"}	\N	\N
1018	1173	directus_fields	339	{"sort":4,"special":["cast-json"],"collection":"AR_Tenants","field":"business_config"}	{"sort":4,"special":["cast-json"],"collection":"AR_Tenants","field":"business_config"}	\N	\N
1020	1175	directus_fields	341	{"sort":1,"hidden":true,"field":"id","collection":"AR_Tenants_niche_snapshots"}	{"sort":1,"hidden":true,"field":"id","collection":"AR_Tenants_niche_snapshots"}	\N	\N
1021	1176	directus_collections	AR_Tenants_niche_snapshots	{"hidden":true,"icon":"import_export","collection":"AR_Tenants_niche_snapshots"}	{"hidden":true,"icon":"import_export","collection":"AR_Tenants_niche_snapshots"}	\N	\N
1022	1177	directus_fields	342	{"sort":2,"hidden":true,"collection":"AR_Tenants_niche_snapshots","field":"AR_Tenants_id"}	{"sort":2,"hidden":true,"collection":"AR_Tenants_niche_snapshots","field":"AR_Tenants_id"}	\N	\N
1006	1160	niche_snapshots	2	{"niche_name":"Home Services","urgency_level":["High"],"industry_vocabulary":["refrigerant","breaker box","sump pump","water heater","outage","freon","compressor","snake the drain"],"default_tools":["check_service_area","emergency_escalation_sms","book_dispatch","price_estimator"],"system_prompt_base":"You are a Dispatcher for {{business_name}}. You are direct, efficient, and solution-focused. YOUR GOAL: Identify the issue, check if it's an emergency, and get a technician scheduled immediately. Do not waste time with small talk. RULES:\\n\\nSafety First: If the user mentions \\"gas smell\\", \\"sparks\\", or \\"standing water\\", trigger the emergency_escalation_sms tool immediately.\\n\\nGeography: Always ask for the ZIP code first to verify they are in our service area using check_service_area.\\n\\nBooking: If it's an emergency, offer the \\"Emergency Dispatch\\" slot (higher rate). If routine, offer standard slots."}	{"niche_name":"Home Services","urgency_level":["High"],"industry_vocabulary":["refrigerant","breaker box","sump pump","water heater","outage","freon","compressor","snake the drain"],"default_tools":["check_service_area","emergency_escalation_sms","book_dispatch","price_estimator"],"system_prompt_base":"You are a Dispatcher for {{business_name}}. You are direct, efficient, and solution-focused. YOUR GOAL: Identify the issue, check if it's an emergency, and get a technician scheduled immediately. Do not waste time with small talk. RULES:\\n\\nSafety First: If the user mentions \\"gas smell\\", \\"sparks\\", or \\"standing water\\", trigger the emergency_escalation_sms tool immediately.\\n\\nGeography: Always ask for the ZIP code first to verify they are in our service area using check_service_area.\\n\\nBooking: If it's an emergency, offer the \\"Emergency Dispatch\\" slot (higher rate). If routine, offer standard slots."}	\N	\N
1096	1258	directus_users	985a9afa-a39b-4b34-9dbf-18a8d7ba216a	{"id":"985a9afa-a39b-4b34-9dbf-18a8d7ba216a","first_name":"n8n","last_name":"agent","email":"leadsgrowrevenue_agent@gmail.com","password":null,"location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********"}	\N	\N
1007	1161	niche_snapshots	3	{"niche_name":"Medical & Dental","urgency_level":["medium"],"industry_vocabulary":["PPO","HMO","copay","root canal","cleaning","new patient","referral","insurance card"],"default_tools":["check_insurance_kb","book_appointment","reschedule_logic","post_op_instructions"],"system_prompt_base":"You are a Front Desk Coordinator for {{business_name}}. Your tone is warm, caring, and precise. YOUR GOAL: Help patients schedule appointments and answer insurance questions without violating privacy. MANDATORY PROTOCOLS:\\n\\nHIPAA: Never repeat a patient's full medical history out loud. Confirm identity by asking for Date of Birth.\\n\\nTriage: If a patient is in severe pain or bleeding, advise them to go to the ER or call 911, then offer an emergency slot if appropriate.\\n\\nInsurance: If asked \\"Do you take my insurance?\\", use the check_insurance_kb tool. Do not guess."}	{"niche_name":"Medical & Dental","urgency_level":["medium"],"industry_vocabulary":["PPO","HMO","copay","root canal","cleaning","new patient","referral","insurance card"],"default_tools":["check_insurance_kb","book_appointment","reschedule_logic","post_op_instructions"],"system_prompt_base":"You are a Front Desk Coordinator for {{business_name}}. Your tone is warm, caring, and precise. YOUR GOAL: Help patients schedule appointments and answer insurance questions without violating privacy. MANDATORY PROTOCOLS:\\n\\nHIPAA: Never repeat a patient's full medical history out loud. Confirm identity by asking for Date of Birth.\\n\\nTriage: If a patient is in severe pain or bleeding, advise them to go to the ER or call 911, then offer an emergency slot if appropriate.\\n\\nInsurance: If asked \\"Do you take my insurance?\\", use the check_insurance_kb tool. Do not guess."}	\N	\N
1008	1162	niche_snapshots	4	{"niche_name":"Real Estate ","urgency_level":["High"],"industry_vocabulary":["showing","listing","lease terms","credit score","move-in date","guarantor","HOA fee","open house"],"default_tools":["schedule_viewing","qualify_buyer","send_property_link","mortgage_calculator"],"system_prompt_base":"You are a Leasing Assistant for {{business_name}}. You are enthusiastic, high-energy, and sales-oriented. YOUR GOAL: Turn callers into showings. Speed is everything. SCRIPT:\\n\\nQualify: \\"Are you looking to move in the next 30 days?\\"\\n\\nCapture: \\"I can text you the listing photos right now—is this a mobile number?\\" (Use send_property_link).\\n\\nClose: \\"We have a slot open at 4 PM today to see the property. Shall I lock that in for you?\\""}	{"niche_name":"Real Estate ","urgency_level":["High"],"industry_vocabulary":["showing","listing","lease terms","credit score","move-in date","guarantor","HOA fee","open house"],"default_tools":["schedule_viewing","qualify_buyer","send_property_link","mortgage_calculator"],"system_prompt_base":"You are a Leasing Assistant for {{business_name}}. You are enthusiastic, high-energy, and sales-oriented. YOUR GOAL: Turn callers into showings. Speed is everything. SCRIPT:\\n\\nQualify: \\"Are you looking to move in the next 30 days?\\"\\n\\nCapture: \\"I can text you the listing photos right now—is this a mobile number?\\" (Use send_property_link).\\n\\nClose: \\"We have a slot open at 4 PM today to see the property. Shall I lock that in for you?\\""}	\N	\N
1009	1163	niche_snapshots	5	{"niche_name":"Contractor & Trades","urgency_level":["Low"],"industry_vocabulary":["quote","estimate","square footage","permit","subcontractor","deposit","change order"],"default_tools":["take_message","send_callback_sms","quote_request_form"],"system_prompt_base":"You are the Site Manager's Assistant for {{business_name}}. You are brief, polite, and protective of the owner's time. CONTEXT: The boss is likely on a roof or under a sink. Do not promise an immediate conversation. YOUR GOAL: Filter serious jobs from tire-kickers. ACTION: \\"Thanks for calling. {{business_name}} is on a job site right now. I can grab your info and have them text you a quote request form, or I can take a message. Which do you prefer?\\""}	{"niche_name":"Contractor & Trades","urgency_level":["Low"],"industry_vocabulary":["quote","estimate","square footage","permit","subcontractor","deposit","change order"],"default_tools":["take_message","send_callback_sms","quote_request_form"],"system_prompt_base":"You are the Site Manager's Assistant for {{business_name}}. You are brief, polite, and protective of the owner's time. CONTEXT: The boss is likely on a roof or under a sink. Do not promise an immediate conversation. YOUR GOAL: Filter serious jobs from tire-kickers. ACTION: \\"Thanks for calling. {{business_name}} is on a job site right now. I can grab your info and have them text you a quote request form, or I can take a message. Which do you prefer?\\""}	\N	\N
1010	1164	niche_snapshots	6	{"niche_name":"Solopreneurs/Small Teams","urgency_level":["Low"],"industry_vocabulary":["consultation","rate card","availability","collaboration","partnership"],"default_tools":["spam_filter","take_message","calendar_check"],"system_prompt_base":"You are the Executive Assistant for {{business_name}}. You are professional, organized, and polite. YOUR GOAL: act as a filter. Block spam calls, schedule qualified consultations, and take clear messages. PROTOCOL:\\n\\nFilter: If the caller is selling SEO, Google Maps verification, or a scam, use the spam_filter tool to politely end the call.\\n\\nSchedule: \\"I manage {{business_name}}'s calendar. I can check availability for a 15-minute intro call.\\""}	{"niche_name":"Solopreneurs/Small Teams","urgency_level":["Low"],"industry_vocabulary":["consultation","rate card","availability","collaboration","partnership"],"default_tools":["spam_filter","take_message","calendar_check"],"system_prompt_base":"You are the Executive Assistant for {{business_name}}. You are professional, organized, and polite. YOUR GOAL: act as a filter. Block spam calls, schedule qualified consultations, and take clear messages. PROTOCOL:\\n\\nFilter: If the caller is selling SEO, Google Maps verification, or a scam, use the spam_filter tool to politely end the call.\\n\\nSchedule: \\"I manage {{business_name}}'s calendar. I can check availability for a 15-minute intro call.\\""}	\N	\N
1011	1165	directus_fields	335	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"ar_tenants"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"ar_tenants"}	\N	\N
1012	1166	directus_collections	ar_tenants	{"singleton":false,"collection":"ar_tenants"}	{"singleton":false,"collection":"ar_tenants"}	\N	\N
1013	1168	directus_fields	336	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"AR_Tenants"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"AR_Tenants"}	\N	\N
1014	1169	directus_collections	AR_Tenants	{"singleton":false,"collection":"AR_Tenants"}	{"singleton":false,"collection":"AR_Tenants"}	\N	\N
1015	1170	directus_fields	337	{"sort":2,"interface":"input","special":null,"collection":"AR_Tenants","field":"business_name"}	{"sort":2,"interface":"input","special":null,"collection":"AR_Tenants","field":"business_name"}	\N	\N
1016	1171	directus_collections	AR_Tenants	{"collection":"AR_Tenants","icon":null,"note":"AI Receptionist Tenants","display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"note":"AI Receptionist Tenants"}	\N	\N
1026	1181	AR_Tenants	3	{"snapshots":2}	{"snapshots":2}	\N	\N
1029	1184	directus_fields	346	{"sort":2,"interface":"file","special":["file"],"collection":"knowledge_base","field":"file"}	{"sort":2,"interface":"file","special":["file"],"collection":"knowledge_base","field":"file"}	\N	\N
1030	1185	directus_fields	347	{"sort":3,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"draft","value":"draft"},{"text":"published","value":"published"},{"text":"archived","value":"archived"}]},"collection":"knowledge_base","field":"status"}	{"sort":3,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"draft","value":"draft"},{"text":"published","value":"published"},{"text":"archived","value":"archived"}]},"collection":"knowledge_base","field":"status"}	\N	\N
1031	1186	directus_fields	348	{"sort":4,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"pending","value":"pending"},{"text":"sync_status","value":"sync_status"},{"text":"error","value":"error"}]},"collection":"knowledge_base","field":"sync_status"}	{"sort":4,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"pending","value":"pending"},{"text":"sync_status","value":"sync_status"},{"text":"error","value":"error"}]},"collection":"knowledge_base","field":"sync_status"}	\N	\N
1032	1187	directus_fields	349	{"sort":5,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"pricing","value":"pricing"},{"text":"faq","value":"faq"},{"text":"transcript","value":"transcript"}]},"collection":"knowledge_base","field":"document_type"}	{"sort":5,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"pricing","value":"pricing"},{"text":"faq","value":"faq"},{"text":"transcript","value":"transcript"}]},"collection":"knowledge_base","field":"document_type"}	\N	\N
1033	1188	directus_fields	350	{"sort":6,"interface":"input","special":["uuid"],"collection":"knowledge_base","field":"client_id"}	{"sort":6,"interface":"input","special":["uuid"],"collection":"knowledge_base","field":"client_id"}	\N	\N
1034	1189	directus_files	9cd453a7-7947-4d4b-93f6-1793516ac714	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1035	1190	directus_fields	351	{"sort":6,"special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{business_name}}"},"collection":"knowledge_base","field":"client_id"}	{"sort":6,"special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{business_name}}"},"collection":"knowledge_base","field":"client_id"}	\N	\N
1036	1191	AR_Tenants	4	{"business_name":"Leads Grow Revenue","snapshots":6}	{"business_name":"Leads Grow Revenue","snapshots":6}	\N	\N
1037	1192	directus_files	8ae7743b-988d-4af8-9277-0d517c488536	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1038	1193	knowledge_base	1	{"file":"8ae7743b-988d-4af8-9277-0d517c488536","client_id":4,"document_type":"faq","sync_status":"pending"}	{"file":"8ae7743b-988d-4af8-9277-0d517c488536","client_id":4,"document_type":"faq","sync_status":"pending"}	\N	\N
1039	1194	knowledge_base	1	{"id":1,"file":"8ae7743b-988d-4af8-9277-0d517c488536","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"status":"published"}	\N	\N
1040	1195	directus_files	11279d9f-cab5-4ee1-89ef-11374d4e0aff	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1041	1196	knowledge_base	1	{"id":1,"file":"11279d9f-cab5-4ee1-89ef-11374d4e0aff","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"11279d9f-cab5-4ee1-89ef-11374d4e0aff"}	\N	\N
1042	1197	directus_collections	directus_access	{"collection":"directus_access"}	{"collection":"directus_access"}	\N	\N
1043	1198	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"name":"Sync to N8N","icon":"bolt","color":null,"description":null,"status":"active","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create"],"collections":["knowledge_base"]}}	{"name":"Sync to N8N","icon":"bolt","color":null,"description":null,"status":"active","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create"],"collections":["knowledge_base"]}}	\N	\N
1044	1199	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"id":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","name":"Sync to N8N","icon":"bolt","color":null,"description":null,"status":"active","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create"],"collections":["knowledge_base"]},"operation":null,"date_created":"2026-01-15T03:06:21.674Z","user_created":"24f7d0fe-8079-4470-a550-625130a01a4c","operations":[]}	{"name":"Sync to N8N","icon":"bolt","color":null,"description":null,"status":"active","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create"],"collections":["knowledge_base"]}}	\N	\N
1046	1201	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"id":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","name":"Sync to N8N","icon":"bolt","color":null,"description":null,"status":"active","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create"],"collections":["knowledge_base"]},"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","date_created":"2026-01-15T03:06:21.674Z","user_created":"24f7d0fe-8079-4470-a550-625130a01a4c","operations":["5f94ca76-79e5-4be5-a27a-c71f1eddf58d"]}	{"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d"}	\N	\N
1045	1200	directus_operations	5f94ca76-79e5-4be5-a27a-c71f1eddf58d	{"flow":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","position_x":19,"position_y":1,"name":"Webhook / Request URL","key":"request_vlc81","type":"request","options":{"url":"http://localhost:5678/webhook-test/autogenerated-id","method":"POST"}}	{"flow":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","position_x":19,"position_y":1,"name":"Webhook / Request URL","key":"request_vlc81","type":"request","options":{"url":"http://localhost:5678/webhook-test/autogenerated-id","method":"POST"}}	1046	\N
1047	1202	directus_files	8de88b1e-ab7d-4c2b-a4f6-734ec8d34718	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1048	1203	knowledge_base	1	{"id":1,"file":"8de88b1e-ab7d-4c2b-a4f6-734ec8d34718","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"8de88b1e-ab7d-4c2b-a4f6-734ec8d34718"}	\N	\N
1049	1204	directus_files	05dda9a8-9faa-4a83-bc1e-5915e54c0447	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1050	1205	knowledge_base	1	{"id":1,"file":"05dda9a8-9faa-4a83-bc1e-5915e54c0447","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"05dda9a8-9faa-4a83-bc1e-5915e54c0447"}	\N	\N
1051	1206	directus_files	9f58a73c-b1c3-4ffa-910f-d92ef2766146	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1052	1207	knowledge_base	1	{"id":1,"file":"9f58a73c-b1c3-4ffa-910f-d92ef2766146","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"9f58a73c-b1c3-4ffa-910f-d92ef2766146"}	\N	\N
1053	1208	directus_files	6a1c20a9-5888-40b7-a1cc-0da1f7d1bf96	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1054	1209	knowledge_base	1	{"id":1,"file":"6a1c20a9-5888-40b7-a1cc-0da1f7d1bf96","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"6a1c20a9-5888-40b7-a1cc-0da1f7d1bf96"}	\N	\N
1056	1211	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"id":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","name":"Sync to N8N","icon":"bolt","color":null,"description":null,"status":"active","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create"],"collections":["knowledge_base"]},"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","date_created":"2026-01-15T03:06:21.674Z","user_created":"24f7d0fe-8079-4470-a550-625130a01a4c","operations":["5f94ca76-79e5-4be5-a27a-c71f1eddf58d"]}	{"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d"}	\N	\N
1055	1210	directus_operations	5f94ca76-79e5-4be5-a27a-c71f1eddf58d	{"id":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","name":"Webhook / Request URL","key":"request_vlc81","type":"request","position_x":19,"position_y":1,"options":{"url":"https://automation.leads2scale.com/webhook-test/autogenerated-id","method":"POST"},"resolve":null,"reject":null,"flow":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","date_created":"2026-01-15T03:12:03.648Z","user_created":"24f7d0fe-8079-4470-a550-625130a01a4c"}	{"name":"Webhook / Request URL","key":"request_vlc81","type":"request","options":{"url":"https://automation.leads2scale.com/webhook-test/autogenerated-id","method":"POST"},"flow":"57d4f8be-ba31-4b9f-84ab-cb12c565da82"}	1056	\N
1057	1212	directus_files	bc6c4813-d468-4daa-bc85-5e32d2954d37	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1058	1213	knowledge_base	1	{"id":1,"file":"bc6c4813-d468-4daa-bc85-5e32d2954d37","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"bc6c4813-d468-4daa-bc85-5e32d2954d37"}	\N	\N
1059	1214	directus_files	1778fb7b-3ff9-42c6-a76e-abb6c46d52ff	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1060	1215	knowledge_base	1	{"id":1,"file":"1778fb7b-3ff9-42c6-a76e-abb6c46d52ff","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"1778fb7b-3ff9-42c6-a76e-abb6c46d52ff"}	\N	\N
1062	1217	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"id":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","name":"Sync to N8N","icon":"bolt","color":null,"description":null,"status":"active","trigger":"event","accountability":"all","options":{"type":"action","scope":["items.create"],"collections":["knowledge_base"]},"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","date_created":"2026-01-15T03:06:21.674Z","user_created":"24f7d0fe-8079-4470-a550-625130a01a4c","operations":["5f94ca76-79e5-4be5-a27a-c71f1eddf58d"]}	{"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d"}	\N	\N
1061	1216	directus_operations	5f94ca76-79e5-4be5-a27a-c71f1eddf58d	{"id":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","name":"Webhook / Request URL","key":"request_vlc81","type":"request","position_x":19,"position_y":1,"options":{"url":"https://automation.leads2scale.com/webhook/autogenerated-id","method":"POST"},"resolve":null,"reject":null,"flow":"57d4f8be-ba31-4b9f-84ab-cb12c565da82","date_created":"2026-01-15T03:12:03.648Z","user_created":"24f7d0fe-8079-4470-a550-625130a01a4c"}	{"name":"Webhook / Request URL","key":"request_vlc81","type":"request","options":{"url":"https://automation.leads2scale.com/webhook/autogenerated-id","method":"POST"},"flow":"57d4f8be-ba31-4b9f-84ab-cb12c565da82"}	1062	\N
1063	1218	directus_files	97f4041f-0490-43f1-8c19-841c7f66b808	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1064	1219	knowledge_base	1	{"id":1,"file":"97f4041f-0490-43f1-8c19-841c7f66b808","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"97f4041f-0490-43f1-8c19-841c7f66b808"}	\N	\N
1065	1220	directus_files	d030e03d-9e5b-4802-8d25-bf22e3f02fd4	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1066	1221	knowledge_base	1	{"id":1,"file":"d030e03d-9e5b-4802-8d25-bf22e3f02fd4","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"d030e03d-9e5b-4802-8d25-bf22e3f02fd4"}	\N	\N
1067	1222	directus_files	aeb48deb-c3f3-415b-bbde-cf76ec09b33e	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1068	1223	knowledge_base	1	{"id":1,"file":"aeb48deb-c3f3-415b-bbde-cf76ec09b33e","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"aeb48deb-c3f3-415b-bbde-cf76ec09b33e"}	\N	\N
1069	1224	directus_files	06100c92-5458-41fa-9435-80eb85ed51e0	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1070	1225	knowledge_base	1	{"id":1,"file":"06100c92-5458-41fa-9435-80eb85ed51e0","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"06100c92-5458-41fa-9435-80eb85ed51e0"}	\N	\N
1071	1226	directus_files	fe28671c-d860-47e4-8e6f-032cc0b3ed4d	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1072	1227	knowledge_base	1	{"id":1,"file":"fe28671c-d860-47e4-8e6f-032cc0b3ed4d","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"fe28671c-d860-47e4-8e6f-032cc0b3ed4d"}	\N	\N
1073	1228	directus_files	103b75f8-8202-4586-b07e-58388f59481b	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1074	1229	knowledge_base	1	{"id":1,"file":"103b75f8-8202-4586-b07e-58388f59481b","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"103b75f8-8202-4586-b07e-58388f59481b"}	\N	\N
1075	1230	directus_files	abd6964c-6a3f-4410-a020-eaac0b95fe5a	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1076	1231	knowledge_base	1	{"id":1,"file":"abd6964c-6a3f-4410-a020-eaac0b95fe5a","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"abd6964c-6a3f-4410-a020-eaac0b95fe5a"}	\N	\N
1077	1232	directus_files	d82e7254-6957-4e90-a43b-63f9cb19b0e9	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1078	1233	knowledge_base	1	{"id":1,"file":"d82e7254-6957-4e90-a43b-63f9cb19b0e9","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"d82e7254-6957-4e90-a43b-63f9cb19b0e9"}	\N	\N
1079	1234	directus_files	225dbb86-c988-4a2e-b7ec-4913d745fd01	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	{"title":"Leads Grow Revenue AI Agent Training V2","filename_download":"Leads_Grow_Revenue_AI_Agent_Training_v2.pdf","type":"application/pdf","storage":"local"}	\N	\N
1080	1235	knowledge_base	1	{"id":1,"file":"225dbb86-c988-4a2e-b7ec-4913d745fd01","status":"published","sync_status":"pending","document_type":"faq","client_id":4}	{"file":"225dbb86-c988-4a2e-b7ec-4913d745fd01"}	\N	\N
1081	1236	directus_roles	703dc4b9-79a5-4753-96da-1b1c011129d1	{"name":"n8n_service","admin_access":false,"app_access":true}	{"name":"n8n_service","admin_access":false,"app_access":true}	\N	\N
1082	1237	directus_roles	ff77a93a-9b03-45bb-b63d-02941f15df77	{"name":"n8n_service","admin_access":false,"app_access":true}	{"name":"n8n_service","admin_access":false,"app_access":true}	\N	\N
1083	1240	directus_roles	9f494a38-b0ea-4ea9-a868-995fb98cf7b0	{"name":"n8n_agent","admin_access":false,"app_access":true}	{"name":"n8n_agent","admin_access":false,"app_access":true}	\N	\N
1084	1241	directus_roles	cd559838-f6d2-40fd-8e40-463fbe6b47f9	{"name":"n8n_agent","admin_access":false,"app_access":true}	{"name":"n8n_agent","admin_access":false,"app_access":true}	\N	\N
1085	1242	directus_roles	c4acd64d-6915-49a6-bbc2-5fdab3bd407b	{"name":"n8n_agent","admin_access":false,"app_access":true}	{"name":"n8n_agent","admin_access":false,"app_access":true}	\N	\N
1086	1245	directus_users	985a9afa-a39b-4b34-9dbf-18a8d7ba216a	{"role":"c4acd64d-6915-49a6-bbc2-5fdab3bd407b","first_name":"n8n","last_name":"agent","email":"leadsgrowrevenue_agent@gmail.com","token":"**********"}	{"role":"c4acd64d-6915-49a6-bbc2-5fdab3bd407b","first_name":"n8n","last_name":"agent","email":"leadsgrowrevenue_agent@gmail.com","token":"**********"}	\N	\N
1097	1259	directus_permissions	58	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}	\N	\N
1098	1261	directus_fields	359	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"created_at"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"created_at"}	\N	\N
1099	1262	directus_collections	created_at	{"singleton":false,"collection":"created_at"}	{"singleton":false,"collection":"created_at"}	\N	\N
1100	1265	directus_fields	360	{"sort":8,"interface":"datetime","special":null,"collection":"ai_calls","field":"created_at"}	{"sort":8,"interface":"datetime","special":null,"collection":"ai_calls","field":"created_at"}	\N	\N
1101	1266	directus_users	bf970007-d005-407c-a1e6-399bba718004	{"id":"bf970007-d005-407c-a1e6-399bba718004","first_name":"Admin","last_name":"User","email":"admin@example.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"tfa_secret":null,"status":"active","role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","token":"**********","last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true,"appearance":null,"theme_dark":null,"theme_light":null,"theme_light_overrides":null,"theme_dark_overrides":null,"text_direction":"auto","policies":[]}	{"token":"**********"}	\N	\N
1102	1281	directus_policies	b867d7ad-4e63-4e7d-a827-e9397be6fc3b	{"id":"b867d7ad-4e63-4e7d-a827-e9397be6fc3b","name":"Administrator","icon":"verified","description":"$t:admin_description","ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":true,"permissions":[43,44,45,46,47,48,49,50,51,52,53,54,55],"users":["be2b842a-9bb7-4ced-9b59-394612771d26","d41cae59-b171-4a82-b36f-65504e894fbd"],"roles":["be2b842a-9bb7-4ced-9b59-394612771d26","d41cae59-b171-4a82-b36f-65504e894fbd"]}	{"admin_access":true}	\N	\N
1103	1283	directus_fields	361	{"sort":7,"interface":"input","special":null,"collection":"knowledge_base","field":"title"}	{"sort":7,"interface":"input","special":null,"collection":"knowledge_base","field":"title"}	\N	\N
1104	1284	directus_fields	362	{"sort":8,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Persona","value":"Persona"},{"text":"Training","value":"Training"},{"text":"Business Rules","value":"Business Rules"}]},"collection":"knowledge_base","field":"type"}	{"sort":8,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Persona","value":"Persona"},{"text":"Training","value":"Training"},{"text":"Business Rules","value":"Business Rules"}]},"collection":"knowledge_base","field":"type"}	\N	\N
1105	1285	directus_fields	363	{"sort":9,"interface":"input","special":["uuid"],"collection":"knowledge_base","field":"file_id"}	{"sort":9,"interface":"input","special":["uuid"],"collection":"knowledge_base","field":"file_id"}	\N	\N
1106	1286	directus_fields	364	{"sort":10,"special":["cast-json"],"collection":"knowledge_base","field":"extracted_data"}	{"sort":10,"special":["cast-json"],"collection":"knowledge_base","field":"extracted_data"}	\N	\N
1107	1287	directus_fields	349	{"id":349,"collection":"knowledge_base","field":"document_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"pricing","value":"pricing"},{"text":"faq","value":"faq"},{"text":"transcript","value":"transcript"},{"text":"content text","value":"content text"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"knowledge_base","field":"document_type","options":{"choices":[{"text":"pricing","value":"pricing"},{"text":"faq","value":"faq"},{"text":"transcript","value":"transcript"},{"text":"content text","value":"content text"}]}}	\N	\N
1108	1288	directus_fields	349	{"id":349,"collection":"knowledge_base","field":"document_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"pricing","value":"pricing"},{"text":"faq","value":"faq"},{"text":"transcript","value":"transcript"},{"text":"content/text","value":"content/text"},{"text":"vector/embedding","value":"vector/embedding"},{"text":"metadata","value":"metadata"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"knowledge_base","field":"document_type","options":{"choices":[{"text":"pricing","value":"pricing"},{"text":"faq","value":"faq"},{"text":"transcript","value":"transcript"},{"text":"content/text","value":"content/text"},{"text":"vector/embedding","value":"vector/embedding"},{"text":"metadata","value":"metadata"}]}}	\N	\N
1109	1289	knowledge_base	2	{"title":"Alex Persona","document_type":"faq","status":"published","type":"Persona"}	{"title":"Alex Persona","document_type":"faq","status":"published","type":"Persona"}	\N	\N
1110	1290	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"steps":[{"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","key":"request_vlc81","status":"resolve","options":{"url":"https://automation.leads2scale.com/webhook/autogenerated-id","method":"POST"}}],"data":{"$trigger":{"event":"knowledge_base.items.create","payload":{"title":"Alex Persona","document_type":"faq","status":"published","type":"Persona"},"key":2,"collection":"knowledge_base"},"$last":{"status":200,"statusText":"OK","headers":{"alt-svc":"h3=\\":443\\"; ma=2592000","content-length":"34","content-security-policy":"sandbox allow-downloads allow-forms allow-modals allow-orientation-lock allow-pointer-lock allow-popups allow-presentation allow-scripts allow-top-navigation allow-top-navigation-by-user-activation allow-top-navigation-to-custom-protocols","content-type":"application/json; charset=utf-8","date":"Mon, 19 Jan 2026 19:46:14 GMT","etag":"W/\\"22-6OS7cK0FzqnV2NeDHdOSGS1bVUs\\"","vary":"Accept-Encoding","via":"1.1 Caddy","connection":"close"},"data":{"message":"Workflow was started"}},"$accountability":{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","user":"24f7d0fe-8079-4470-a550-625130a01a4c","roles":["4b9c2a26-828b-4a29-92db-a4e714d6f484"],"admin":true,"app":true,"ip":"73.51.104.220","userAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","origin":"https://admin.leads2scale.com","session":"0Eq2NY58zQhfDhbCSsK5vhdVTB0vpgQHTEGwmtW2R3CmkPAI1-kIJYtTuTH8mlpF"},"$env":{},"request_vlc81":{"status":200,"statusText":"OK","headers":{"alt-svc":"h3=\\":443\\"; ma=2592000","content-length":"34","content-security-policy":"sandbox allow-downloads allow-forms allow-modals allow-orientation-lock allow-pointer-lock allow-popups allow-presentation allow-scripts allow-top-navigation allow-top-navigation-by-user-activation allow-top-navigation-to-custom-protocols","content-type":"application/json; charset=utf-8","date":"Mon, 19 Jan 2026 19:46:14 GMT","etag":"W/\\"22-6OS7cK0FzqnV2NeDHdOSGS1bVUs\\"","vary":"Accept-Encoding","via":"1.1 Caddy","connection":"close"},"data":{"message":"Workflow was started"}}}}	\N	\N	\N
1111	1291	directus_fields	365	{"sort":11,"interface":"input-multiline","special":null,"collection":"knowledge_base","field":"content"}	{"sort":11,"interface":"input-multiline","special":null,"collection":"knowledge_base","field":"content"}	\N	\N
1115	1295	knowledge_base	1	{"id":1,"file":"225dbb86-c988-4a2e-b7ec-4913d745fd01","status":"published","sync_status":"pending","document_type":"faq","client_id":4,"title":"Leads Grow Revenue v2","type":"Training","file_id":null,"extracted_data":null,"content":null}	{"title":"Leads Grow Revenue v2"}	\N	\N
1112	1292	knowledge_base	1	{"id":1,"file":"225dbb86-c988-4a2e-b7ec-4913d745fd01","status":"published","sync_status":"pending","document_type":"faq","client_id":4,"title":null,"type":"Training","file_id":null,"extracted_data":null,"content":null}	{"type":"Training"}	\N	\N
1113	1293	knowledge_base	3	{"status":"published","document_type":"faq","client_id":4,"title":"Alex Persona","type":"Persona","content":"\\"You are Alex, a professional virtual receptionist for Leads2Scale. Your tone is helpful and proactive.\\""}	{"status":"published","document_type":"faq","client_id":4,"title":"Alex Persona","type":"Persona","content":"\\"You are Alex, a professional virtual receptionist for Leads2Scale. Your tone is helpful and proactive.\\""}	\N	\N
1114	1294	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"steps":[{"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","key":"request_vlc81","status":"resolve","options":{"url":"https://automation.leads2scale.com/webhook/autogenerated-id","method":"POST"}}],"data":{"$trigger":{"event":"knowledge_base.items.create","payload":{"status":"published","document_type":"faq","client_id":4,"title":"Alex Persona","type":"Persona","content":"\\"You are Alex, a professional virtual receptionist for Leads2Scale. Your tone is helpful and proactive.\\""},"key":3,"collection":"knowledge_base"},"$last":{"status":200,"statusText":"OK","headers":{"alt-svc":"h3=\\":443\\"; ma=2592000","content-length":"34","content-security-policy":"sandbox allow-downloads allow-forms allow-modals allow-orientation-lock allow-pointer-lock allow-popups allow-presentation allow-scripts allow-top-navigation allow-top-navigation-by-user-activation allow-top-navigation-to-custom-protocols","content-type":"application/json; charset=utf-8","date":"Mon, 19 Jan 2026 19:50:39 GMT","etag":"W/\\"22-6OS7cK0FzqnV2NeDHdOSGS1bVUs\\"","vary":"Accept-Encoding","via":"1.1 Caddy","connection":"close"},"data":{"message":"Workflow was started"}},"$accountability":{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","user":"24f7d0fe-8079-4470-a550-625130a01a4c","roles":["4b9c2a26-828b-4a29-92db-a4e714d6f484"],"admin":true,"app":true,"ip":"73.51.104.220","userAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","origin":"https://admin.leads2scale.com","session":"0Eq2NY58zQhfDhbCSsK5vhdVTB0vpgQHTEGwmtW2R3CmkPAI1-kIJYtTuTH8mlpF"},"$env":{},"request_vlc81":{"status":200,"statusText":"OK","headers":{"alt-svc":"h3=\\":443\\"; ma=2592000","content-length":"34","content-security-policy":"sandbox allow-downloads allow-forms allow-modals allow-orientation-lock allow-pointer-lock allow-popups allow-presentation allow-scripts allow-top-navigation allow-top-navigation-by-user-activation allow-top-navigation-to-custom-protocols","content-type":"application/json; charset=utf-8","date":"Mon, 19 Jan 2026 19:50:39 GMT","etag":"W/\\"22-6OS7cK0FzqnV2NeDHdOSGS1bVUs\\"","vary":"Accept-Encoding","via":"1.1 Caddy","connection":"close"},"data":{"message":"Workflow was started"}}}}	\N	\N	\N
1116	1296	knowledge_base	4	{"title":"LGR Business Rules","type":"Business Rules","client_id":4,"document_type":"faq","sync_status":"pending","status":"published","content":"\\"You are Alex, the senior virtual receptionist for Leads2Scale. Tone: Professional, proactive, and friendly. Responses must be under 2 sentences.\\""}	{"title":"LGR Business Rules","type":"Business Rules","client_id":4,"document_type":"faq","sync_status":"pending","status":"published","content":"\\"You are Alex, the senior virtual receptionist for Leads2Scale. Tone: Professional, proactive, and friendly. Responses must be under 2 sentences.\\""}	\N	\N
1117	1297	directus_flows	57d4f8be-ba31-4b9f-84ab-cb12c565da82	{"steps":[{"operation":"5f94ca76-79e5-4be5-a27a-c71f1eddf58d","key":"request_vlc81","status":"resolve","options":{"url":"https://automation.leads2scale.com/webhook/autogenerated-id","method":"POST"}}],"data":{"$trigger":{"event":"knowledge_base.items.create","payload":{"title":"LGR Business Rules","type":"Business Rules","client_id":4,"document_type":"faq","sync_status":"pending","status":"published","content":"\\"You are Alex, the senior virtual receptionist for Leads2Scale. Tone: Professional, proactive, and friendly. Responses must be under 2 sentences.\\""},"key":4,"collection":"knowledge_base"},"$last":{"status":200,"statusText":"OK","headers":{"alt-svc":"h3=\\":443\\"; ma=2592000","content-length":"34","content-security-policy":"sandbox allow-downloads allow-forms allow-modals allow-orientation-lock allow-pointer-lock allow-popups allow-presentation allow-scripts allow-top-navigation allow-top-navigation-by-user-activation allow-top-navigation-to-custom-protocols","content-type":"application/json; charset=utf-8","date":"Mon, 19 Jan 2026 19:55:11 GMT","etag":"W/\\"22-6OS7cK0FzqnV2NeDHdOSGS1bVUs\\"","vary":"Accept-Encoding","via":"1.1 Caddy","connection":"close"},"data":{"message":"Workflow was started"}},"$accountability":{"role":"4b9c2a26-828b-4a29-92db-a4e714d6f484","user":"24f7d0fe-8079-4470-a550-625130a01a4c","roles":["4b9c2a26-828b-4a29-92db-a4e714d6f484"],"admin":true,"app":true,"ip":"73.51.104.220","userAgent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36","origin":"https://admin.leads2scale.com","session":"0Eq2NY58zQhfDhbCSsK5vhdVTB0vpgQHTEGwmtW2R3CmkPAI1-kIJYtTuTH8mlpF"},"$env":{},"request_vlc81":{"status":200,"statusText":"OK","headers":{"alt-svc":"h3=\\":443\\"; ma=2592000","content-length":"34","content-security-policy":"sandbox allow-downloads allow-forms allow-modals allow-orientation-lock allow-pointer-lock allow-popups allow-presentation allow-scripts allow-top-navigation allow-top-navigation-by-user-activation allow-top-navigation-to-custom-protocols","content-type":"application/json; charset=utf-8","date":"Mon, 19 Jan 2026 19:55:11 GMT","etag":"W/\\"22-6OS7cK0FzqnV2NeDHdOSGS1bVUs\\"","vary":"Accept-Encoding","via":"1.1 Caddy","connection":"close"},"data":{"message":"Workflow was started"}}}}	\N	\N	\N
1118	1298	knowledge_base	4	{"id":4,"file":null,"status":"published","sync_status":"pending","document_type":"faq","client_id":4,"title":"LGR Business Rules","type":"Business Rules","file_id":"0ea9d36b-dc61-4fb8-8798-d8edd882f891","extracted_data":null,"content":"\\"You are Alex, the senior virtual receptionist for Leads2Scale. Tone: Professional, proactive, and friendly. Responses must be under 2 sentences.\\"\\n\\nLeads Grow Revenue\\nAI Receptionist – Business Rules & Operating Logic\\n\\nPrimary Objective:\\nNever miss a lead. Always respond professionally. Capture intent, qualify, route, and escalate correctly.\\n\\n1. Core Operating Principles (Always True)\\n\\nThese rules override everything else.\\n\\nNever let a caller reach voicemail\\n\\nAlways attempt to help before transferring\\n\\nBe calm, professional, and concise\\n\\nDo not argue, diagnose, or promise outcomes\\n\\nIf uncertain → capture details and escalate\\n\\nIf urgency or risk is detected → prioritize transfer\\n\\n2. Business Hours Logic\\n\\nOpen Hours\\n\\nMonday–Friday\\n\\n9:00 AM – 5:00 PM CST\\n\\nDuring Open Hours\\n\\nOffer live transfer when appropriate\\n\\nOffer appointment scheduling if live transfer unavailable\\n\\nEscalate urgent issues immediately\\n\\nAfter Hours / Weekends / Holidays\\n\\nNever say “we’re closed” without offering help\\n\\nCapture:\\n\\nName\\n\\nPhone number\\n\\nReason for call\\n\\nUrgency level\\n\\nRoute emergency or high-urgency calls if allowed\\n\\nOtherwise schedule callback for next business day\\n\\n3. Intent Detection Rules (High Priority Keywords)\\nImmediate Transfer Triggers\\n\\nIf the caller mentions any of the following, offer immediate transfer:\\n\\n“refund”\\n\\n“manager”\\n\\n“supervisor”\\n\\n“complaint”\\n\\n“legal”\\n\\n“lawsuit”\\n\\n“cancel service”\\n\\n“billing error”\\n\\n“charge dispute”\\n\\nResponse Pattern\\n\\n“I can help get you to the right person right away. Let me transfer you.”\\n\\n4. Emergency & Urgency Classification\\nEmergency Indicators (Industry-Agnostic)\\n\\nIf the caller expresses:\\n\\nImmediate danger\\n\\nSafety risk\\n\\nService outage affecting health/property\\n\\n“Right now”, “ASAP”, “emergency”, “flood”, “no heat”, “fire”, “locked out”\\n\\nAction\\n\\nSkip qualification\\n\\nOffer immediate transfer\\n\\nIf transfer fails → capture details + escalate\\n\\n5. Lead Qualification Rules (Standard Calls)\\n\\nFor non-emergency, non-complaint calls, collect:\\n\\nCaller name\\n\\nPhone number (required)\\n\\nReason for calling\\n\\nDesired service or outcome\\n\\nTiming (now / soon / just researching)\\n\\nLocation (if service-based business)\\n\\nDo NOT\\n\\nAsk more than necessary\\n\\nRepeat questions\\n\\nAsk for sensitive information\\n\\n6. Transfer Logic Rules\\nOffer Live Transfer When:\\n\\nCaller requests a person\\n\\nHigh-intent lead detected\\n\\nPricing or booking is requested\\n\\nEmergency or complaint keywords detected\\n\\nDo NOT Transfer When:\\n\\nCaller only wants general info\\n\\nCaller is unsure or browsing\\n\\nAfter-hours unless escalation is allowed\\n\\n7. Appointment Scheduling Rules\\n\\nIf live transfer is unavailable:\\n\\nOffer to schedule a callback or appointment\\n\\nConfirm:\\n\\nDate\\n\\nTime window\\n\\nBest contact number\\n\\nConfirmation Language\\n\\n“I’ve got that scheduled. Someone will reach out during that time.”\\n\\n8. Data Capture & Validation Rules\\n\\nAlways confirm phone number verbally\\n\\nRepeat critical details once\\n\\nIf caller refuses to give contact info:\\n\\nPolitely explain it’s required to help further\\n\\nIf still refused → end politely\\n\\n9. Tone & Behavior Rules\\n\\nThe AI receptionist must always be:\\n\\nFriendly, not casual\\n\\nConfident, not robotic\\n\\nEfficient, not rushed\\n\\nRespectful, even with upset callers\\n\\nNever\\n\\nSay “I’m just an AI”\\n\\nSay “I don’t know”\\n\\nBlame systems or staff\\n\\nOver-explain internal processes\\n\\n10. Fallback & Failure Rules\\n\\nIf:\\n\\nAudio is unclear\\n\\nCaller is confused\\n\\nSystem cannot route properly\\n\\nAction\\n\\nApologize briefly\\n\\nCapture callback info\\n\\nEscalate to human follow-up\\n\\n11. Compliance & Safety Rules\\n\\nDo not provide legal advice\\n\\nDo not provide medical advice\\n\\nDo not collect payment info\\n\\nDo not store sensitive personal data\\n\\nIf inappropriate or abusive language occurs:\\n\\nSet boundaries\\n\\nOffer to transfer or end call politely\\n\\n12. Success Definition (For AI Training)\\n\\nA call is successful if any of the following occur:\\n\\nLive transfer completed\\n\\nAppointment scheduled\\n\\nCallback request captured\\n\\nLead information saved accurately\\n\\n13. Rule Priority Order (Important)\\n\\nSafety & Emergency\\n\\nRefund / Manager / Complaint\\n\\nBusiness Hours Logic\\n\\nLead Qualification\\n\\nScheduling / Routing\\n\\nInformation Only"}	{"content":"\\"You are Alex, the senior virtual receptionist for Leads2Scale. Tone: Professional, proactive, and friendly. Responses must be under 2 sentences.\\"\\n\\nLeads Grow Revenue\\nAI Receptionist – Business Rules & Operating Logic\\n\\nPrimary Objective:\\nNever miss a lead. Always respond professionally. Capture intent, qualify, route, and escalate correctly.\\n\\n1. Core Operating Principles (Always True)\\n\\nThese rules override everything else.\\n\\nNever let a caller reach voicemail\\n\\nAlways attempt to help before transferring\\n\\nBe calm, professional, and concise\\n\\nDo not argue, diagnose, or promise outcomes\\n\\nIf uncertain → capture details and escalate\\n\\nIf urgency or risk is detected → prioritize transfer\\n\\n2. Business Hours Logic\\n\\nOpen Hours\\n\\nMonday–Friday\\n\\n9:00 AM – 5:00 PM CST\\n\\nDuring Open Hours\\n\\nOffer live transfer when appropriate\\n\\nOffer appointment scheduling if live transfer unavailable\\n\\nEscalate urgent issues immediately\\n\\nAfter Hours / Weekends / Holidays\\n\\nNever say “we’re closed” without offering help\\n\\nCapture:\\n\\nName\\n\\nPhone number\\n\\nReason for call\\n\\nUrgency level\\n\\nRoute emergency or high-urgency calls if allowed\\n\\nOtherwise schedule callback for next business day\\n\\n3. Intent Detection Rules (High Priority Keywords)\\nImmediate Transfer Triggers\\n\\nIf the caller mentions any of the following, offer immediate transfer:\\n\\n“refund”\\n\\n“manager”\\n\\n“supervisor”\\n\\n“complaint”\\n\\n“legal”\\n\\n“lawsuit”\\n\\n“cancel service”\\n\\n“billing error”\\n\\n“charge dispute”\\n\\nResponse Pattern\\n\\n“I can help get you to the right person right away. Let me transfer you.”\\n\\n4. Emergency & Urgency Classification\\nEmergency Indicators (Industry-Agnostic)\\n\\nIf the caller expresses:\\n\\nImmediate danger\\n\\nSafety risk\\n\\nService outage affecting health/property\\n\\n“Right now”, “ASAP”, “emergency”, “flood”, “no heat”, “fire”, “locked out”\\n\\nAction\\n\\nSkip qualification\\n\\nOffer immediate transfer\\n\\nIf transfer fails → capture details + escalate\\n\\n5. Lead Qualification Rules (Standard Calls)\\n\\nFor non-emergency, non-complaint calls, collect:\\n\\nCaller name\\n\\nPhone number (required)\\n\\nReason for calling\\n\\nDesired service or outcome\\n\\nTiming (now / soon / just researching)\\n\\nLocation (if service-based business)\\n\\nDo NOT\\n\\nAsk more than necessary\\n\\nRepeat questions\\n\\nAsk for sensitive information\\n\\n6. Transfer Logic Rules\\nOffer Live Transfer When:\\n\\nCaller requests a person\\n\\nHigh-intent lead detected\\n\\nPricing or booking is requested\\n\\nEmergency or complaint keywords detected\\n\\nDo NOT Transfer When:\\n\\nCaller only wants general info\\n\\nCaller is unsure or browsing\\n\\nAfter-hours unless escalation is allowed\\n\\n7. Appointment Scheduling Rules\\n\\nIf live transfer is unavailable:\\n\\nOffer to schedule a callback or appointment\\n\\nConfirm:\\n\\nDate\\n\\nTime window\\n\\nBest contact number\\n\\nConfirmation Language\\n\\n“I’ve got that scheduled. Someone will reach out during that time.”\\n\\n8. Data Capture & Validation Rules\\n\\nAlways confirm phone number verbally\\n\\nRepeat critical details once\\n\\nIf caller refuses to give contact info:\\n\\nPolitely explain it’s required to help further\\n\\nIf still refused → end politely\\n\\n9. Tone & Behavior Rules\\n\\nThe AI receptionist must always be:\\n\\nFriendly, not casual\\n\\nConfident, not robotic\\n\\nEfficient, not rushed\\n\\nRespectful, even with upset callers\\n\\nNever\\n\\nSay “I’m just an AI”\\n\\nSay “I don’t know”\\n\\nBlame systems or staff\\n\\nOver-explain internal processes\\n\\n10. Fallback & Failure Rules\\n\\nIf:\\n\\nAudio is unclear\\n\\nCaller is confused\\n\\nSystem cannot route properly\\n\\nAction\\n\\nApologize briefly\\n\\nCapture callback info\\n\\nEscalate to human follow-up\\n\\n11. Compliance & Safety Rules\\n\\nDo not provide legal advice\\n\\nDo not provide medical advice\\n\\nDo not collect payment info\\n\\nDo not store sensitive personal data\\n\\nIf inappropriate or abusive language occurs:\\n\\nSet boundaries\\n\\nOffer to transfer or end call politely\\n\\n12. Success Definition (For AI Training)\\n\\nA call is successful if any of the following occur:\\n\\nLive transfer completed\\n\\nAppointment scheduled\\n\\nCallback request captured\\n\\nLead information saved accurately\\n\\n13. Rule Priority Order (Important)\\n\\nSafety & Emergency\\n\\nRefund / Manager / Complaint\\n\\nBusiness Hours Logic\\n\\nLead Qualification\\n\\nScheduling / Routing\\n\\nInformation Only"}	\N	\N
1119	1299	knowledge_base	3	{"id":3,"file":null,"status":"published","sync_status":"pending","document_type":"faq","client_id":4,"title":"Alex Persona","type":"Persona","file_id":"77a5abc1-5c65-4276-96ea-be4d3958c52a","extracted_data":null,"content":"\\"You are Alex, a professional virtual receptionist for Leads2Scale. Your tone is helpful and proactive.\\""}	{"sync_status":"pending"}	\N	\N
1120	1300	directus_fields	349	{"id":349,"collection":"knowledge_base","field":"document_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Pricing","value":"Pricing"},{"text":"FAQ","value":"FAQ"},{"text":"Transcript","value":"Transcript"},{"text":"Content/Text","value":"Content/Text"},{"text":"Vector/Embedding","value":"Vector/Embedding"},{"text":"Metadata","value":"Metadata"},{"text":"Standard Operating Procedure (SOP)","value":"Standard Operating Procedure (SOP)"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"knowledge_base","field":"document_type","options":{"choices":[{"text":"Pricing","value":"Pricing"},{"text":"FAQ","value":"FAQ"},{"text":"Transcript","value":"Transcript"},{"text":"Content/Text","value":"Content/Text"},{"text":"Vector/Embedding","value":"Vector/Embedding"},{"text":"Metadata","value":"Metadata"},{"text":"Standard Operating Procedure (SOP)","value":"Standard Operating Procedure (SOP)"}]}}	\N	\N
1121	1301	directus_fields	349	{"id":349,"collection":"knowledge_base","field":"document_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Pricing Manifest","value":"Pricing Manifest"},{"text":"Company FAQ","value":"Company FAQ"},{"text":"Transcript","value":"Transcript"},{"text":"Content/Text","value":"Content/Text"},{"text":"Vector/Embedding","value":"Vector/Embedding"},{"text":"Metadata","value":"Metadata"},{"text":"Standard Operating Procedure (SOP)","value":"Standard Operating Procedure (SOP)"},{"text":"Service Area Map","value":"Service Area Map"},{"text":"Technical Manual","value":"Technical Manual"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"knowledge_base","field":"document_type","options":{"choices":[{"text":"Pricing Manifest","value":"Pricing Manifest"},{"text":"Company FAQ","value":"Company FAQ"},{"text":"Transcript","value":"Transcript"},{"text":"Content/Text","value":"Content/Text"},{"text":"Vector/Embedding","value":"Vector/Embedding"},{"text":"Metadata","value":"Metadata"},{"text":"Standard Operating Procedure (SOP)","value":"Standard Operating Procedure (SOP)"},{"text":"Service Area Map","value":"Service Area Map"},{"text":"Technical Manual","value":"Technical Manual"}]}}	\N	\N
1122	1302	directus_fields	349	{"id":349,"collection":"knowledge_base","field":"document_type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Pricing Manifest","value":"Pricing Manifest"},{"text":"Company FAQ","value":"Company FAQ"},{"text":"Transcript","value":"Transcript"},{"text":"Content/Text","value":"Content/Text"},{"text":"Vector/Embedding","value":"Vector/Embedding"},{"text":"Metadata","value":"Metadata"},{"text":"Standard Operating Procedure (SOP)","value":"Standard Operating Procedure (SOP)"},{"text":"Service Area Map","value":"Service Area Map"},{"text":"Technical Manual","value":"Technical Manual"},{"text":"Sales Script","value":"Sales Script"},{"text":"Staff Roster","value":"Staff Roster"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null,"searchable":true}	{"collection":"knowledge_base","field":"document_type","options":{"choices":[{"text":"Pricing Manifest","value":"Pricing Manifest"},{"text":"Company FAQ","value":"Company FAQ"},{"text":"Transcript","value":"Transcript"},{"text":"Content/Text","value":"Content/Text"},{"text":"Vector/Embedding","value":"Vector/Embedding"},{"text":"Metadata","value":"Metadata"},{"text":"Standard Operating Procedure (SOP)","value":"Standard Operating Procedure (SOP)"},{"text":"Service Area Map","value":"Service Area Map"},{"text":"Technical Manual","value":"Technical Manual"},{"text":"Sales Script","value":"Sales Script"},{"text":"Staff Roster","value":"Staff Roster"}]}}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_roles (id, name, icon, description, parent, ip_access, admin_access, app_access) FROM stdin;
4b9c2a26-828b-4a29-92db-a4e714d6f484	Administrator	verified	$t:admin_description	\N	\N	t	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
QsvJC3mZ08mWPRKZJ0NhG8VRNJ-1W1BZZ5esTfQBrdNNN8UlkIHk0Ejt6tijLP4f	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-23 00:46:17.813+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	\N	https://admin.leads2scale.com	\N
7CJdWRkN6mD8UwCpRsL76Wqgka8m_tesg-UR7hK1MXGLCNTP8tNqxCvPYLXu9jXk	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-19 18:25:55.172+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	\N	https://admin.leads2scale.com	0Eq2NY58zQhfDhbCSsK5vhdVTB0vpgQHTEGwmtW2R3CmkPAI1-kIJYtTuTH8mlpF
0Eq2NY58zQhfDhbCSsK5vhdVTB0vpgQHTEGwmtW2R3CmkPAI1-kIJYtTuTH8mlpF	24f7d0fe-8079-4470-a550-625130a01a4c	2026-01-20 18:25:45.172+00	73.51.104.220	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36	\N	https://admin.leads2scale.com	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter, visual_editor_urls, project_id, mcp_enabled, mcp_allow_deletes, mcp_prompts_collection, mcp_system_prompt_enabled, mcp_system_prompt, project_owner, project_usage, org_name, product_updates, project_status, ai_openai_api_key, ai_anthropic_api_key, ai_system_prompt) FROM stdin;
1	LGR Data Engine	\N	#6644FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N	\N	en-US	\N	\N	auto	Directus Color Match	\N	\N	\N	\N	\N	\N	f	t	\N	\N	\N	019a9ec1-bd01-7363-aa4c-f4af8e6c87b0	f	f	\N	t	\N	jlanders@leadsgrowrevenue.com	commercial	Leads Grow Revenue	t	\N	\N	\N	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides, text_direction) FROM stdin;
24f7d0fe-8079-4470-a550-625130a01a4c	John	Landers	jlanders@leadsgrowrevenue.com	$argon2id$v=19$m=65536,t=3,p=4$VxW8ap9pyvSJILhlpH17lQ$quTZ+dPtOPZDIq0oh9gCBEW2VVFxX3QVcQsD8LRhzZU	\N	\N	\N	\N	\N	\N	\N	active	4b9c2a26-828b-4a29-92db-a4e714d6f484	xS14AM4ll59TPoa0BWrEKL425KKkk4PH	2026-01-19 18:25:45.182+00	/settings/data-model/knowledge_base	default	\N	\N	t	\N	Directus Default	Directus Color Match	\N	\N	auto
bf970007-d005-407c-a1e6-399bba718004	Admin	User	admin@example.com	$2b$10$bUvMAbAxipByvGtZL5YxVu4EG8XPy8fqgG4J3b3Q/bR6U856sq1na	\N	\N	\N	\N	\N	\N	\N	active	4b9c2a26-828b-4a29-92db-a4e714d6f484	4rrdFEHWVp9RQ2mOTFXeSPjwSqcLp_4u	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N	auto
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: experience_snippets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.experience_snippets (id, snippet_text, tags, created_at, snippet_category, industry_id, sub_industry_id, persona_id, create_at) FROM stdin;
\.


--
-- Data for Name: fact_candidates; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.fact_candidates (id, request_id, source_url, fact_text, type, source_authority, jurisdiction, study_year, published_at, meta) FROM stdin;
\.


--
-- Data for Name: image_assets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.image_assets (id, title, source_type, url, alt_text, caption, filename, license_info, meta, created_at, request_id, slot, purpose) FROM stdin;
\.


--
-- Data for Name: industries; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.industries (id, name, slug, active, description) FROM stdin;
6774f0be-0669-4ffb-9df5-0bd378359769	Home Services	home_services	t	\N
ed10de1b-7c37-4b9a-be3e-82e4ffe276f3	Legal Services	legal_services	t	\N
e1f7d16c-765d-4fed-845b-4237694f031f	Healthcare & Wellness	healthcare_wellness	t	\N
ce0f0c36-bef9-4f90-9795-2d9cfcc5e931	Real Estate	real_estate	t	\N
ff87ec96-6430-4d28-8c3f-9d6a5413e100	Finance & Insurance	finance_insurance	t	\N
0c0ef9e2-dde4-4630-8af7-5cc804ba1bbe	Education & Training	education_training	t	\N
e409e62c-783e-40e2-bf87-147062a0d9a3	Technology & Software	technology_software	t	\N
5c809cf9-d0c1-4c60-943c-43831aea998b	Marketing & Advertising	marketing_advertising	t	\N
cf8a7db1-e299-4f40-89a4-bc56b6e0027d	Retail & Ecommerce	retail_ecommerce	t	\N
5d494945-a138-433a-abe1-d50abddf6920	Automotive	automotive	t	\N
47dc51ef-db3e-4712-b287-0635bddc27b1	Food & Beverage	food_beverage	t	\N
026b8931-6957-4469-a69f-4e514f80c352	Construction & Contracting	construction_contracting	t	\N
f2138a34-80a7-47bc-a291-dba0767726c7	Manufacturing & Industrial	manufacturing_industrial	t	\N
af8b6887-8ef1-493d-a175-db9530018257	Hospitality & Travel	hospitality_travel	t	\N
5e6347b2-e5c5-44cb-915b-caff8cb5e858	Beauty & Personal Care	beauty_personal_care	t	\N
9c6e25fc-40b5-4052-b94b-a092686fe23b	Fitness & Sports	fitness_sports	t	\N
1329c315-fd5d-4f47-9685-1b25cdcf4703	Government & Public Sector	government_public_sector	t	\N
445acb7e-e5b1-4f3d-a2ab-18c4f38be64e	Non-Profit & Community Services	nonprofit_community_services	t	\N
787029ec-76e1-46f8-99f4-097dbcc51e41	Arts Media & Entertainment	arts_media_entertainment	t	\N
964f3353-889c-40ab-b939-aa0ef02c377a	Agriculture & Farming	agriculture_farming	t	\N
26f22523-6e5e-41f3-aff2-8f53fd4401ec	Energy & Utilities	energy_utilities	t	\N
b28a9c96-5b08-45c6-bb39-b1638e55eb91	Transportation & Logistics	transportation_logistics	t	\N
29028ae4-904b-4422-8739-40f61e66e875	Human Resources & Recruiting	human_resources_recruiting	t	\N
88900218-ab2a-4cba-8201-79ac759cbe37	Professional Services	professional_services	t	\N
ee9d04b3-dd20-4051-96dd-52fee7a98e0a	Science & Research	science_research	t	\N
\.


--
-- Data for Name: intel_debug; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.intel_debug (id, "sourceUrl", "businessWebsiteRoot", "rawPayload", "createAt", business) FROM stdin;
\.


--
-- Data for Name: intel_provenance; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.intel_provenance (id, business, field_name, value, source, confidence, raw_input, last_verified) FROM stdin;
\.


--
-- Data for Name: kb_chunks; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.kb_chunks (id, doc_id, niche_slug, chunk_test, embedding) FROM stdin;
\.


--
-- Data for Name: kb_documents; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.kb_documents (id, title, niche_slug, city_slug, source_type, source_url, tags, raw_text, visibility, checksum) FROM stdin;
\.


--
-- Data for Name: keyword_opportunities; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.keyword_opportunities (id, keyword, volume, difficulty, opportunity_score, status) FROM stdin;
\.


--
-- Data for Name: knowledge_base; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.knowledge_base (id, file, status, sync_status, document_type, client_id, title, type, file_id, extracted_data, content) FROM stdin;
2	\N	published	\N	faq	\N	Alex Persona	Persona	9bbc103d-2453-4b0b-99ba-07ed4a78f4f5	\N	\N
1	225dbb86-c988-4a2e-b7ec-4913d745fd01	published	pending	faq	4	Leads Grow Revenue v2	Training	\N	\N	\N
4	\N	published	pending	faq	4	LGR Business Rules	Business Rules	0ea9d36b-dc61-4fb8-8798-d8edd882f891	\N	"You are Alex, the senior virtual receptionist for Leads2Scale. Tone: Professional, proactive, and friendly. Responses must be under 2 sentences."\n\nLeads Grow Revenue\nAI Receptionist – Business Rules & Operating Logic\n\nPrimary Objective:\nNever miss a lead. Always respond professionally. Capture intent, qualify, route, and escalate correctly.\n\n1. Core Operating Principles (Always True)\n\nThese rules override everything else.\n\nNever let a caller reach voicemail\n\nAlways attempt to help before transferring\n\nBe calm, professional, and concise\n\nDo not argue, diagnose, or promise outcomes\n\nIf uncertain → capture details and escalate\n\nIf urgency or risk is detected → prioritize transfer\n\n2. Business Hours Logic\n\nOpen Hours\n\nMonday–Friday\n\n9:00 AM – 5:00 PM CST\n\nDuring Open Hours\n\nOffer live transfer when appropriate\n\nOffer appointment scheduling if live transfer unavailable\n\nEscalate urgent issues immediately\n\nAfter Hours / Weekends / Holidays\n\nNever say “we’re closed” without offering help\n\nCapture:\n\nName\n\nPhone number\n\nReason for call\n\nUrgency level\n\nRoute emergency or high-urgency calls if allowed\n\nOtherwise schedule callback for next business day\n\n3. Intent Detection Rules (High Priority Keywords)\nImmediate Transfer Triggers\n\nIf the caller mentions any of the following, offer immediate transfer:\n\n“refund”\n\n“manager”\n\n“supervisor”\n\n“complaint”\n\n“legal”\n\n“lawsuit”\n\n“cancel service”\n\n“billing error”\n\n“charge dispute”\n\nResponse Pattern\n\n“I can help get you to the right person right away. Let me transfer you.”\n\n4. Emergency & Urgency Classification\nEmergency Indicators (Industry-Agnostic)\n\nIf the caller expresses:\n\nImmediate danger\n\nSafety risk\n\nService outage affecting health/property\n\n“Right now”, “ASAP”, “emergency”, “flood”, “no heat”, “fire”, “locked out”\n\nAction\n\nSkip qualification\n\nOffer immediate transfer\n\nIf transfer fails → capture details + escalate\n\n5. Lead Qualification Rules (Standard Calls)\n\nFor non-emergency, non-complaint calls, collect:\n\nCaller name\n\nPhone number (required)\n\nReason for calling\n\nDesired service or outcome\n\nTiming (now / soon / just researching)\n\nLocation (if service-based business)\n\nDo NOT\n\nAsk more than necessary\n\nRepeat questions\n\nAsk for sensitive information\n\n6. Transfer Logic Rules\nOffer Live Transfer When:\n\nCaller requests a person\n\nHigh-intent lead detected\n\nPricing or booking is requested\n\nEmergency or complaint keywords detected\n\nDo NOT Transfer When:\n\nCaller only wants general info\n\nCaller is unsure or browsing\n\nAfter-hours unless escalation is allowed\n\n7. Appointment Scheduling Rules\n\nIf live transfer is unavailable:\n\nOffer to schedule a callback or appointment\n\nConfirm:\n\nDate\n\nTime window\n\nBest contact number\n\nConfirmation Language\n\n“I’ve got that scheduled. Someone will reach out during that time.”\n\n8. Data Capture & Validation Rules\n\nAlways confirm phone number verbally\n\nRepeat critical details once\n\nIf caller refuses to give contact info:\n\nPolitely explain it’s required to help further\n\nIf still refused → end politely\n\n9. Tone & Behavior Rules\n\nThe AI receptionist must always be:\n\nFriendly, not casual\n\nConfident, not robotic\n\nEfficient, not rushed\n\nRespectful, even with upset callers\n\nNever\n\nSay “I’m just an AI”\n\nSay “I don’t know”\n\nBlame systems or staff\n\nOver-explain internal processes\n\n10. Fallback & Failure Rules\n\nIf:\n\nAudio is unclear\n\nCaller is confused\n\nSystem cannot route properly\n\nAction\n\nApologize briefly\n\nCapture callback info\n\nEscalate to human follow-up\n\n11. Compliance & Safety Rules\n\nDo not provide legal advice\n\nDo not provide medical advice\n\nDo not collect payment info\n\nDo not store sensitive personal data\n\nIf inappropriate or abusive language occurs:\n\nSet boundaries\n\nOffer to transfer or end call politely\n\n12. Success Definition (For AI Training)\n\nA call is successful if any of the following occur:\n\nLive transfer completed\n\nAppointment scheduled\n\nCallback request captured\n\nLead information saved accurately\n\n13. Rule Priority Order (Important)\n\nSafety & Emergency\n\nRefund / Manager / Complaint\n\nBusiness Hours Logic\n\nLead Qualification\n\nScheduling / Routing\n\nInformation Only
3	\N	published	pending	faq	4	Alex Persona	Persona	77a5abc1-5c65-4276-96ea-be4d3958c52a	\N	"You are Alex, a professional virtual receptionist for Leads2Scale. Your tone is helpful and proactive."
\.


--
-- Data for Name: learning_queue; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.learning_queue (id, created_at, niche_slug, question, proposed_answer, evidence_chunks, status) FROM stdin;
\.


--
-- Data for Name: niche_snapshots; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.niche_snapshots (id, niche_name, urgency_level, industry_vocabulary, default_tools, system_prompt_base) FROM stdin;
1	Legal	["medium"]	["plaintiff","defendant","liability","statute of limitations","contingency fee","retainer","deposition","tort"]	["legal_intake_form","conflict_check","schedule_consultation","emergency_escalation_sms"]	You are an Intake Specialist for {{business_name}}. You are NOT an attorney and cannot give legal advice. YOUR GOAL: Gather the facts of the potential client's case with empathy and professionalism, then schedule a consultation if they qualify. MANDATORY SCRIPT:\n\nDisclaimer: If a user asks for advice (e.g., "Will I win?"), reply: "I cannot provide legal advice, but I can set up a free consultation with an attorney who can evaluate your case."\n\nIntake Phase: Before booking, you must ask:\n\n"When did the incident occur?"\n\n"Were there any injuries?"\n\n"Have you already spoken to another law firm?"\n\nTONE: Empathetic, discreet, professional, and calm. Never use slang.\n\nESCALATION: If the caller mentions being currently arrested, in jail, or served with papers for court tomorrow, use the emergency_escalation_sms tool immediately.
2	Home Services	["High"]	["refrigerant","breaker box","sump pump","water heater","outage","freon","compressor","snake the drain"]	["check_service_area","emergency_escalation_sms","book_dispatch","price_estimator"]	You are a Dispatcher for {{business_name}}. You are direct, efficient, and solution-focused. YOUR GOAL: Identify the issue, check if it's an emergency, and get a technician scheduled immediately. Do not waste time with small talk. RULES:\n\nSafety First: If the user mentions "gas smell", "sparks", or "standing water", trigger the emergency_escalation_sms tool immediately.\n\nGeography: Always ask for the ZIP code first to verify they are in our service area using check_service_area.\n\nBooking: If it's an emergency, offer the "Emergency Dispatch" slot (higher rate). If routine, offer standard slots.
3	Medical & Dental	["medium"]	["PPO","HMO","copay","root canal","cleaning","new patient","referral","insurance card"]	["check_insurance_kb","book_appointment","reschedule_logic","post_op_instructions"]	You are a Front Desk Coordinator for {{business_name}}. Your tone is warm, caring, and precise. YOUR GOAL: Help patients schedule appointments and answer insurance questions without violating privacy. MANDATORY PROTOCOLS:\n\nHIPAA: Never repeat a patient's full medical history out loud. Confirm identity by asking for Date of Birth.\n\nTriage: If a patient is in severe pain or bleeding, advise them to go to the ER or call 911, then offer an emergency slot if appropriate.\n\nInsurance: If asked "Do you take my insurance?", use the check_insurance_kb tool. Do not guess.
4	Real Estate 	["High"]	["showing","listing","lease terms","credit score","move-in date","guarantor","HOA fee","open house"]	["schedule_viewing","qualify_buyer","send_property_link","mortgage_calculator"]	You are a Leasing Assistant for {{business_name}}. You are enthusiastic, high-energy, and sales-oriented. YOUR GOAL: Turn callers into showings. Speed is everything. SCRIPT:\n\nQualify: "Are you looking to move in the next 30 days?"\n\nCapture: "I can text you the listing photos right now—is this a mobile number?" (Use send_property_link).\n\nClose: "We have a slot open at 4 PM today to see the property. Shall I lock that in for you?"
5	Contractor & Trades	["Low"]	["quote","estimate","square footage","permit","subcontractor","deposit","change order"]	["take_message","send_callback_sms","quote_request_form"]	You are the Site Manager's Assistant for {{business_name}}. You are brief, polite, and protective of the owner's time. CONTEXT: The boss is likely on a roof or under a sink. Do not promise an immediate conversation. YOUR GOAL: Filter serious jobs from tire-kickers. ACTION: "Thanks for calling. {{business_name}} is on a job site right now. I can grab your info and have them text you a quote request form, or I can take a message. Which do you prefer?"
6	Solopreneurs/Small Teams	["Low"]	["consultation","rate card","availability","collaboration","partnership"]	["spam_filter","take_message","calendar_check"]	You are the Executive Assistant for {{business_name}}. You are professional, organized, and polite. YOUR GOAL: act as a filter. Block spam calls, schedule qualified consultations, and take clear messages. PROTOCOL:\n\nFilter: If the caller is selling SEO, Google Maps verification, or a scam, use the spam_filter tool to politely end the call.\n\nSchedule: "I manage {{business_name}}'s calendar. I can check availability for a 15-minute intro call."
\.


--
-- Data for Name: seo_audit; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.seo_audit (id, domain, "auditDate", "contentScore", "performanceScore", "localSeoScore", "technicalScore", "overallScore", "entityClarityScore", "aiFactScore", "informationCompletenessScore", "adwordsOpportunityScore", "localRankOpportunityScore", "voiceScore", "aiVisibilityScore", "aiContentCompletenessScore", "missingAIDataPoints", "entityConfusionRisk", "valueIntentValueScore", "localSearchOpportunityScore", "nearMeRankingScore", "dealOpportunityScore", "multiModalOpportunityScore", "hasMetaTitle", "hasMetaDescription", "hasOgTags", "hasTwitterCards", "hasSchemaLD", "hasRobotsTXT", "hasSiteMap", "hasSSL", "hasMobileFriendly", "hasAltTags", "hasH1H2Structure", "missingPages", "missingSocialProfile", "missingImageAltTags", "missingVideoContent", "missingAudioContent", "wordCount", "imageCount", "brokenLinks", "internalLinks", "externalLinks", "primaryKeyword", "missingKeywordOpportunities", "opportunitySummary", "cityKeywordGaps", "rawMetrics", "rawContentScan", "relatedServicePages", "relatedCityPages", "internalLinkOpportunities", "conversionOpportunitySummary", "buyerIntenKeywords", "nearMeKeywords", "openNowKeywords", "localDiscountKeywords", "serviceIntentKeywords", "neighborhoodKeywords", "cityIntentGaps", "geoCoverageGaps", "localCompetitionGap", "categoryKeywords", "dealIntentKeywords", "recommendedImagePrompts", "recommendedAudioTopics", "recommendedVideoTopics", business, "metaScore") FROM stdin;
\.


--
-- Data for Name: seo_enrichment; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.seo_enrichment (id, business, summary_short, summary_long, keywords, "servicePageIntro", "servicePageDetails", "localLandingPageIntro", "categoryLandingPageIntro", "cityLandingKeywords", "spokenAnswerSnippet", "conversationalFAQ", "voiceKeywords", "localVoiceSnippet", "aiOverviewSnippet", "aiLocalRecommendationSnippet", "aiServiceExplanation", "aiComparisonSnippet", "schemaEntitySummary", "aiQuestionAnswerPairs", "structuredAnswerBlocks", "aiFriendlyFacts", "nearMeSnippet", "buyerIntentSnippet") FROM stdin;
\.


--
-- Data for Name: silo_nodes; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.silo_nodes (id, silo_id, node_type, title, target_keyword, parent_node_id, content_request_id, status, topic_id) FROM stdin;
\.


--
-- Data for Name: sub_industries; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.sub_industries (id, slug, name, description, active, industry) FROM stdin;
129	\N	hvac	\N	t	\N
1	hvac_installation	HVAC Installation	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
2	hvac_repair	HVAC Repair	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
3	plumbing_services	Plumbing Services	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
4	drain_cleaning	Drain Cleaning	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
5	electrical_services	Electrical Services	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
6	handyman_services	Handyman Services	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
7	roofing_services	Roofing Services	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
8	gutter_cleaning	Gutter Cleaning	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
9	landscaping_services	Landscaping Services	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
10	lawn_care	Lawn Care	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
11	tree_removal	Tree Removal	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
12	fence_installation	Fence Installation	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
13	window_installation	Window Installation	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
14	door_installation	Door Installation	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
15	flooring_installation	Flooring Installation	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
16	pest_control	Pest Control	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
17	painting_interior	Painting Interior	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
18	painting_exterior	Painting Exterior	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
19	carpet_cleaning	Carpet Cleaning	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
20	house_cleaning	House Cleaning	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
21	junk_removal	Junk Removal	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
22	garage_door_repair	Garage Door Repair	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
23	pool_services	Pool Services	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
24	home_security_installation	Home Security Installation	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
25	solar_installation	Solar Installation	\N	t	6774f0be-0669-4ffb-9df5-0bd378359769
26	family_law	Family Law	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
27	criminal_defense	Criminal Defense	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
28	personal_injury	Personal Injury	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
29	estate_planning	Estate Planning	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
30	real_estate_law	Real Estate Law	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
31	immigration_law	Immigration Law	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
32	corporate_law	Corporate Law	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
33	tax_law	Tax Law	\N	t	ed10de1b-7c37-4b9a-be3e-82e4ffe276f3
34	primary_care	Primary Care	\N	t	e1f7d16c-765d-4fed-845b-4237694f031f
35	mental_health	Mental Health Counseling	\N	t	e1f7d16c-765d-4fed-845b-4237694f031f
36	physical_therapy	Physical Therapy	\N	t	e1f7d16c-765d-4fed-845b-4237694f031f
37	dental_services	Dental Services	\N	t	e1f7d16c-765d-4fed-845b-4237694f031f
38	chiropractic_care	Chiropractic Care	\N	t	e1f7d16c-765d-4fed-845b-4237694f031f
39	vision_care	Vision Care	\N	t	e1f7d16c-765d-4fed-845b-4237694f031f
40	dermatology	Dermatology	\N	t	e1f7d16c-765d-4fed-845b-4237694f031f
41	residential_real_estate	Residential Real Estate	\N	t	ce0f0c36-bef9-4f90-9795-2d9cfcc5e931
42	commercial_real_estate	Commercial Real Estate	\N	t	ce0f0c36-bef9-4f90-9795-2d9cfcc5e931
43	property_management	Property Management	\N	t	ce0f0c36-bef9-4f90-9795-2d9cfcc5e931
44	real_estate_investment	Real Estate Investment	\N	t	ce0f0c36-bef9-4f90-9795-2d9cfcc5e931
45	home_inspection	Home Inspection	\N	t	ce0f0c36-bef9-4f90-9795-2d9cfcc5e931
46	financial_planning	Financial Planning	\N	t	ff87ec96-6430-4d28-8c3f-9d6a5413e100
47	tax_preparation	Tax Preparation	\N	t	ff87ec96-6430-4d28-8c3f-9d6a5413e100
48	insurance_brokers	Insurance Brokers	\N	t	ff87ec96-6430-4d28-8c3f-9d6a5413e100
49	accounting_services	Accounting Services	\N	t	ff87ec96-6430-4d28-8c3f-9d6a5413e100
50	bookkeeping_services	Bookkeeping Services	\N	t	ff87ec96-6430-4d28-8c3f-9d6a5413e100
51	tutoring	Tutoring	\N	t	0c0ef9e2-dde4-4630-8af7-5cc804ba1bbe
52	test_prep	Test Prep	\N	t	0c0ef9e2-dde4-4630-8af7-5cc804ba1bbe
53	online_courses	Online Courses	\N	t	0c0ef9e2-dde4-4630-8af7-5cc804ba1bbe
54	corporate_training	Corporate Training	\N	t	0c0ef9e2-dde4-4630-8af7-5cc804ba1bbe
55	it_support	IT Support	\N	t	e409e62c-783e-40e2-bf87-147062a0d9a3
56	software_development	Software Development	\N	t	e409e62c-783e-40e2-bf87-147062a0d9a3
57	cybersecurity	Cybersecurity	\N	t	e409e62c-783e-40e2-bf87-147062a0d9a3
58	web_development	Web Development	\N	t	e409e62c-783e-40e2-bf87-147062a0d9a3
59	app_development	App Development	\N	t	e409e62c-783e-40e2-bf87-147062a0d9a3
60	digital_marketing	Digital Marketing	\N	t	5c809cf9-d0c1-4c60-943c-43831aea998b
61	seo_services	SEO Services	\N	t	5c809cf9-d0c1-4c60-943c-43831aea998b
62	content_creation	Content Creation	\N	t	5c809cf9-d0c1-4c60-943c-43831aea998b
63	brand_strategy	Brand Strategy	\N	t	5c809cf9-d0c1-4c60-943c-43831aea998b
64	social_media_management	Social Media Management	\N	t	5c809cf9-d0c1-4c60-943c-43831aea998b
65	clothing_stores	Clothing Stores	\N	t	cf8a7db1-e299-4f40-89a4-bc56b6e0027d
66	electronics_stores	Electronics Stores	\N	t	cf8a7db1-e299-4f40-89a4-bc56b6e0027d
67	grocery_retail	Grocery Retail	\N	t	cf8a7db1-e299-4f40-89a4-bc56b6e0027d
68	online_retailers	Online Retailers	\N	t	cf8a7db1-e299-4f40-89a4-bc56b6e0027d
69	auto_repair	Auto Repair	\N	t	5d494945-a138-433a-abe1-d50abddf6920
70	auto_body	Auto Body	\N	t	5d494945-a138-433a-abe1-d50abddf6920
71	car_dealerships	Car Dealerships	\N	t	5d494945-a138-433a-abe1-d50abddf6920
72	tire_services	Tire Services	\N	t	5d494945-a138-433a-abe1-d50abddf6920
73	car_wash	Car Wash	\N	t	5d494945-a138-433a-abe1-d50abddf6920
74	restaurants	Restaurants	\N	t	47dc51ef-db3e-4712-b287-0635bddc27b1
75	cafes	Cafes	\N	t	47dc51ef-db3e-4712-b287-0635bddc27b1
76	catering	Catering	\N	t	47dc51ef-db3e-4712-b287-0635bddc27b1
77	bars_pubs	Bars and Pubs	\N	t	47dc51ef-db3e-4712-b287-0635bddc27b1
78	general_contractors	General Contractors	\N	t	026b8931-6957-4469-a69f-4e514f80c352
79	carpentry_services	Carpentry Services	\N	t	026b8931-6957-4469-a69f-4e514f80c352
80	concrete_services	Concrete Services	\N	t	026b8931-6957-4469-a69f-4e514f80c352
81	masonry_services	Masonry Services	\N	t	026b8931-6957-4469-a69f-4e514f80c352
82	demolition_services	Demolition Services	\N	t	026b8931-6957-4469-a69f-4e514f80c352
83	machining	Machining	\N	t	f2138a34-80a7-47bc-a291-dba0767726c7
84	fabrication	Fabrication	\N	t	f2138a34-80a7-47bc-a291-dba0767726c7
85	packaging	Packaging	\N	t	f2138a34-80a7-47bc-a291-dba0767726c7
86	industrial_equipment	Industrial Equipment	\N	t	f2138a34-80a7-47bc-a291-dba0767726c7
87	hotels	Hotels	\N	t	af8b6887-8ef1-493d-a175-db9530018257
88	vacation_rentals	Vacation Rentals	\N	t	af8b6887-8ef1-493d-a175-db9530018257
89	travel_agencies	Travel Agencies	\N	t	af8b6887-8ef1-493d-a175-db9530018257
90	event_venues	Event Venues	\N	t	af8b6887-8ef1-493d-a175-db9530018257
91	hair_salons	Hair Salons	\N	t	5e6347b2-e5c5-44cb-915b-caff8cb5e858
92	barbershops	Barbershops	\N	t	5e6347b2-e5c5-44cb-915b-caff8cb5e858
93	nail_salons	Nail Salons	\N	t	5e6347b2-e5c5-44cb-915b-caff8cb5e858
94	massage_therapy	Massage Therapy	\N	t	5e6347b2-e5c5-44cb-915b-caff8cb5e858
95	skincare_services	Skincare Services	\N	t	5e6347b2-e5c5-44cb-915b-caff8cb5e858
96	gyms	Gyms	\N	t	9c6e25fc-40b5-4052-b94b-a092686fe23b
97	personal_training	Personal Training	\N	t	9c6e25fc-40b5-4052-b94b-a092686fe23b
98	yoga_studios	Yoga Studios	\N	t	9c6e25fc-40b5-4052-b94b-a092686fe23b
99	martial_arts	Martial Arts	\N	t	9c6e25fc-40b5-4052-b94b-a092686fe23b
100	municipal_services	Municipal Services	\N	t	1329c315-fd5d-4f47-9685-1b25cdcf4703
101	public_safety	Public Safety	\N	t	1329c315-fd5d-4f47-9685-1b25cdcf4703
102	social_services	Social Services	\N	t	1329c315-fd5d-4f47-9685-1b25cdcf4703
103	charitable_orgs	Charitable Organizations	\N	t	445acb7e-e5b1-4f3d-a2ab-18c4f38be64e
104	community_centers	Community Centers	\N	t	445acb7e-e5b1-4f3d-a2ab-18c4f38be64e
105	foundations	Foundations	\N	t	445acb7e-e5b1-4f3d-a2ab-18c4f38be64e
106	music_production	Music Production	\N	t	787029ec-76e1-46f8-99f4-097dbcc51e41
107	photography	Photography	\N	t	787029ec-76e1-46f8-99f4-097dbcc51e41
108	film_video	Film and Video	\N	t	787029ec-76e1-46f8-99f4-097dbcc51e41
109	live_events	Live Events	\N	t	787029ec-76e1-46f8-99f4-097dbcc51e41
110	crop_farming	Crop Farming	\N	t	964f3353-889c-40ab-b939-aa0ef02c377a
111	livestock_farming	Livestock Farming	\N	t	964f3353-889c-40ab-b939-aa0ef02c377a
112	agricultural_services	Agricultural Services	\N	t	964f3353-889c-40ab-b939-aa0ef02c377a
113	electric_utilities	Electric Utilities	\N	t	26f22523-6e5e-41f3-aff2-8f53fd4401ec
114	water_utilities	Water Utilities	\N	t	26f22523-6e5e-41f3-aff2-8f53fd4401ec
115	waste_management	Waste Management	\N	t	26f22523-6e5e-41f3-aff2-8f53fd4401ec
116	freight_transport	Freight Transport	\N	t	b28a9c96-5b08-45c6-bb39-b1638e55eb91
117	logistics_services	Logistics Services	\N	t	b28a9c96-5b08-45c6-bb39-b1638e55eb91
118	warehousing	Warehousing	\N	t	b28a9c96-5b08-45c6-bb39-b1638e55eb91
119	recruiting_services	Recruiting Services	\N	t	29028ae4-904b-4422-8739-40f61e66e875
120	staffing_agencies	Staffing Agencies	\N	t	29028ae4-904b-4422-8739-40f61e66e875
121	hr_consulting	HR Consulting	\N	t	29028ae4-904b-4422-8739-40f61e66e875
122	business_consulting	Business Consulting	\N	t	88900218-ab2a-4cba-8201-79ac759cbe37
123	management_consulting	Management Consulting	\N	t	88900218-ab2a-4cba-8201-79ac759cbe37
124	architectural_services	Architectural Services	\N	t	88900218-ab2a-4cba-8201-79ac759cbe37
125	engineering_services	Engineering Services	\N	t	88900218-ab2a-4cba-8201-79ac759cbe37
126	laboratories	Laboratories	\N	t	ee9d04b3-dd20-4051-96dd-52fee7a98e0a
127	biotech_research	Biotech Research	\N	t	ee9d04b3-dd20-4051-96dd-52fee7a98e0a
128	environmental_research	Environmental Research	\N	t	ee9d04b3-dd20-4051-96dd-52fee7a98e0a
\.


--
-- Data for Name: target_cities; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.target_cities (id, city_name, state, status) FROM stdin;
\.


--
-- Data for Name: target_services; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.target_services (id, name, category) FROM stdin;
\.


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.topics (id, sub_industry_id, topic_name, keyword_root, description, active) FROM stdin;
\.


--
-- Data for Name: trend_topics; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.trend_topics (id, topic, topic_id, industry_id, sub_industry_id, trend_score, meta, last_seen_at, create_at, updated_at, source, status) FROM stdin;
\.


--
-- Data for Name: viral_patterns; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.viral_patterns (id, name, description, prompt_template, content_type, industry_scope) FROM stdin;
\.


--
-- Data for Name: writing_personas; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.writing_personas (id, name, description, style_notes, default_industries, active) FROM stdin;
\.


--
-- Name: AR_Tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."AR_Tenants_id_seq"', 4, true);


--
-- Name: AR_Tenants_niche_snapshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."AR_Tenants_niche_snapshots_id_seq"', 1, false);


--
-- Name: ai_calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.ai_calls_id_seq', 1, false);


--
-- Name: audience_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.audience_profiles_id_seq', 1, false);


--
-- Name: banned_phrases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.banned_phrases_id_seq', 1, false);


--
-- Name: business_intel_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.business_intel_reports_id_seq', 1, true);


--
-- Name: content_outputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.content_outputs_id_seq', 21, true);


--
-- Name: content_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.content_requests_id_seq', 8, true);


--
-- Name: content_silos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.content_silos_id_seq', 1, false);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 1302, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 365, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 58, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 4, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 17, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 1122, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: experience_snippets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.experience_snippets_id_seq', 1, false);


--
-- Name: fact_candidates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.fact_candidates_id_seq', 1, false);


--
-- Name: image_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.image_assets_id_seq', 1, false);


--
-- Name: intel_debug_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.intel_debug_id_seq', 1, false);


--
-- Name: intel_provenance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.intel_provenance_id_seq', 1, false);


--
-- Name: kb_chunks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.kb_chunks_id_seq', 1, false);


--
-- Name: kb_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.kb_documents_id_seq', 1, false);


--
-- Name: keyword_opportunities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.keyword_opportunities_id_seq', 1, false);


--
-- Name: knowledge_base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.knowledge_base_id_seq', 4, true);


--
-- Name: learning_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.learning_queue_id_seq', 1, false);


--
-- Name: niche_snapshots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.niche_snapshots_id_seq', 6, true);


--
-- Name: seo_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.seo_audit_id_seq', 1, false);


--
-- Name: seo_enrichment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.seo_enrichment_id_seq', 1, false);


--
-- Name: silo_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.silo_nodes_id_seq', 1, false);


--
-- Name: sub_industries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.sub_industries_id_seq', 129, true);


--
-- Name: target_cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.target_cities_id_seq', 1, false);


--
-- Name: target_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.target_services_id_seq', 1, false);


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.topics_id_seq', 1, false);


--
-- Name: trend_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.trend_topics_id_seq', 1, false);


--
-- Name: viral_patterns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.viral_patterns_id_seq', 1, false);


--
-- Name: writing_personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.writing_personas_id_seq', 1, false);


--
-- Name: AR_Tenants_niche_snapshots AR_Tenants_niche_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."AR_Tenants_niche_snapshots"
    ADD CONSTRAINT "AR_Tenants_niche_snapshots_pkey" PRIMARY KEY (id);


--
-- Name: AR_Tenants AR_Tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."AR_Tenants"
    ADD CONSTRAINT "AR_Tenants_pkey" PRIMARY KEY (id);


--
-- Name: ai_calls ai_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.ai_calls
    ADD CONSTRAINT ai_calls_pkey PRIMARY KEY (id);


--
-- Name: audience_profiles audience_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.audience_profiles
    ADD CONSTRAINT audience_profiles_pkey PRIMARY KEY (id);


--
-- Name: banned_phrases banned_phrases_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.banned_phrases
    ADD CONSTRAINT banned_phrases_pkey PRIMARY KEY (id);


--
-- Name: business_intel_reports business_intel_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.business_intel_reports
    ADD CONSTRAINT business_intel_reports_pkey PRIMARY KEY (id);


--
-- Name: content_outputs content_outputs_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_outputs
    ADD CONSTRAINT content_outputs_pkey PRIMARY KEY (id);


--
-- Name: content_requests content_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_requests
    ADD CONSTRAINT content_requests_pkey PRIMARY KEY (id);


--
-- Name: content_silos content_silos_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_silos
    ADD CONSTRAINT content_silos_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: experience_snippets experience_snippets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.experience_snippets
    ADD CONSTRAINT experience_snippets_pkey PRIMARY KEY (id);


--
-- Name: fact_candidates fact_candidates_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.fact_candidates
    ADD CONSTRAINT fact_candidates_pkey PRIMARY KEY (id);


--
-- Name: image_assets image_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.image_assets
    ADD CONSTRAINT image_assets_pkey PRIMARY KEY (id);


--
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (id);


--
-- Name: intel_debug intel_debug_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.intel_debug
    ADD CONSTRAINT intel_debug_pkey PRIMARY KEY (id);


--
-- Name: intel_provenance intel_provenance_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.intel_provenance
    ADD CONSTRAINT intel_provenance_pkey PRIMARY KEY (id);


--
-- Name: kb_chunks kb_chunks_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.kb_chunks
    ADD CONSTRAINT kb_chunks_pkey PRIMARY KEY (id);


--
-- Name: kb_documents kb_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.kb_documents
    ADD CONSTRAINT kb_documents_pkey PRIMARY KEY (id);


--
-- Name: keyword_opportunities keyword_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.keyword_opportunities
    ADD CONSTRAINT keyword_opportunities_pkey PRIMARY KEY (id);


--
-- Name: knowledge_base knowledge_base_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.knowledge_base
    ADD CONSTRAINT knowledge_base_pkey PRIMARY KEY (id);


--
-- Name: learning_queue learning_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.learning_queue
    ADD CONSTRAINT learning_queue_pkey PRIMARY KEY (id);


--
-- Name: niche_snapshots niche_snapshots_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.niche_snapshots
    ADD CONSTRAINT niche_snapshots_pkey PRIMARY KEY (id);


--
-- Name: seo_audit seo_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seo_audit
    ADD CONSTRAINT seo_audit_pkey PRIMARY KEY (id);


--
-- Name: seo_enrichment seo_enrichment_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seo_enrichment
    ADD CONSTRAINT seo_enrichment_pkey PRIMARY KEY (id);


--
-- Name: silo_nodes silo_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.silo_nodes
    ADD CONSTRAINT silo_nodes_pkey PRIMARY KEY (id);


--
-- Name: sub_industries sub_industries_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.sub_industries
    ADD CONSTRAINT sub_industries_pkey PRIMARY KEY (id);


--
-- Name: target_cities target_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.target_cities
    ADD CONSTRAINT target_cities_pkey PRIMARY KEY (id);


--
-- Name: target_services target_services_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.target_services
    ADD CONSTRAINT target_services_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: trend_topics trend_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.trend_topics
    ADD CONSTRAINT trend_topics_pkey PRIMARY KEY (id);


--
-- Name: viral_patterns viral_patterns_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.viral_patterns
    ADD CONSTRAINT viral_patterns_pkey PRIMARY KEY (id);


--
-- Name: writing_personas writing_personas_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.writing_personas
    ADD CONSTRAINT writing_personas_pkey PRIMARY KEY (id);


--
-- Name: directus_activity_timestamp_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX directus_activity_timestamp_index ON public.directus_activity USING btree ("timestamp");


--
-- Name: directus_revisions_activity_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX directus_revisions_activity_index ON public.directus_revisions USING btree (activity);


--
-- Name: directus_revisions_parent_index; Type: INDEX; Schema: public; Owner: directus
--

CREATE INDEX directus_revisions_parent_index ON public.directus_revisions USING btree (parent);


--
-- Name: AR_Tenants_niche_snapshots ar_tenants_niche_snapshots_ar_tenants_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."AR_Tenants_niche_snapshots"
    ADD CONSTRAINT ar_tenants_niche_snapshots_ar_tenants_id_foreign FOREIGN KEY ("AR_Tenants_id") REFERENCES public."AR_Tenants"(id) ON DELETE SET NULL;


--
-- Name: AR_Tenants_niche_snapshots ar_tenants_niche_snapshots_niche_snapshots_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."AR_Tenants_niche_snapshots"
    ADD CONSTRAINT ar_tenants_niche_snapshots_niche_snapshots_id_foreign FOREIGN KEY (niche_snapshots_id) REFERENCES public.niche_snapshots(id) ON DELETE SET NULL;


--
-- Name: AR_Tenants ar_tenants_snapshots_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."AR_Tenants"
    ADD CONSTRAINT ar_tenants_snapshots_foreign FOREIGN KEY (snapshots) REFERENCES public.niche_snapshots(id) ON DELETE SET NULL;


--
-- Name: content_outputs content_outputs_request_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_outputs
    ADD CONSTRAINT content_outputs_request_id_foreign FOREIGN KEY (request_id) REFERENCES public.content_requests(id) ON DELETE SET NULL;


--
-- Name: content_requests content_requests_forget_audience_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_requests
    ADD CONSTRAINT content_requests_forget_audience_foreign FOREIGN KEY (forget_audience) REFERENCES public.audience_profiles(id) ON DELETE SET NULL;


--
-- Name: content_requests content_requests_industry_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_requests
    ADD CONSTRAINT content_requests_industry_foreign FOREIGN KEY (industry) REFERENCES public.industries(id) ON DELETE SET NULL;


--
-- Name: content_requests content_requests_style_persona_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_requests
    ADD CONSTRAINT content_requests_style_persona_id_foreign FOREIGN KEY (style_persona_id) REFERENCES public.writing_personas(id) ON DELETE SET NULL;


--
-- Name: content_requests content_requests_sub_industry_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.content_requests
    ADD CONSTRAINT content_requests_sub_industry_foreign FOREIGN KEY (sub_industry) REFERENCES public.sub_industries(id) ON DELETE SET NULL;


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_permissions directus_permissions_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_fkey FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: image_assets image_assets_request_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.image_assets
    ADD CONSTRAINT image_assets_request_id_foreign FOREIGN KEY (request_id) REFERENCES public.content_requests(id) ON DELETE SET NULL;


--
-- Name: knowledge_base knowledge_base_client_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.knowledge_base
    ADD CONSTRAINT knowledge_base_client_id_foreign FOREIGN KEY (client_id) REFERENCES public."AR_Tenants"(id) ON DELETE SET NULL;


--
-- Name: knowledge_base knowledge_base_file_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.knowledge_base
    ADD CONSTRAINT knowledge_base_file_foreign FOREIGN KEY (file) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: sub_industries sub_industries_industry_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.sub_industries
    ADD CONSTRAINT sub_industries_industry_foreign FOREIGN KEY (industry) REFERENCES public.industries(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict KT73vqqjTHyKNirYtTG8Xh4VpzEBJ0TFYFAQtnGngxWoR3MXSgu9YChQfjE0QnV

