# home-net-stack
A Docker stack of services to monitor and troubleshoot your home network


<img width="926" alt="image" src="https://user-images.githubusercontent.com/10532778/114069750-a0354600-989f-11eb-8954-6049c2c36d53.png">


If you want to run the pi-hole container on a Linux host you'll need to first disable the resolved service:
```bash
sudo systemctl disable systemd-resolved.service
sudo systemctl stop systemd-resolved.service
```

Traefik requires to set up a DNS service for the different endpoints. You can use an external provider or you can use pi-hole and manually map each endpoint to your server's IP address.

To bring the stack up run:
```bash
./network_stack.sh up
```

To bring the stack down run:
```bash
./network_stack.sh down
```

You can add/remove services from the stack by commenting out lines from the list of containers in the `./network_stack.sh` script.

Login for grafana:
```bash
user: admin
password: mypass
```

Login for pi-hole:
```bash
password: mypass
```
