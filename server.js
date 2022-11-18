import Express from "express";

const App = Express();

App.use(Express.json());

App.get("/", (req, res) => {
  res.send("placholder");
});

App.listen(3000, () => console.log(`App is listening on 3000`));
