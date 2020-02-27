# Numbers to Portuguese

The purpose of this project is to translate a given number into Portuguese, from -99999 to 99999.

## For local run

* You must install Ruby version 2.7.0

* Clone this repository

* run `bundle install` for dependencies install

* run `rails start` to start a local server

## For docker run

* `docker-compose up`

## Usage

* Since it's a API only, you can use cURL or similar to test the app out. e.g. `curl 0.0.0.0:3000/-12345`

## Run test suite

* run `rails test`