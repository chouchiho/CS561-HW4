"use strict"

var express = require('express')
var app = express()

app.listen(3030)
console.log('Node.js Express server id is running on port 3030...')

app.get('/data/2.5/weather', get_weather)

function get_weather(request, response) {
    response.json({
    "coord": {
      "lon": -123.262,
      "lat": 44.5646
    },
    "weather": [
      {
        "id": 803,
        "main": "Clouds",
        "description": "broken clouds",
        "icon": "04d"
      }
    ],
    "base": "stations",
    "main": {
      "temp": 293.52,
      "feels_like": 293.47,
      "temp_min": 290.98,
      "temp_max": 294.82,
      "pressure": 1022,
      "humidity": 71
    },
    "visibility": 10000,
    "wind": {
      "speed": 4.63,
      "deg": 300
    },
    "clouds": {
      "all": 75
    },
    "dt": 1664497468,
    "sys": {
      "type": 2,
      "id": 2005452,
      "country": "US",
      "sunrise": 1664460511,
      "sunset": 1664503079
    },
    "timezone": -25200,
    "id": 5720727,
    "name": "Corvallis",
    "cod": 200
  })
}