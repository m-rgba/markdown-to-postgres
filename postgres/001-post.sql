CREATE TABLE IF NOT EXISTS post(
  id SERIAL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  publish_date DATE NOT NULL,
  PRIMARY KEY (id)
)