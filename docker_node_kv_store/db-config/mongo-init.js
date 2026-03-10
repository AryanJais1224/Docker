db = db.getSiblingDB(process.env.KEY_VALUE_DB);

db.createUser({
  user: process.env.KEY_VALUE_USER,
  pwd: process.env.KEY_VALUE_PASSWORD,
  roles: [{ role: 'readWrite', db: process.env.KEY_VALUE_DB }],
});

db.createCollection('keys');
