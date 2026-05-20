import express from "express";

const PORT = process.env.PORT;
const app = express();

app.get("/", (req, res) => {
  return res.json({
    success: true,
    message: "Hello world k8s",
  });
});

app.listen(PORT, () => {
  console.log(`server is running on ${PORT}`);
});
