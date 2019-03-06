# 1. Virtualbox beállítások:

### 1.1 Klónozzuk (linkelt klón) az alap ubuntu szerverünket samba néven. 
### 1.2 A Virtualboxban telepített Ubuntu szerver számára állítsunk be egy darab bridge hálózati kártyát. 
### 1.3 Indítsuk el a samba nevű virtuális gépet
### 1.4 Az Ubuntuban a kártya dhcp kliensként csatlakozzon a tantermi hálózatra. 
### 1.5 Állapítsuk meg milyen IP címet kapott az Ubuntu szerver a tantermi  dhcp szervertől, ez lesz a "samba_IP" cím.

# 2. A virtuális szerver nevének beállítása samba névre

### 2.1 Írjuk át a /etc/hostname fájlban a szerverünk nevét server névről, samba névre:
sudo mcedit /etc/hostname

### 2.2 Írjuk át a /etc/hosts fájlban a "127.0.1.1 server" sort erre: "127.0.1.1 samba"
sudo mcedit /etc/hosts

# 3. Samba Telepítés

### 3.1 Az asztali gépünkön indítsunk el egy terminált és lépjunk be ssh kapcsolaton keresztül a samba nevű virtuális gépbe.

### 3.2 Telepítsük a smba servert:
sudo apt-get update
sudo apt-get install samba -y

# 4. Megosztásra használható mappák létrehozása:

### 4.1 Hozzunk létre kozos néven egy mappát, amit beállítunk mindenki számára olvasásra és írásra:
sudo mkdir /srv/kozos
sudo chmod 777 /srv/kozos

### 4.2 Hozzunk létre egy mappát, amit beállítunk mindenki számára csak olvasásra:
sudo mkdir /srv/readonly
sudo chmod 755 /srv/readonly

# 5. Megosztások konfigurálása:

### 5.1 Nyissuk meg a konfigurációs állományt:
sudo mcedit /etc/samba/smb.conf

### 5.2 Állítsuk be az általános, minden megosztás esetén érvényes beállításokat. 
### Ezek a [global] szakaszban találhatóak az  /etc/samba/smb.conf fájlban:
[global]
netbios name=samba
security=user
map to guest=bad user
workgroup = WORKGROUP
public=yes

### 5.3 A globális rész alá hozzuk létre a megosztási paramétereket a mappákhoz:
[kozos]
comment=nyilvános írható-olvasható megosztás
path=/srv/kozos
writeable=yes
read only=no
browseable=yes
guest ok=yes
public=yes

[readonly]
comment=nyilvános csak olvasható megosztás
path=/srv/readonly
read only=yes
browseable=yes
guest ok=yes
public=yes


# 6. Indítsuk újra a Samba szolgáltatást majd ellenőrizzük le:
sudo service smbd restart
sudo service smbd status

#### 6.1 Teszteljük a megosztások meglétét:
sudo testparm

# 7. Konkrét felhasználónak is adhatunk külön megosztást:

### 7.1. Felhasználó felvétele
sudo useradd user2 –c "user2" –g users –m –d /home/user2 –s /bin/bash

### 7.2 Jelszó megadása
sudo passwd user2 #adjuk meg a jelszót

### 7.3 Hozzunk létre egy mappát user2 felhasználó számára írás és olvasásra:
sudo mkdir /srv/user2
sudo chown user2 /srv/user2
sudo chmod 700 /srv/user2

### 7.4 Nyissuk meg a konfigurációs állományt.
sudo mcedit /etc/samba/smb.conf

### 7.5 A fájl végére az alábbiakat gépeljük be:
[user2]
comment=írható-olvasható megosztás a user2 felhasználónak
path=/srv/user2
writeable=yes
browseable=no
public=no
read list=user2
writelist=user2
force directory mode=0777
force create mode=0777

### 7.6 Vegyük fel a user2 felhasználót a Samba adatbázisba:
sudo smbpasswd -a user2 #adjuk meg a jelszót: hallgato

### 7.7 Indítsuk újra a szolgáltatást.
sudo service smbd restart

#########################################################################################################

# 8. SAMBA szerver elérése kliensről


