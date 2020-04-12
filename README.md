# Simple HTTP proxy with auth

A simple Dockerfile for launching an authenticated squid proxy.

The user must specify authentication credentials via the following environment variables:

```bash
SQUID_USERNAME=foo
SQUID_PASSWORD=bar
```

An example invocation would be:

```bash
docker run -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar -p 3128:3128 byumov/squid-docker-simple-auth
```

## Details

### Environment variables

* SQUID_USERNAME
* SQUID_PASSWORD

### Ports

* 3128
