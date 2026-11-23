example1.com {
    root /srv/{host}-wp-app/_data
    encode

    php_fastcgi {host}-wp-app:9000 {
        root /var/www/html
    }

    file_server {
        precompressed
    }
}
