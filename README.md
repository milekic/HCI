# HCI — Aplikacija za prodaju drvenog građevinskog materijala

## 📌 Opis projekta
Ovo je desktop aplikacija razvijena u WPF-u koja omogućava jednostavno upravljanje prodajom drvenog građevinskog materijala.  
Aplikacija je razvijena u sklopu univerzitetskog projekta i prati **MVVM** arhitekturu radi lakšeg održavanja i proširivosti.  

Cilj projekta je pružiti intuitivno i responzivno korisničko okruženje za rad sa proizvodima, kupcima i računima, uz podršku za više jezika.

---

## ✨ Glavne funkcionalnosti
- **Podrška za različite tipove korisnika. U trenutnoj verziji postje naloyi za dva tipa korisnika: Medadžer i Radnik.
- **Pregled aktivnih proizvoda uz mogućnost uklanjanja proizvoda, dodavanja novog i izmjene postojeceg proizvoda.
- **Pregled računa i pretraga izdatih računa po JMB radnika koji je izdao račun.
- **Pregled i kreiranje nove narudžbe.
- **Višejezična podrška** (srpski / engleski)
- **Moderni UI** sa Material Design temom
- **Validacija unosa** pomoću WPF binding-a i MVVM principa

---

## ✨ Opis rada
Prilikom prijave na aplikaciju korisnik unosi svoj JMB i ime. Ako je korisnik "Menadžer" može koristiti sljedeće funkcionalnosti: "Pregled aktivnih proizvoda", 
"Pregled računa" i "Pregled narudžbi".
U sekciji "Aktivni proizvodi" može pregledati trenutno aktivne proizvode, ukloniti neki od proizvoda, izmijeniti cijenu ili dodati novi proizvod. Prilikom dodavanja 
novog proizvoda unosi naziv vrste proizvoda, vrstu drveta i cijenu proizvoda. 
Sekcija "Pregled računa" omogućava pregled računa po datumu izdavanja i po JMB trgovca koji je izdao račun.
Sekcija "Narudžbe" omogućava pregled svih do sada kreiranih narudžbi kao i dodavanje nove narudžbe. Prilikom dodavanja nove narudžbe automatski se popunjava polje za datum, 
a menadžer unosi naziv dobavljača i svoj JMB. 
Korisnik "Radnik" ima mogućnost pregleda izdatih računa. 
Moguć je odabir srpskog ili engleskog jezika za oba tipa korisnika. 

---

## 🛠️ Tehnologije
- **WPF** (.NET 7)
- **C#**
- **MVVM** arhitektura
- **Material Design in XAML Toolkit** za moderni izgled aplikacije
- **MySQL** baza podataka
- **ResX Resource Files** za internacionalizaciju

---

## 🚀 Pokretanje projekta
1. **Preuzmite repozitorijum**  
   ```bash
   git clone https://github.com/<korisnicko_ime>/HCI.git
