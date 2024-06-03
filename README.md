# My commands dump

- # Git Configuration

To set up your Git configurations, use the following commands:

```bash
git config --global user.name "excreal1"
git config --global user.email "148652451+excreal1@users.noreply.github.com"
git config --global credential.helper store
```

- # Wifi 5g Fix
```
iwlist wlo1 freq
sudo iwconfig wlo1 freq 5.7G

or 

nmcli device wifi rescan
nmcli device wifi list
nmcli device wifi connect 78:45:58:78:2F:C3
nmcli connection modify UoNWIFI 802-11-wireless.band "a"
```