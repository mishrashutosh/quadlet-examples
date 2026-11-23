example3.com {
	encode
	reverse_proxy systemd-{host}:80
}
