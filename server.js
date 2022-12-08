import Express from "express";
import staffRouter from "./src/staff/routes.js";
import appointmentRouter from "./src/appointment/routes.js";
import doctortimeRouter from "./src/doctortime/routes.js";
const App = Express();

App.use(Express.json());

App.get("/", (req, res) => {
  res.send("placeholder");
});

App.use("/api/v1/staff", staffRouter);

App.use("/api/v1/appointment", appointmentRouter);

App.use("/api/v1/doctortime", doctortimeRouter);

App.listen(3000, () => console.log(`App is listening on 3000`));
