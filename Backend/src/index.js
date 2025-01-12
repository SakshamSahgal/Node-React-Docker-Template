require("dotenv").config()
const port = process.env.BACKEND_PORT || 8080
const { app } = require("./app");
const path = require('path');

app.listen(port, () => {
  console.log(`My Server running on port ${port}`)
})

app.get("/api/health", (req, res) => {
  res.status(200).send("Health OK");
})

//this route is used to serve the react app
//it should be the last route because it is a catch all route, so if no other route is matched then this route is used
//this is done so that the react app can handle the routing, and the server doesn't interfere with it

app.get("*", (req, res) => {
  res.sendFile(path.join(__dirname, "..", 'build', 'index.html'));
});
