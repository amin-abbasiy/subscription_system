# Subscription System
    Subscription system
### ENV
Remove sample from 2 files `database.sample.yml`, `application.sample.yml`.

Then edit config files locates under `config`  files  `database.yml`, `application.yml`.

##### Put DB Config inside these variables:
`DATABASE_ADAPTER` 

`DATABASE_USERNAME`

`DATABASE_PASSWORD`

`DATABASE_NAME`

##### Put Application ENV inside these variables:

`GOOGLE_CLIENT_ID`

`GOOGLE_CLIENT_SECRET`

`GOOGLE_REDIRECT_URL`

`GOOGLE_SCOPES`

`GOOGLE_AUTH_URL`

`GOOGLE_TOKEN_URL`

## Installation

bundle:

```sh
% bundle install
```

Then run:

```sh
% rails s -b 0.0.0.0
```

##### Google Requirement for Oauth:

run ngrok server:

```sh
% ngrok http <port>
```

## Application

##### Organisation

For system organisations entity

##### User

System Individual and Organisations Users

##### AuthProvider

For Sign in with Google and Other OpenID Providers

##### Template

System template can create by Individual and Organisations

##### Section

Section is part of Template and have various kinds of sections like Text ListBox Attachment

##### Comment

Section Comments and Replies

##### Plan

Plan Entity for create subscriptions

##### Subscription

Individual and Organisations Subscriptions

##### Invoices

Created Invoices for Subscriptions Plans

##### Payment

Payment are issued for Invoices

##### Media

STI System for system files