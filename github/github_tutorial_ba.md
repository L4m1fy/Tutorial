# GitHub Tutorijal za Programere
> Sveobuhvatni vodič za korištenje GitHub-a za kontrolu verzija i timski rad

## Sadržaj
> Brza navigacija kroz sekcije tutorijala

1. [Početak rada sa GitHub-om](#pocetak-rada)
2. [Osnovne Git komande](#osnovne-komande)
3. [Rad sa Repozitorijima](#rad-sa-repozitorijima)
4. [Proces Saradnje](#proces-saradnje)
5. [Najbolje Prakse](#najbolje-prakse)
6. [Napredne Teme](#napredne-teme)
7. [Napredne Git Tehnike](#napredne-git-tehnike)
8. [Napredne GitHub Funkcije](#napredne-github-funkcije)
9. [Timski Rad i Pregled Koda](#timski-rad-i-pregled-koda)
10. [Sigurnost i Najbolje Prakse](#sigurnost-i-najbolje-prakse)
11. [Oporavak od Grešaka](#oporavak-od-grešaka)
12. [Git za Posebne Slučajeve](#git-za-posebne-slučajeve)

## Početak Rada
> Osnovno podešavanje i konfiguracija za početak rada sa GitHub-om

### Objašnjenja Komandi Liniju po Liniju

```bash
git config --global user.name "Vaše Ime"
# Postavlja vaše ime za sve Git repozitorije na vašem računaru
# Opcija --global čini da se ovo podešavanje primijeni na sve repozitorije
# Zamijenite "Vaše Ime" vašim stvarnim imenom

git config --global user.email "vas.email@primjer.com"
# Postavlja vašu e-poštu za sve Git repozitorije
# Treba da se poklapa sa vašom GitHub e-poštom
# Koristi se za povezivanje commit-a sa vašim GitHub računom

git init
# Kreira novi Git repozitorij u trenutnom direktoriju
# Inicijalizira .git folder za praćenje promjena
# Potrebno samo jednom po projektu

git clone [url]
# Kreira kopiju udaljenog repozitorija na vašem lokalnom računaru
# Preuzima sve fajlove i historiju
# Automatski podešava praćenje udaljenog repozitorija
```

### Razumijevanje Tri Git Stabla
> Git održava tri "stabla" u svom redovnom radu:

1. **Radni Direktorij**
   - Sadrži vaše stvarne fajlove
   - Gdje pravite izmjene
   - Nepraćeno od strane Git-a dok se ne doda

2. **Staging Oblast (Indeks)**
   - Oblast pripreme za commit-e
   - Fajlovi se ovdje "stage-aju" prije commit-a
   - Omogućava selektivne commit-e

3. **Repozitorij (HEAD)**
   - Sadrži sve commit-ovane promjene
   - Trajna historija
   - Može se dijeliti sa drugima

## Napredni Koncepti Rada

### Strategija Upravljanja Granama
> Detaljno objašnjenje strategija grananja za različite veličine projekata

#### Za Male Projekte
```bash
main (ili master)
  └── grane za funkcije
      └── ispravke grešaka
```
- Jednostavan, direktan pristup
- Pogodno za samostalne programere ili male timove
- Brza implementacija promjena

#### Za Srednje Projekte
```bash
main
  └── develop
      ├── feature/*
      ├── bugfix/*
      └── hotfix/*
```
- Strukturiraniji pristup
- Odvojen razvojni i produkcijski kod
- Bolje za timove od 5-10 programera

#### Za Velike Projekte
```bash
main
  ├── develop
  │   ├── feature/*
  │   ├── bugfix/*
  │   └── release/*
  └── hotfix/*
```
- Puna GitFlow implementacija
- Pogodno za velike timove
- Podržava više izdanja

### Najbolje Prakse za Commit Poruke
> Pisanje jasnih i korisnih commit poruka

#### Struktura
```
<tip>(<opseg>): <naslov>

<tijelo>

<podnožje>
```

#### Tipovi
- `feat`: Nova funkcionalnost
- `fix`: Ispravka greške
- `docs`: Izmjene dokumentacije
- `style`: Formatiranje, nedostajući zarezi, itd.
- `refactor`: Restrukturiranje koda
- `test`: Dodavanje testova
- `chore`: Zadaci održavanja

#### Primjer
```
feat(auth): implementacija OAuth2 prijave

- Dodat OAuth2 tok autentifikacije
- Kreiran middleware za prijavu
- Dodato upravljanje korisničkom sesijom

Zatvara #123
```

## Napredne Git Operacije

### Operacije sa Stash-om
```bash
git stash save "WIP: opis funkcionalnosti"
# Privremeno čuva sve modificirane praćene fajlove
# WIP = Work In Progress (Rad u toku)
# Opis pomaže u kasnijoj identifikaciji

git stash list
# Prikazuje sve sačuvane promjene
# Format: stash@{n}: WIP na grani: poruka

git stash pop
# Primjenjuje najnoviji stash i uklanja ga iz liste
# Može izazvati konflikte ako se promjene preklapaju

git stash apply stash@{n}
# Primjenjuje određeni stash ali ga zadržava u listi
# Korisno kada želite da primijenite iste promjene više puta
```

### Napredne Strategije Spajanja
```bash
git merge --strategy-option=theirs
# Automatski rješava konflikte zadržavanjem dolazećih promjena
# Korisno kada više vjerujete dolazećim promjenama

git merge --no-ff
# Kreira merge commit čak i kada je moguć fast-forward
# Održava eksplicitnu historiju grane funkcionalnosti

git merge --squash
# Kombinuje sve promjene u jedan commit
# Korisno za čišćenje historije grane funkcionalnosti
```

### Rebase Operacije
```bash
git rebase -i HEAD~3
# Interaktivni rebase zadnja 3 commit-a
# Otvara editor za manipulaciju commit-ima

git rebase --onto main feature bugfix
# Premješta bugfix granu na main, isključujući feature commit-e
# Korisno za promjenu baze grane
```

## GitHub Specifične Funkcije

### Šabloni za Pull Request
```markdown
# Pull Request Šablon
## Opis
[Opišite napravljene izmjene i zašto]

## Tip Izmjene
- [ ] Ispravka greške
- [ ] Nova funkcionalnost
- [ ] Breaking change
- [ ] Ažuriranje dokumentacije

## Testiranje
- [ ] Unit testovi dodati/ažurirani
- [ ] Integracioni testovi dodati/ažurirani
- [ ] Manualno testiranje izvršeno

## Checklista
- [ ] Kod prati stil projekta
- [ ] Dokumentacija ažurirana
- [ ] Testovi prolaze lokalno
```

### Napredni Primjeri GitHub Actions

#### Testiranje na Više Platformi
```yaml
name: Cross-Platform Tests

on: [push, pull_request]

jobs:
  test:
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
        node: [14, 16, 18]
    
    runs-on: ${{ matrix.os }}
    
    steps:
      - uses: actions/checkout@v2
      
      - name: Podešavanje Node.js
        uses: actions/setup-node@v2
        with:
          node-version: ${{ matrix.node }}
          
      - name: Instalacija Zavisnosti
        run: npm ci
        
      - name: Pokretanje Testova
        run: npm test
```

### Uvidi u Repozitorij
> Razumijevanje GitHub analitičkih alata

#### Frekvencija Koda
- Prikazuje dodavanja i brisanja tokom vremena
- Pomaže u praćenju brzine projekta
- Identificira periode visoke aktivnosti

#### Mrežni Graf
- Vizualizira odnose grana
- Prikazuje tok commit-a
- Pomaže u razumijevanju obrazaca spajanja

#### Pregled Sigurnosti
- Ranjivosti zavisnosti
- Upozorenja skeniranja koda
- Status skeniranja tajni

## Najbolje Prakse za Timsku Saradnju

### Etiketa Pregleda Koda
1. **Za Pregledače**
   - Budite konstruktivni i specifični
   - Objasnite zašto su potrebne promjene
   - Predložite rješenja kada je moguće
   - Brzo odgovorite na preglede

2. **Za Autore**
   - Držite PR-ove fokusiranim i malim
   - Objasnite kontekst i odluke
   - Odgovorite na sve komentare
   - Ažurirajte PR na osnovu povratnih informacija

### Standardi Dokumentacije
1. **README.md Struktura**
   ```markdown
   # Ime Projekta
   
   ## Pregled
   Kratak opis
   
   ## Instalacija
   Uputstvo korak po korak
   
   ## Upotreba
   Primjeri koda
   
   ## Doprinos
   Smjernice
   
   ## Licenca
   Uslovi
   ```

2. **Komentari u Kodu**
   ```javascript
   /**
    * Opis funkcije
    * @param {Tip} imeParametra - Opis parametra
    * @returns {Tip} Opis povratne vrijednosti
    * @throws {TipGreške} Opis greške
    */
   ```

Uvijek napravite rezervnu kopiju vašeg rada i budite oprezni sa force komandama!