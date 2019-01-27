# Virtualbox beállítások:

# 1. Klónozzuk (linkelt klón) az alap ubuntu szerverünket samba néven. 

# A Virtualboxban telepített Ubuntu szerver számára állítsunk be egy darab bridge hálózati kártyát. 

# Indítsuk el a samba nevű virtuális gépet

# Az Ubuntuban a kártya dhcp kliensként csatlakozzon a tantermi hálózatra. Állapítsuk meg milyen IP címet kapott az Ubuntu szerver a tantermi  dhcp szervertől.

# Az asztali gépünkön indítsunk el egy terminált és lépjunk be ssh kapcsolaton keresztül a samba nevű virtuális gépbe.

# Samba Telepítés

sudo apt-get update
sudo apt-get install samba -y

# Mappák létrehozása:

# Hozzunk létre egy mappát, amit megosztunk mindenki számára írás és olvasásra:
sudo mkdir /srv/kozos
sudo chmod 777 /srv/kozos

# Hozzunk létre egy mappát, amit megosztunk mindenki számára csak olvasásra:
sudo mkdir /srv/kozos2
sudo chmod 755 /srv/kozos2

# Megosztások létrehozása:

# Nyissuk meg a konfigurációs állományt:
sudo mcedit /etc/samba/smb.conf

# Az általános, minden megosztás esetén érvényes beállításokkal kezdjük. Ezek a [global] szakaszban találhatóak az  /etc/samba/smb.conf fájlban:
[global]
netbios name=ubuntu-szerver
security=user
map to guest=bad user
workgroup = WORKGROUP
public=yes

# A globális rész alá hozzuk létre a megosztási paramétereket a mappákhoz:
[kozos]
comment=nyilvános írható-olvasható megosztás
path=/srv/kozos
writeable=yes
read only=no
browseable=yes
guest ok=yes
public=yes
[kozos2]
comment=nyilvános csak olvasható megosztás
path=/srv/kozos2
read only=yes
browseable=yes
guest=ok
public=yes

# Mentsük el a konfigurációs állományt (midnight commanderben: F2, F10)

# Indítsuk újra a Samba szolgáltatást majd ellenőrizzük le:
sudo service smbd restart
sudo service smbd status

# Teszteljük a megosztások meglétét:
sudo testparm

# Konkrét felhasználónak is adhatunk külön megosztást:

# 1. Felhasználó felvétele
sudo useradd user2 –c „User2” –g users –m –d /home/user2 –s /bin/bash

# 2. Jelszó megadása
sudo passwd user2 adjuk meg a jelszót

# Hozzunk létre egy mappát User2 felhasználó számára írás és olvasásra:
sudo mkdir /srv/user2
sudo chown user2 /srv/user2
sudo chmod 700 /srv/user2

# Nyissuk meg a konfigurációs állományt.
sudo mcedit /etc/samba/smb.conf

# A fájl végére az alábbiakat gépeljük be:
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

# Mentsük el a konfigurációs állományt (F2, F10)
# Vegyük fel a „User2” felhasználót a Samba adatbázisba:
sudo smbpasswd -a User2, adjuk meg a jelszót

# Indítsuk újra a szolgáltatást.
sudo service smbd restart

# SAMBA telepítése és konfigurálása a KLIENSEN

# Hozzunk létre egy könyvtárat, ide fogjuk felcsatolni az ubuntu-server által megosztott mappát.
sudo mkdir /mnt/user2

# Az asztali Ubuntu operációs rendszert futtató virtuális gépen telepítsük fel a megosztás eléréséhez szükséges csomagokat:
apt-get update
apt-get install cifs-utils

# Hajtsuk végre a felcsatolást:
mount.cifs //192.168.1.2/user2 /mnt/user2 -o username=user2,password=hallgato

# Lépjünk be a könyvtárba, és hozzunk létre ott egy új szöveges állományt. Lépjünk ki a könyvtárból,majd csatoljuk azt le.
umount /mnt/megosztas2

# Ha azt szeretnénk, hogy minden indításkor automatikusan csatolódjon fel a könyvtár, akkor az /etc/fstab állományba egy új sort kell írnunk. Ehhez nyissuk meg az állományt.
mcedit /etc/fstab

# Helyezzük el a következő sort (egyetlen sorba írva, és a sor végén az Enter-t lenyomva):
//192.168.1.2/sambamegosztas /mnt/megosztas2 cifs username=hallgato,password=hallgato

# Mentsük el az állományt, majd próbáljuk ki a beállítást. Indítsuk újra a virtuális gépet az automatikus felcsatolás ellenőrzése érdekében.
# A kozos és a kozos2 megosztás felcsatolásához nincs szükség hitelesítésre:
mount.cifs //192.168.1.2/kozos /mnt/kozos
mount.cifs //192.168.1.2/kozos2 /mnt/kozos2

# Ezután indítsunk el egy Windows operációs rendszerű gépet (megfelelő hálózatba tegyük, és az IP címe is a megadott hálózatba tartozzon), és csatoljuk fel egy meghajtóként az ubuntu-server által megosztott könyvtárakat.
# A megosztás elérési útja (gépnév helyett az IP cím is jó):
\\ubuntu-server\kozos
\\192.168.1.2\kozos2
\\192.168.1.2\user2
