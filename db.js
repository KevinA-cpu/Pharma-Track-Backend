import pkg from "pg";
const { Pool } = pkg;

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "students",
  password: "root",
  port: 5432,
});

export default pool;
