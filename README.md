# 📱Aula - 27/01/2026

# Volta às Aulas

## 📅 Data
Hoje foi nossa aula de volta às aulas.

## 📚 Conteúdos Abordados
Durante a aula, conversamos e praticamos vários pontos importantes para o início do ano letivo.

### 📌 Regras da Aula
- Falamos sobre as regras gerais da sala  
- Organização, respeito e responsabilidade  

### 👤 Criação de Usuário Administrador
- Aprendemos a criar um usuário com permissões de administrador  
- Entendemos a importância dessas permissões para o desenvolvimento  

### 💻 Visual Studio Code (VS Code)
- Fizemos o download do VS Code  
- Conectamos e configuramos o ambiente  

### 🖥️ Git Bash
- Baixamos o Git Bash  
- Aprendemos a conectar e utilizar  
- Vinculamos o Git Bash com o VS Code  

### 🤝 Live Share
- Conhecemos uma nova extensão chamada **Live Share**  
- Utilizamos para compartilhar o código em tempo real  

### 📁 Terminal
- Criamos pastas utilizando o terminal  
- Criamos o arquivo **README.md** pelo terminal  

## ✅ Conclusão
A aula foi focada em organização, ferramentas de desenvolvimento e configuração do ambiente, preparando tudo para as próximas aulas práticas.

# 📱Aula - 03/02/2026

# Introdução ao Desenvolvimento Mobile

### Tipo de Desenvolvimento

- Nativo
    - Android:
        - SDK : Android SDK
        - IDE : Android Studio
        - Linguagens : Kotlin e Java
        - Ambientes : Mac, Win, Linux

    - IOS:
        - SDK : Cocoa Touch
        - IDE : Xcode
        - Linguagens : Swift / Objectype-C
        - Ambientes: Mac

- Multiplataforma
    - React Native :
        - SDK : Node.JS
        - IDE : VSCode, outros
        - Linguagens : JavaScript / TypeScript
        - Ambientes : Mac, Win, Linux

    - Flutter
        - SDK : Flutter SDK
        - IDE : VSCode, Android Studio
        - Linguagens : Dart
        - Ambientes : Mac, Win, Linux

## Preparação do Ambiente de Desenvolvimento

### Instalação do FlutterSDK
- download do arquivo ZIP na página flutter.dev
- inclusão do flutter na pasta C:\src
- inclusão do flutter\bin nas variáveis de ambiente
- teste o flutter --version

### Instalação do AndroidSDK
- download do Android SDK - Command Line Tools
- adicionar o Command-line ao C:\src\AndroidSDK
- Adicionar o SDKManaer as variáveis de Ambiente
- download dos pacotes
    - emulador
    - platforms
    - platforms-tools
    - build-tools

- adicionar ADB e o Emulator as variáveis de ambientes

- criação da imagem do Emulador - via sdkmanager
- Build do Emulador

### Criação de Projetos e códigos da linha de comando

- criação de projetos
    - flutter create nome_do_app
        - flags
            - --empty : Cria um aplicativo "vázio" ("Hello World!")
            - --platforms : permite a seleção de uma plataforma de desevolvimento
                - exemplos: --platforms=android (a criação do projeto será somente para a plataforma android)
    - Exemplo de criação de um aplicativo android vazio
        - flutter create nome_do_app --empty --platforms=android
        - obs: nome do aplicativo, todas as letras minusculas e separação de palavras por _(underline)
    - flutter doctor
        - permite correção de pequenos problemas no flutter e identificação dos parametros funcionais, em relação as plataforma de desenvolvimento
        - sempre rodar o flutter doctor no começo do desenvolvimento
    - flutter clean
        - limpa chace do build(apaga o apk anterior)
    - flutter run -v