# 🎵 PlayMusic

Aplicação multiplataforma desenvolvida em Flutter para gerenciamento e organização de bibliotecas musicais.

Projeto acadêmico desenvolvido para a disciplina **Desenvolvimento Multiplataforma Desktop** do curso de **Análise e Desenvolvimento de Sistemas — UNINTER**.

---

## 👩‍🎓 Dados acadêmicos

**Aluna:** Desyree N. Garcia Batista  
**RU:** 986134  
**Curso:** Análise e Desenvolvimento de Sistemas  
**Disciplina:** Desenvolvimento Multiplataforma Desktop  
**Instituição:** UNINTER  

---

## 🎯 Objetivo

O PlayMusic foi desenvolvido com o objetivo de facilitar o gerenciamento de músicas cadastradas pelo usuário, permitindo organização, pesquisa e visualização de informações de forma simples.

A aplicação foi construída utilizando Flutter, permitindo funcionamento em diferentes plataformas e armazenamento local utilizando SQLite.

---

## 🎼 Recursos disponíveis

O sistema disponibiliza:

- Inclusão de músicas
- Alteração de músicas cadastradas
- Exclusão de registros
- Pesquisa dinâmica
- Filtro por gênero musical
- Estatísticas da biblioteca
- Dashboard inicial
- Tema claro e escuro
- Persistência local
- Tela informativa sobre o projeto

---

## ⚙ Tecnologias e bibliotecas

Tecnologias utilizadas durante o desenvolvimento:

| Ferramenta | Utilização |
|---|---|
| Flutter | Interface e estrutura |
| Dart | Linguagem principal |
| SQLite | Banco de dados local |
| SharedPreferences | Salvar preferências |
| fl_chart | Estatísticas |
| Material Design 3 | Componentes visuais |

---

## 🗂 Organização do projeto

```text
lib/
├── database/
├── models/
├── pages/
├── widgets/
└── main.dart
```

---

## 💻 Execução

Instalar dependências:

```bash
flutter pub get
```

Executar:

```bash
flutter run
```

Windows:

```bash
flutter run -d windows
```

---

## 📊 Situação atual

✔ CRUD implementado  
✔ Banco SQLite funcional  
✔ Pesquisa dinâmica  
✔ Filtro por gênero  
✔ Dashboard interativo  
✔ Estatísticas musicais  
✔ Tema claro e escuro com salvamento automático  

---

## 📦 Plataformas suportadas

O projeto pode ser executado em diferentes plataformas:

- Windows
- Android
- Web

---

## 📦 Versões compiladas

As versões compiladas do projeto podem ser geradas para facilitar testes e execução da aplicação sem a necessidade de abrir o ambiente de desenvolvimento Flutter.

Para gerar os arquivos compilados utilize os seguintes comandos:

### Windows

```bash
flutter build windows
```

Arquivo gerado em:

```text
build/windows/x64/runner/Release/
```

### Android

```bash
flutter build apk --release
```

Arquivo gerado em:

```text
build/app/outputs/flutter-apk/
```

---

As compilações foram geradas e testadas durante o desenvolvimento do projeto.

---

## 🔗 GitHub

https://github.com/desyreegarcia/playmusic