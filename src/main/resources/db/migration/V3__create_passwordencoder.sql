ALTER USER postgres WITH SUPERUSER;
CREATE extension IF NOT EXISTS pgcrypto;

UPDATE USR SET password = crypt(password, gen_salt('bf',8));