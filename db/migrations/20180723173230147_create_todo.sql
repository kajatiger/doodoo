-- +micrate Up
CREATE TABLE todos (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR,
  urgent BOOL,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS todos;
