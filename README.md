# Setup Archlinux


### Enabling reflector to run weekly

Copy the following content to /etc/xdg/reflector/reflector.conf

```conf
# Reflector configuration file for the systemd service.
#
# Empty lines and lines beginning with "#" are ignored.  All other lines should
# contain valid reflector command-line arguments. The lines are parsed with
# Python's shlex modules so standard shell syntax should work. All arguments are
# collected into a single argument list.
#
# See "reflector --help" for details.

# Recommended Options

# Set the output path where the mirrorlist will be saved (--save).
--save /etc/pacman.d/mirrorlist

# Select the transfer protocol (--protocol).
--protocol https

# Select the country (--country).
# Consult the list of available countries with "reflector --list-countries" and
# select the countries nearest to you or the ones that you trust. For example:
# --country France,Germany
--country Brazil,Argentina,Colombia,Paraguay,Uruguay,Chile,Ecuador,Mexico,Bolivia,Portugal,Poland,us

# Use only the  most recently synchronized mirrors (--latest).
--fastest 10

# Use the latest ones
--latest 10

# Sort the mirrors by synchronization time (--sort).
--sort rate
```

After that you can simply enable the service and the timer

`sudo systemctl enable reflector.timer reflector.service`

### Configure plymouth

On `/etc/default/grub`

Edit the `GRUB_CMDLINE_LINUX_DEFAULT` and add `splash` after `quiet`, like so:

```conf
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet splash mem_sleep_default=deep ..."
```

On `/etc/mkinitcpio.conf` edit the `HOOKS` and add the `plymouth` after `udev` like so:

```conf
HOOKS=(base udev plymouth autodetect modconf kms block filesystems resume encrypt keyboard fsck)
```

After that you can simply run:

`sudo grub-mkconfig -o /boot/grub/grub.cfg`

and

`sudo mkinitcpio -p linux-zen`

### Configuring xinput


Create a file called `00-keyboard.conf` on `/etc/X11/xorg.conf.d/` with the content below

```conf
Section "InputClass"
	Identifier "system-keyboard"
	MatchIsKeyboard "on"
	Option "XkbModel" "pc105"
	Option "XkbLayout" "us"
	Option "XkbOptions" "ctrl:nocaps"
EndSection
```


Create a file called `30-touchpad.conf` on `/etc/X11/xorg.conf.d/` with the content below

```conf
Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
	Option "Tapping" "on"
	Option "DisableWhileTyping" "1"
	Option "NaturalScrolling" "true"
EndSection
```

### Configure systemd-resolved

Run `ln -rsf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf`

Change the contents of the file with the following:

```conf
[Resolve]
# Some examples of DNS servers which may be used for DNS= and FallbackDNS=:
# Cloudflare: 1.1.1.1#cloudflare-dns.com 1.0.0.1#cloudflare-dns.com 2606:4700:4700::1111#cloudflare-dns.com 2606:4700:4700::1001#cloudflare-dns.com
# Google:     8.8.8.8#dns.google 8.8.4.4#dns.google 2001:4860:4860::8888#dns.google 2001:4860:4860::8844#dns.google
# Quad9:      9.9.9.9#dns.quad9.net 149.112.112.112#dns.quad9.net 2620:fe::fe#dns.quad9.net 2620:fe::9#dns.quad9.net
#DNS=
#FallbackDNS=1.1.1.1#cloudflare-dns.com 9.9.9.9#dns.quad9.net 8.8.8.8#dns.google 2606:4700:4700::1111#cloudflare-dns.com 2620:fe::9#dns.quad9.net 2001:4860:4860::8888#dns.google
DNS=<internal-ip>
FallbackDNS=1.1.1.1 1.0.0.1
#Domains=
DNSSEC=no
DNSOverTLS=no
MulticastDNS=no
LLMNR=no
Cache=yes
#CacheFromLocalhost=no
DNSStubListener=yes
#DNSStubListenerExtra=
ReadEtcHosts=yes
#ResolveUnicastSingleLabel=no
```

### Configure power-save mode networkmanager

Create a file called `10-power-save-mode.conf` on `/etc/NetworkManager/conf.d/` with the following content


```conf
[connection]
wifi.powersave = 2 # disable
```


### GNOME Keyring

Change `/etc/pam.d/login` with the following content

```
auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
password   include      system-local-login
```
