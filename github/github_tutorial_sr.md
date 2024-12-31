# GitHub Туторијал за Програмере
> Свеобухватни водич за коришћење GitHub-а за контролу верзија и тимски рад

## Садржај
> Брза навигација кроз секције туторијала

1. [Почетак рада са GitHub-ом](#почетак-рада)
2. [Основне Git команде](#основне-команде)
3. [Рад са Репозиторијумима](#рад-са-репозиторијумима)
4. [Процес Сарадње](#процес-сарадње)
5. [Најбоље Праксе](#најбоље-праксе)
6. [Напредне Теме](#напредне-теме)
7. [Напредне Git Технике](#напредне-git-технике)
8. [Напредне GitHub Функције](#напредне-github-функције)
9. [Тимски Рад и Преглед Кода](#тимски-рад-и-преглед-кода)
10. [Сигурност и Најбоље Праксе](#сигурност-и-најбоље-праксе)
11. [Опоравак од Грешака](#опоравак-од-грешака)
12. [Git за Посебне Случајеве](#git-за-посебне-случајеве)

## Почетак Рада
> Основно подешавање и конфигурација за почетак рада са GitHub-ом

### Објашњења Команди Линију по Линију

```bash
git config --global user.name "Ваше Име"
# Поставља ваше име за све Git репозиторијуме на вашем рачунару
# Опција --global чини да се ово подешавање примени на све репозиторијуме
# Замените "Ваше Име" вашим стварним именом

git config --global user.email "vas.email@primer.com"
# Поставља вашу е-пошту за све Git репозиторијуме
# Треба да се поклапа са вашом GitHub е-поштом
# Користи се за повезивање commit-а са вашим GitHub налогом

git init
# Креира нови Git репозиторијум у тренутном директоријуму
# Иницијализује .git фолдер за праћење промена
# Потребно само једном по пројекту

git clone [url]
# Креира копију удаљеног репозиторијума на вашем локалном рачунару
# Преузима све фајлове и историју
# Аутоматски подешава праћење удаљеног репозиторијума
```

### Основне Команде
Есенцијалне Git команде које ћете користити свакодневно:
```bash
git init                    # Иницијализација новог репозиторијума
git clone [url]            # Клонирање репозиторијума
git add [file]            # Додавање фајлова у staging
git commit -m "порука"     # Commit промена
git push                   # Push промена на remote
git pull                   # Pull промена са remote-а
```

## Рад са Репозиторијумима
### Креирање Новог Репозиторијума
1. Кликните на "New" на GitHub-у
2. Попуните детаље репозиторијума
3. Иницијализујте са README ако је потребно
4. Клонирајте на локалну машину:
```bash
git clone https://github.com/korisnickoime/repozitorijum.git
```

### Отпремање Постојећег Пројекта
```bash
cd vas-projekat
git init
git add .
git commit -m "Иницијални commit"
git remote add origin https://github.com/korisnickoime/repozitorijum.git
git push -u origin main
```

## Процес Сарадње
### Стратегија Гранања
```bash
git checkout -b feature/nova-funkcija    # Креирање нове гране
git push -u origin feature/nova-funkcija # Push гране
```

### Pull Requests
1. Креирајте грану
2. Направите измене
3. Push-ујте измене
4. Отворите Pull Request на GitHub-у
5. Затражите ревизију
6. Спојите након одобрења

### Процес Прегледа Кода
- Прегледајте измене кода
- Оставите конструктивне коментаре
- Затражите измене ако је потребно
- Одобрите када је спремно
- Спојите pull request

## Најбоље Праксе
1. Пишите јасне commit поруке
2. Држите commit-е атомским и фокусираним
3. Редовно pull-ујте да останете ажурни
4. Користите смислена имена грана
5. Документујте измене кода
6. Прегледајте пре спајања

## Напредне Теме
### Git Flow
- main/master грана за продукцију
- develop грана за развој
- feature гране за нове функције
- hotfix гране за хитне поправке

### Решавање Конфликата
```bash
git pull origin main
# Решите конфликте у фајловима
git add .
git commit -m "Решени конфликти"
git push
```

### GitHub Actions
- Аутоматизовани workflow-и
- Континуирана интеграција
- Аутоматизовано тестирање
- Deployment pipeline-и

### Сигурност
- Користите SSH кључеве
- Омогућите 2FA
- Прегледајте дозволе приступа
- Одржавајте зависности ажурним

## Напредне Git Технике
### Интерактивни Rebase
Моћан алат за ревизију историје commit-а:
```bash
# Интерактивно уређивање последња 3 commit-а
git rebase -i HEAD~3

# Rebase на одређену грану
git rebase -i main
```

Уобичајене rebase команде:
- `pick`: задржи commit
- `reword`: промени поруку commit-а
- `edit`: паузирај за измене
- `squash`: споји са претходним commit-ом
- `drop`: уклони commit

### Git Hooks
Аутоматизоване скрипте за различите Git догађаје:

```bash
# Пример pre-commit hook-а (.git/hooks/pre-commit)
#!/bin/sh
npm run lint
npm test

# Спречи commit ако тестови не прођу
if [ $? -ne 0 ]; then
    echo "Тестови нису прошли. Commit прекинут."
    exit 1
fi
```

### Подмодули и Подстабла
Управљање зависностима пројекта:
```bash
# Додавање подмодула
git submodule add https://github.com/user/repo external/module

# Ажурирање подмодула
git submodule update --init --recursive

# Додавање подстабла
git subtree add --prefix external/lib https://github.com/user/lib main --squash
```

## Напредне GitHub Функције

### GitHub CLI
Рад са GitHub-ом преко командне линије:
```bash
# Инсталација
winget install GitHub.cli

# Аутентификација
gh auth login

# Креирање PR-а
gh pr create --title "Нова функција" --body "Опис"

# Управљање проблемима
gh issue list
gh issue create
```

### Примери GitHub Actions Workflow-а

#### Континуирана Интеграција
```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Подешавање Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '16'
        
    - name: Инсталација Зависности
      run: npm ci
      
    - name: Покретање Тестова
      run: npm test
```

#### Аутоматско Креирање Release-а
```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - name: Креирање Release-а
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ github.ref }}
        release_name: Release ${{ github.ref }}
        draft: false
        prerelease: false
```

## Тимски Рад и Преглед Кода

### Чеклиста за Преглед Кода
1. **Архитектура**
   - Да ли се измена уклапа у општу архитектуру?
   - Да ли су зависности одговарајуће?

2. **Квалитет Кода**
   - Да ли је код DRY (Don't Repeat Yourself)?
   - Да ли прати пројектне стандарде?
   - Да ли су променљиве и функције смислено именоване?

3. **Тестирање**
   - Да ли постоји довољно тестова?
   - Да ли су покривени гранични случајеви?
   - Да ли су тестови читљиви и одрживи?

4. **Документација**
   - Да ли су измене документоване?
   - Да ли су сложени алгоритми објашњени?
   - Да ли је API документација ажурна?

### Правила Заштите Грана
Подешавање заштите грана:
1. Отворите подешавања репозиторијума
2. Изаберите "Branches"
3. Додајте правило за main грану
4. Препоручена подешавања:
   - Захтевај прегледе pull request-а
   - Одбаци застареле pull request прегледе
   - Захтевај пролазак провера статуса
   - Захтевај да гране буду ажурне
   - Укључи администраторе

## Сигурност и Најбоље Праксе

### Обезбеђивање Тајни
```bash
# Пример .gitignore
.env
secrets/
*.key
config.private.json

# Коришћење GitHub Secrets
secrets.API_KEY
secrets.DATABASE_URL
```

### Git-LFS за Велике Фајлове
```bash
# Инсталација Git LFS
git lfs install

# Праћење типова фајлова са LFS
git lfs track "*.psd"
git lfs track "*.zip"

# Провера LFS статуса
git lfs status
```

### Одржавање Репозиторијума
```bash
# Оптимизација репозиторијума
git gc --aggressive

# Проналажење великих објеката
git rev-list --objects --all | grep -f <(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{print $1}')

# Чишћење удаљених грана
git remote prune origin
```

## Опоравак од Грешака

### Опоравак Commit-а
```bash
# Проналажење избрисаног commit-а
git reflog

# Враћање commit-а
git cherry-pick [commit-hash]

# Грана у одређеном тренутку
git checkout -b опоравак master@{1.day.ago}
```

### Опоравак Фајлова
```bash
# Један фајл из commit-а
git checkout [commit-hash] -- путања/до/фајла

# Сви фајлови из commit-а
git checkout [commit-hash] .

# Фајл из друге гране
git checkout друга-грана -- путања/до/фајла
```

### Хитне Команде
```bash
# Привремено чување промена
git stash save "WIP: опис"

# Поништи последњи commit (задржи промене)
git reset --soft HEAD^

# Одбаци све локалне промене
git reset --hard HEAD

# Ресетуј грану на удаљену
git reset --hard origin/main
```

## Git за Посебне Случајеве

### Управљање Monorepo-м
```bash
# Селективно преузимање
git sparse-checkout set путања/до/поддиректоријума

# Плитко клонирање
git clone --depth 1 repository-url

# Делимично клонирање
git clone --filter=blob:none repository-url
```

### Git за CI/CD
```bash
# Верзионисање тагова
git tag -a v1.0.0 -m "Release Верзија 1.0.0"
git push origin v1.0.0

# Креирање release гране
git checkout -b release/1.0.0 main
git push -u origin release/1.0.0
```

Увек направите резервну копију вашег рада и будите опрезни са force командама!

# GitHub Туторијал за Програмере
> Свеобухватни водич за коришћење GitHub-а за контролу верзија и тимски рад

## Садржај
> Брза навигација кроз секције туторијала

1. [Почетак рада са GitHub-ом](#почетак-рада)
2. [Основне Git команде](#основне-команде)
3. [Рад са Репозиторијумима](#рад-са-репозиторијумима)
4. [Процес Сарадње](#процес-сарадње)
5. [Најбоље Праксе](#најбоље-праксе)
6. [Напредне Теме](#напредне-теме)
7. [Напредне Git Технике](#напредне-git-технике)
8. [Напредне GitHub Функције](#напредне-github-функције)
9. [Тимски Рад и Преглед Кода](#тимски-рад-и-преглед-кода)
10. [Сигурност и Најбоље Праксе](#сигурност-и-најбоље-праксе)
11. [Опоравак од Грешака](#опоравак-од-грешака)
12. [Git за Посебне Случајеве](#git-за-посебне-случајеве)

## Почетак Рада
> Основно подешавање и конфигурација за почетак рада са GitHub-ом

### Објашњења Команди Линију по Линију

```bash
git config --global user.name "Ваше Име"
# Поставља ваше име за све Git репозиторијуме на вашем рачунару
# Опција --global чини да се ово подешавање примени на све репозиторијуме
# Замените "Ваше Име" вашим стварним именом

git config --global user.email "vas.email@primer.com"
# Поставља вашу е-пошту за све Git репозиторијуме
# Треба да се поклапа са вашом GitHub е-поштом
# Користи се за повезивање commit-а са вашим GitHub налогом

git init
# Креира нови Git репозиторијум у тренутном директоријуму
# Иницијализује .git фолдер за праћење промена
# Потребно само једном по пројекту

git clone [url]
# Креира копију удаљеног репозиторијума на вашем локалном рачунару
# Преузима све фајлове и историју
# Аутоматски подешава праћење удаљеног репозиторијума
```

### Основне Команде
Есенцијалне Git команде које ћете користити свакодневно:
```bash
git init                    # Иницијализација новог репозиторијума
git clone [url]            # Клонирање репозиторијума
git add [file]            # Додавање фајлова у staging
git commit -m "порука"     # Commit промена
git push                   # Push промена на remote
git pull                   # Pull промена са remote-а
```

## Рад са Репозиторијумима
### Креирање Новог Репозиторијума
1. Кликните на "New" на GitHub-у
2. Попуните детаље репозиторијума
3. Иницијализујте са README ако је потребно
4. Клонирајте на локалну машину:
```bash
git clone https://github.com/korisnickoime/repozitorijum.git
```

### Отпремање Постојећег Пројекта
```bash
cd vas-projekat
git init
git add .
git commit -m "Иницијални commit"
git remote add origin https://github.com/korisnickoime/repozitorijum.git
git push -u origin main
```

## Процес Сарадње
### Стратегија Гранања
```bash
git checkout -b feature/nova-funkcija    # Креирање нове гране
git push -u origin feature/nova-funkcija # Push гране
```

### Pull Requests
1. Креирајте грану
2. Направите измене
3. Push-ујте измене
4. Отворите Pull Request на GitHub-у
5. Затражите ревизију
6. Спојите након одобрења

### Процес Прегледа Кода
- Прегледајте измене кода
- Оставите конструктивне коментаре
- Затражите измене ако је потребно
- Одобрите када је спремно
- Спојите pull request

## Најбоље Праксе
1. Пишите јасне commit поруке
2. Држите commit-е атомским и фокусираним
3. Редовно pull-ујте да останете ажурни
4. Користите смислена имена грана
5. Документујте измене кода
6. Прегледајте пре спајања

## Напредне Теме
### Git Flow
- main/master грана за продукцију
- develop грана за развој
- feature гране за нове функције
- hotfix гране за хитне поправке

### Решавање Конфликата
```bash
git pull origin main
# Решите конфликте у фајловима
git add .
git commit -m "Решени конфликти"
git push
```

### GitHub Actions
- Аутоматизовани workflow-и
- Континуирана интеграција
- Аутоматизовано тестирање
- Deployment pipeline-и

### Сигурност
- Користите SSH кључеве
- Омогућите 2FA
- Прегледајте дозволе приступа
- Одржавајте зависности ажурним

## Напредне Git Технике
### Интерактивни Rebase
Моћан алат за ревизију историје commit-а:
```bash
# Интерактивно уређивање последња 3 commit-а
git rebase -i HEAD~3

# Rebase на одређену грану
git rebase -i main
```

Уобичајене rebase команде:
- `pick`: задржи commit
- `reword`: промени поруку commit-а
- `edit`: паузирај за измене
- `squash`: споји са претходним commit-ом
- `drop`: уклони commit

### Git Hooks
Аутоматизоване скрипте за различите Git догађаје:

```bash
# Пример pre-commit hook-а (.git/hooks/pre-commit)
#!/bin/sh
npm run lint
npm test

# Спречи commit ако тестови не прођу
if [ $? -ne 0 ]; then
    echo "Тестови нису прошли. Commit прекинут."
    exit 1
fi
```

### Подмодули и Подстабла
Управљање зависностима пројекта:
```bash
# Додавање подмодула
git submodule add https://github.com/user/repo external/module

# Ажурирање подмодула
git submodule update --init --recursive

# Додавање подстабла
git subtree add --prefix external/lib https://github.com/user/lib main --squash
```

## Напредне GitHub Функције

### GitHub CLI
Рад са GitHub-ом преко командне линије:
```bash
# Инсталација
winget install GitHub.cli

# Аутентификација
gh auth login

# Креирање PR-а
gh pr create --title "Нова функција" --body "Опис"

# Управљање проблемима
gh issue list
gh issue create
```

### Примери GitHub Actions Workflow-а

#### Континуирана Интеграција
```yaml
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v2
    
    - name: Подешавање Node.js
      uses: actions/setup-node@v2
      with:
        node-version: '16'
        
    - name: Инсталација Зависности
      run: npm ci
      
    - name: Покретање Тестова
      run: npm test
```

#### Аутоматско Креирање Release-а
```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    
    - name: Креирање Release-а
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ github.ref }}
        release_name: Release ${{ github.ref }}
        draft: false
        prerelease: false
```

## Тимски Рад и Преглед Кода

### Чеклиста за Преглед Кода
1. **Архитектура**
   - Да ли се измена уклапа у општу архитектуру?
   - Да ли су зависности одговарајуће?

2. **Квалитет Кода**
   - Да ли је код DRY (Don't Repeat Yourself)?
   - Да ли прати пројектне стандарде?
   - Да ли су променљиве и функције смислено именоване?

3. **Тестирање**
   - Да ли постоји довољно тестова?
   - Да ли су покривени гранични случајеви?
   - Да ли су тестови читљиви и одрживи?

4. **Документација**
   - Да ли су измене документоване?
   - Да ли су сложени алгоритми објашњени?
   - Да ли је API документација ажурна?

### Правила Заштите Грана
Подешавање заштите грана:
1. Отворите подешавања репозиторијума
2. Изаберите "Branches"
3. Додајте правило за main грану
4. Препоручена подешавања:
   - Захтевај прегледе pull request-а
   - Одбаци застареле pull request прегледе
   - Захтевај пролазак провера статуса
   - Захтевај да гране буду ажурне
   - Укључи администраторе

## Сигурност и Најбоље Праксе

### Обезбеђивање Тајни
```bash
# Пример .gitignore
.env
secrets/
*.key
config.private.json

# Коришћење GitHub Secrets
secrets.API_KEY
secrets.DATABASE_URL
```

### Git-LFS за Велике Фајлове
```bash
# Инсталација Git LFS
git lfs install

# Праћење типова фајлова са LFS
git lfs track "*.psd"
git lfs track "*.zip"

# Провера LFS статуса
git lfs status
```

### Одржавање Репозиторијума
```bash
# Оптимизација репозиторијума
git gc --aggressive

# Проналажење великих објеката
git rev-list --objects --all | grep -f <(git verify-pack -v .git/objects/pack/*.idx | sort -k 3 -n | tail -10 | awk '{print $1}')

# Чишћење удаљених грана
git remote prune origin
```

## Опоравак од Грешака

### Опоравак Commit-а
```bash
# Проналажење избрисаног commit-а
git reflog

# Враћање commit-а
git cherry-pick [commit-hash]

# Грана у одређеном тренутку
git checkout -b опоравак master@{1.day.ago}
```

### Опоравак Фајлова
```bash
# Један фајл из commit-а
git checkout [commit-hash] -- путања/до/фајла

# Сви фајлови из commit-а
git checkout [commit-hash] .

# Фајл из друге гране
git checkout друга-грана -- путања/до/фајла
```

### Хитне Команде
```bash
# Привремено чување промена
git stash save "WIP: опис"

# Поништи последњи commit (задржи промене)
git reset --soft HEAD^

# Одбаци све локалне промене
git reset --hard HEAD

# Ресетуј грану на удаљену
git reset --hard origin/main
```

## Git за Посебне Случајеве

### Управљање Monorepo-м
```bash
# Селективно преузимање
git sparse-checkout set путања/до/поддиректоријума

# Плитко клонирање
git clone --depth 1 repository-url

# Делимично клонирање
git clone --filter=blob:none repository-url
```

### Git за CI/CD
```bash
# Верзионисање тагова
git tag -a v1.0.0 -m "Release Верзија 1.0.0"
git push origin v1.0.0

# Креирање release гране
git checkout -b release/1.0.0 main
git push -u origin release/1.0.0
```

Увек направите резервну копију вашег рада и будите опрезни са force командама!

# GitHub Туторијал за Програмере
> Свеобухватни водич за коришћење GitHub-а за контролу верзија и тимски рад

## Садржај
> Брза навигација кроз секције туторијала

1. [Почетак рада са GitHub-ом](#почетак-рада)
2. [Основне Git команде](#основне-команде)
3. [Рад са Репозиторијумима](#рад-са-репозиторијумима)
4. [Процес Сарадње](#процес-сарадње)
5. [Најбоље Праксе](#најбоље-праксе)
6. [Напредне Теме](#напредне-теме)
7. [Напредне Git Технике](#напредне-git-технике)
8. [Напредне GitHub Функције](#напредне-github-функције)
9. [Тимски Рад и Преглед Кода](#тимски-рад-и-преглед-кода)
10. [Сигурност и Најбоље Праксе](#сигурност-и-најбоље-праксе)
11. [Опоравак од Грешака](#опоравак-од-грешака)
12. [Git за Посебне Случајеве](#git-за-посебне-случајеве)

## Почетак Рада
> Основно подешавање и конфигурација за почетак рада са GitHub-ом

### Објашњења Команди Линију по Линију

```bash
git config --global user.name "Ваше Име"
# Поставља ваше име за све Git репозиторијуме на вашем рачунару
# Опција --global чини да се ово подешавање примени на све репозиторијуме
# Замените "Ваше Име" вашим стварним именом

git config --global user.email "vas.email@primer.com"
# Поставља вашу е-пошту за све Git репозиторијуме
# Треба да се поклапа са вашом GitHub е-поштом
# Користи се за повезивање commit-а са вашим GitHub налогом

git init
# Креира нови Git репозиторијум у тренутном директоријуму
# Иницијализује .git фолдер за праћење промена
# Потребно само једном по пројекту

git clone [url]
# Креира копију удаљеног репозиторијума на вашем локалном рачунару
# Преузима све фајлове и историју
# Аутоматски подешава праћење удаљеног репозиторијума
```

### Основне Команде
Есенцијалне Git команде које ћете користити свакодневно:
```bash
git init                    # Иницијализација новог репозиторијума
git clone [url]            # Клонирање репозиторијума
git add [file]            # Додавање фајлова у staging
git commit -m "порука"     # Commit промена
git push                   # Push промена на remote
git pull                   # Pull промена са remote-а
```

## Рад са Репозиторијумима
### Креирање Новог Репозиторијума
1. Кликните на "New" на GitHub-у
2. Попуните детаље репозиторијума
3. Иницијализујте са README ако је потребно
4. Клонирајте на локалну машину:
```bash
git clone https://github.com/korisnickoime/repozitorijum.git
```

### Отпремање Постојећег Пројекта
```bash
cd vas-projekat
git init
git add .
git commit -m "Иницијални commit"
git remote add origin https://github.com/korisnickoime/repozitorijum.git
git push -u origin main
```

## Процес Сарадње
### Стратегија Гранања
```bash
git checkout -b feature/nova-funkcija    # Креирање нове гране
git push -u origin feature/nova-funkcija # Push гране
```

### Pull Requests
1. Креирајте грану
2. Направите измене
3. Push-ујте измене
4. Отворите Pull Request на GitHub-у
5. Затражите ревизију
6. Спојите након одобрења

### Процес Прегледа Кода
- Прегледајте измене кода
- Оставите конструктивне коментаре
- Затражите измене ако је потребно
- Одобрите када је спремно
- Спојите pull request

## Најбоље Праксе
1. Пишите јасне commit поруке
2. Држите commit-е атомским и фокусираним
3. Редовно pull-ујте да останете ажурни
4. Користите смислена имена грана
5. Документујте измене кода
6. Прегледајте пре спајања

## Напредне Теме
### Git Flow
- main/master грана за продукцију
- develop грана за развој
- feature гране за нове функције
- hotfix гране за хитне поправке

### Решавање Конфликата
```bash
git pull origin main
# Решите конфликте у фајловима
git add .
git commit -m "Решени конфликти"
git push
```

### GitHub Actions
- Аутоматизовани workflow-и
- Континуирана интеграција
- Аутоматизовано тестирање
- Deployment pipeline-и

### Сигурност
- Користите SSH кључеве
- Омогућите 2FA
- Прегледајте дозволе приступа
- Одржавајте зависности ажурним

## Напредне Git Технике
### Интерактивни Rebase
Моћан алат за ревизију историје commit-а: