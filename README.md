Fake - Game API
===============

Presentation
------------

This project is a simple API you could use to try API processes.

Installation
------------

```bash
git clone https://github.com/jponcy/fake-game-api
npm install
```

Run
---

Run ```bash npm run start:dev ```. Then the server will be available on http://localhost:3000/ (by default). See ```bash npm run json-server --help ``` for more details about options.

Example of use:
```bash
fetch('http://localhost:3000/games?_page=1&_limit=3')
    .then(r => r.json())
    .then(console.log)
```
