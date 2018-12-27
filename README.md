# Szerverek és felhőszolgáltatások gyakorlat tantárgy (31 hét)
##### (279 óra win és Linux)
##### heti 4 óra: 124 óra Linux
##### heti 3 óra:  93 óra Linux

            19.3.2. Linux kiszolgáló telepítése és üzemeltetése
1. A szerver hardver konfigurálása
1. A futási szintek beállítása, alapértelmezett futási szint beállítása, váltás a futási szintek között
1. A rendszer leállítása, újraindítása parancssorból
1. A lemezek partícionálása (a fájlrendszer és a swap terület elválasztása)
1. A boot manager telepítése és beállítása
1. Megosztott könyvtárak telepítése
1. Különböző csomagkezelők használata, a függőségek kezelése
1. Programok telepítése forrásból
1. A parancssor és héj használata (shell parancsok, a shell környezet konfigurálása, egyszerű szkriptek írása)
1. Parancssori szűrők használata, szöveges fájlok kezelése
1. Fájlok és könyvtárak kezelése (másolás, áthelyezés, törlés, helyettesítő karakterek, fájltulajdonságok lekérdezése, módosítása)
1. Folyamatok kezelése (előtérben, háttérben futtatás, folyamatok monitorozása, jel küldése folyamatnak)
1. Folyamatok futási prioritásának módosítása
1. Szövegfeldolgozás reguláris kifejezések segítségével
1. Egyszerű szövegszerkesztési lépések (pl. vi editor alapszolgáltatásai)
1. Fájlrendszer monitorozása, egyszerű hibák elhárítása
1. Fájlhozzáférések és lemezkvóták kezelése
1. Hardlink és szimbolikus link létrehozása, törlése
1. X Window System, képernyőkezelők használata; bejelentkezés a grafikus rendszerbe, a grafikus környezet kiválasztása
1. Időzített rendszerfelügyeleti beállítások (cron)
1. Nyomtatási sor kezelése, általános nyomtatási hibaelhárítás
1. Hálózati címek beállítása, hálózati alapszolgáltatások használata (ftp, telnet, ssh, ping, dig, traceroute, tracepath)
1. Címfordítással kapcsolatos beállítások
1. Hálózati hibaelhárítás
1. Névfeloldás működése, beállításai
1. Kétkulcsos titkosítása használata a biztonságos adattovábbításban (OpenSSH, GnuPG, X11 tunnels)
1. Forgalomirányítási beállítások
1. A rendszer biztonsági mentése, részleges és teljes mentés készítése, és rendszer visszaállítása ezekből
1. Apache webszerver telepítése, konfigurálása
1. Adatbázis kiszolgáló telepítése és üzemeltetése
1. Tűzfal és proxy szolgáltatások beállítása (pl. iptables, squid, ACL, kliensazonosítás)
1. Levelezési szolgáltatások alapbeállításai (SMTP protokoll, postfix, sendmail, exim, POP3, IMAP)
<br>

            19.3.3. Linux és Windows alapú rendszerek integrációja
1. A különböző operációs rendszereket futtató gépek multiboot rendszerének beállítása
1. Samba szolgáltatás beállítása Linux szerveren Windows kliensek kiszolgálására
1. LDAP szolgáltatás beállítása Linuxon az Active Directory használatához
1. Exchange szerver elérése Linuxon futtatott POP3, IMAP kliensek segítségével
<br>

            19.3.4. Felhőszolgáltatások
1. A privát felhő, a nyilvános felhő és a hibrid felhő jellemzői
–	Népszerű SaaS megoldások (Onedrive, Dropbox, O365, stb.) kezelése
–	Ismerkedés a publikus felhőszolgáltatások portál megoldásaival
–	PaaS alapszolgáltatások konfigurálása (adatbázisok, webszerverek)
–	Hálózat, tárolás és virtuális gépek az IaaS-ban 
–	A publikus felhőszolgáltatás címtármegoldásai (AAD)
1. Virtuális gépek létrehozása és menedzselése
–	Virtuális gépek és virtuálisgép-sablonok 
–	Virtuális lemezek
–	Virtuális hálózatok; hibrid felhőmegoldások – VPN
–	Magas rendelkezésre állás biztosítása
–	Biztonsági mentés
–	Active Directory a felhőben – Azure Active Directory
1. Adattárolás a felhőben
–	Adatlemezek
–	Fájlmegosztás
–	Menedzselt adattárolási megoldások
–	Adatbázisok


#### FELADATOK
1. Meghatározza a hálózati kiszolgáló funkciójának és várható terhelésének megfelelő fizikai vagy infrastruktúra szolgáltatásként elérhető hardvert
2. Redundanciát és magas rendelkezésre állást biztosító tároló rendszert telepít és konfigurál
3. Kiválasztja a működési körülményeknek legmegfelelőbb hálózati operációs rendszer változatot, illetve disztribúciót
4. Windows és Linux kiszolgáló operációs rendszert telepít, ennek keretében partícionálja a merevlemezt, kiválasztja és létrehozza a fájlrendszert
5. Telepíti az operációs rendszer biztonsági frissítéseit, eszközmeghajtó programokat szerez be és telepít, kernelt konfigurál és fordít
6. Feltelepíti és beállítja a boot manager-t, testreszabja az indítási folyamatot, beállítja a rendszer futási szintjét és megfelelő módon leállítja, illetve újraindítja a kiszolgálót
7. Rendszerösszetevők és alkalmazások telepítéséhez csomagkezelő rendszert használ
8. Gondoskodik a különböző szerepkörök, tulajdonságok és szolgáltatások telepítéséről, kezeléséről, beállítja a szolgáltatások indításának módját
9. Hálózati címtárszolgáltatást telepít, konfigurál és üzemeltet; felhasználókat és csoportokat hoz létre, jelszókezelést végez; hálózati csoportházirendet tervez meg és alkalmaz
10. Hálózati fájl- és nyomtató szolgáltatást telepít és konfigurál, beálltja a megosztásokat; lemezkvótát állít be a felhasználók számára, beállítja a fájlrendszer jogosultsági és tulajdonosi rendszerét
11.Testreszabja és használja a shell környezetet, egyszerűbb feladatok megoldására scripteket készít, ütemezett feladatkezelést végez
12. Hálózati operációs rendszeren működő dinamikus forgalomirányítási protokollt telepít és konfigurál
13. DHCP és DNS kiszolgálót telepít és konfigurál
14. Web kiszolgálói feladatokat biztosító hálózati szolgáltatást telepít és konfigurál, virtuális web kiszolgálót és virtuális könyvtárat hoz létre
15. FTP, e-mail és adatbázis kiszolgálót telepít és konfigurál
16. Biztonságos távoli elérést biztosító szolgáltatást telepít és konfigurál
17. Beállítja a szoftveres tűzfalat és az egyéb fejlett biztonsági funkciókat, hálózati hozzáférés-védelmet telepít és állít be
18. Hálózati mentési és visszaállítási feladatot tervez meg és hajt végre
19. Monitorozza és felügyeli a hálózati operációs rendszer és az ügyfelek működését, naplózási beállításokat végez, naplófájlokat elemez
20. Virtualizációs környezetet telepít, virtuális munkaállomásokat és kiszolgálókat telepít
21. Felügyeli, monitorozza és optimalizálja a virtuális munkakörnyezetben üzemelő számítógépek működését
22. Egymással együttműködő és egymást kiegészítő funkciójú Windows és Linux kiszolgálót egyaránt tartalmazó rendszert tervez, konfigurál és üzemeltet
23. Privát-, nyilvános- és hibrid felhőszolgáltatásokat használ, konfigurál és tart karban
Betartja a munka-, baleset-, tűz- és környezetvédelmi, valamint a távközlési szakmára vonatkozó előírásokat

#### SZAKMAI ISMERETEK
1. Hálózati operációsrendszerek telepítési módjai
2. Tárolórendszerek típusai működési elvük
3. Címtárszolgáltatáshoz tartozó fogalmak
4. Csoportházirend fogalma
5. Magas rendelkezésre állás biztosítása
6. Hálózati címzés és címkiosztás (IPv4 és IPv6 címzés)
7. Szoftveres tűzfal és egyéb biztonsági beállítások
8. DNS alapok
9. Távoli elérést biztosító technológiák
10. Hálózati hozzáférést szabályozó technológiák
11 .Nyomtató kiszolgálás
12. Fájl kiszolgálás
13. Web- és FTP kiszolgálás
14. E-mail kiszolgálás
15. Adatbázis kiszolgálás
16. Hálózat felügyelet és a hibaelhárítás
17. Virtualizált környezet és hálózat, illetve virtuális gépek telepítése és beállítása
18. Privát felhő, nyilvános felhő, hibrid felhő jellemzői
19. Szoftver szolgáltatás (Software as a Service), platform szolgáltatás (Platform as a Service), infrastruktúra szolgáltatás (Infrastructure as a Service)
20. Munka-, baleset-, tűz- és környezetvédelmi előírások

#### SZAKMAI KÉSZSÉGEK
1. Bináris számrendszer használata
2. IP-címzés
3. Angol nyelvű, olvasott szakmai szöveg megértése és felhasználása

#### SZEMÉLYES KOMPETENCIÁK
1. Precizitás
2. Megbízhatóság
3. Önállóság

#### TÁRSAS KOMPETENCIÁK
1. Együttműködés
2. Kezdeményezőkészség
3. Prezentációs készség

#### MÓDSZERKOMPETENCIÁK
1. Logikus gondolkodás
2. Hibakeresés (diagnosztizálás)
3. Problémamegoldás, hibaelhárítás

