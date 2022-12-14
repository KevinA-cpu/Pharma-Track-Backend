import pkg from "pg";
const { Pool } = pkg;

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "pharma_track_dev",
  password: "root",
  port: 5432,
});

export default pool;
