# docker-nginx-stream

A variant of the official nginx image. Loads TCP proxy/load balancing config files from a dedicated folder.

This dedicated folder is `/etc/nginx/stream.d/`. A volume can be mounted there if desired, for easy access to the config files and to preserve the configuration if the container is destroyed/updated.

The nginx.conf file is modified to include the following:

```nginx
stream {
    include /etc/nginx/stream.d/*.conf;
}
```

Simply add .conf files to the `stream.d` directory and they will be loaded. An example config file is provided below:

```nginx
server {
    listen     12345;

    # Forward SSH TCP traffic to the desired destination and port
    proxy_pass 192.168.1.101:22;
}
```

More advanced configuration is possible, [check](http://nginx.org/en/docs/stream/ngx_stream_core_module.html) the [documentation](https://docs.nginx.com/nginx/admin-guide/load-balancer/tcp-udp-load-balancer/) & look at some tutorials.
