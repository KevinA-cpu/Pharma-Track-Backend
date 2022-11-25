import Express from "express";
import staffRouter from "./src/staff/routes.js";
import appointmentRouter from "./src/appointment/routes.js";
const App = Express();

App.use(Express.json());

App.get("/", (req, res) => {
  res.send("placholder");
});

App.use("/api/v1/staff", staffRouter);

App.use("/api/v1/appointment", appointmentRouter);

App.listen(3000, () => console.log(`App is listening on 3000`));
