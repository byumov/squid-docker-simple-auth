# Simple HTTP proxy with auth

A simple Dockerfile for launching an authenticated squid proxy.

## Usage

Just run container with `SQUID_USERNAME` and `SQUID_PASSWORD` env variables:

```bash
docker run -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar -p 3128:3128 byumov/squid-docker-simple-auth
```

And use proxy for requests:

```bash
export http_proxy="http://foo:bar@127.0.0.1:3128"
export https_proxy="http://foo:bar@127.0.0.1:3128"

curl -v -I https://www.google.com/

* Uses proxy env variable https_proxy == 'foo:bar@127.0.0.1:3111'
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to 127.0.0.1 (127.0.0.1) port 3111 (#0)
* allocate connect buffer!
* Establish HTTP proxy tunnel to www.google.com:443
* Proxy auth using Basic with user 'foo'
> CONNECT www.google.com:443 HTTP/1.1
> Host: www.google.com:443
> Proxy-Authorization: Basic Zm9vOmJhcg==
> User-Agent: curl/7.64.1
> Proxy-Connection: Keep-Alive
>
< HTTP/1.1 200 Connection established
HTTP/1.1 200 Connection established
```

## Details

### Environment variables

* SQUID_USERNAME
* SQUID_PASSWORD

### Ports

* 3128
