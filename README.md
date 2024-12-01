
# Gerenciador de Tarefas

Um aplicativo simples de gerenciamento de tarefas desenvolvido com **Flutter** usando a **Clean Architecture** e gerenciamento de estado com **Cubit**.

---

## **Índice**
- [Visão Geral](#visão-geral)
- [Funcionalidades](#funcionalidades)
- [Estrutura de Pastas](#estrutura-de-pastas)
- [Dependências](#dependências)
- [Configuração e Instalação](#configuração-e-instalação)
- [Como Rodar o Projeto](#como-rodar-o-projeto)
- [Como Buildar](#como-buildar)
- [Capturas de Tela (Opcional)](#capturas-de-tela)
- [Licença](#licença)

---

## **Visão Geral**
Este é um aplicativo de gerenciamento de tarefas que permite aos usuários criar, visualizar, editar e excluir tarefas. Ele utiliza o **Hive** para persistência de dados local, garantindo que as tarefas sejam armazenadas mesmo após o fechamento do aplicativo.

### **Tecnologias Usadas**
- **Flutter** (Framework principal)
- **Cubit** (Gerenciamento de estado)
- **Hive** (Persistência de dados local)
- **Clean Architecture** (Organização do código)

---

## **Funcionalidades**
1. **Listar Tarefas**: Exibe uma lista de tarefas com título e status.
2. **Criar Tarefa**: Adiciona uma nova tarefa com título e descrição (opcional).
3. **Editar Tarefa**: Permite editar título, descrição e status.
4. **Excluir Tarefa**: Remove uma tarefa da lista.
5. **Persistência Local**: Salva as tarefas usando o Hive.

---

## **Estrutura de Pastas**

O projeto segue a **Clean Architecture**, separando responsabilidades em camadas bem definidas.

```
lib/
├── core/                     # Configurações globais, temas e widgets compartilhados
├── features/                 # Módulos funcionais (ex.: gerenciamento de tarefas)
│   ├── task/                 # Módulo de Tarefas
│   │   ├── data/             # Camada de dados (Modelos, fontes de dados, repositórios)
│   │   │   ├── models/       # Modelos para Hive
│   │   │   ├── repositories/ # Implementações de repositórios
│   │   ├── domain/           # Camada de domínio (Entidades e Repositórios)
│   │   ├── presentation/     # Camada de apresentação (UI e Cubits)
│   │   │   ├── cubit/        # Gerenciamento de estado
│   │   │   ├── pages/        # Telas do aplicativo
│   │   │   ├── widgets/      # Componentes reutilizáveis da UI
├── main.dart                 # Ponto de entrada do aplicativo
```

---

## **Dependências**
As principais dependências usadas no projeto são:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  hive: ^2.2.3
  hive_flutter: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.6
  hive_generator: ^2.0.1
  flutter_lints: ^3.0.0
```

Certifique-se de instalar todas as dependências antes de rodar o projeto.

---

## **Configuração e Instalação**

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

3. **Configure o Hive:**
   Certifique-se de que o diretório do Hive está configurado corretamente. O Hive armazena os dados no diretório padrão do sistema operacional.

4. **Gere os arquivos necessários:**
   ```bash
   flutter pub run build_runner build
   ```

---

## **Como Rodar o Projeto**

1. **Inicie um emulador ou conecte um dispositivo físico.**
2. **Execute o aplicativo:**
   ```bash
   flutter run
   ```

---

## **Como Buildar**

1. Para Android:
   ```bash
   flutter build apk
   ```
   O arquivo gerado estará em `build/app/outputs/flutter-apk/app-release.apk`.

2. Para iOS:
   ```bash
   flutter build ios
   ```
   Certifique-se de configurar as assinaturas (certificados) no Xcode antes de buildar para iOS.



---

## **Licença**
Este projeto está licenciado sob a [MIT License](LICENSE).
