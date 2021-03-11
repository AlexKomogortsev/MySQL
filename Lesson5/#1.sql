UPDATE users 
SET created_at = NULL,
    updated_at = NULL
WHERE id > 0;

UPDATE users 
SET created_at = now(),
    updated_at = now()
WHERE id > 0;
