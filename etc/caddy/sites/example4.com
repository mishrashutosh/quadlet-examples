example4.com {
    encode
	reverse_proxy systemd-{host}:8080
}
