const express = require('express'); // import the express dependency

const app = express(); // create the app
// Look for port from the environment variables.
// or use the fallback port
const port = process.env.PORT ?? 3500;

// Create a route to handle `/` and return `Hello World!` in the response.
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Start the HTTP router on the given port.
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

// Handle the exit signal and quit the process.
process.on('SIGINT', function() {
  process.exit();
});
