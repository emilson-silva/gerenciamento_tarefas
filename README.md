# Gerenciamento de Tarefas

Este é um aplicativo de gerenciamento de tarefas desenvolvido com Flutter e utilizando o padrão de arquitetura limpa.

## Arquitetura do Projeto

O projeto está organizado da seguinte forma:


### Descrição das Pastas

- **core**: Contém utilitários e widgets que podem ser reutilizados em diferentes partes do aplicativo.
  - **utils**: Funções utilitárias e constantes.
  - **widgets**: Widgets reutilizáveis.

- **features**: Contém as diferentes funcionalidades do aplicativo.
  - **task**: Funcionalidade de gerenciamento de tarefas.
    - **data**: Implementações de fontes de dados, modelos e repositórios.
      - **datasources**: Fontes de dados (API, banco de dados local, etc.).
      - **models**: Modelos de dados.
      - **repositories**: Implementações dos repositórios.
    - **domain**: Entidades, repositórios e casos de uso.
      - **entities**: Entidades de domínio.
      - **repositories**: Interfaces dos repositórios.
      - **usecases**: Casos de uso.
    - **presentation**: Camada de apresentação.
      - **cubit**: Gerenciamento de estado usando Cubit.
      - **pages**: Páginas da interface do usuário.

## Instalação

Siga os passos abaixo para configurar e executar o projeto localmente.

### Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) instalado na sua máquina.
- [Dart](https://dart.dev/get-dart) instalado.

### Passos

1. Clone o repositório:

```sh
git clone https://github.com/seu-usuario/seu-repositorio.git