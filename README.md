# TMDB - App Test
[![Maintainability](https://api.codeclimate.com/v1/badges/0784475a37d4ecfd5f59/maintainability)](https://codeclimate.com/github/helbertgs/TMDB/maintainability)

## Objetivo
Criação de uma aplicação que exibe uma lista de filmes usando a API do [TMDB]().

## Features
### Carregar lista de filmes
Após abrir a aplicação, a tela inicial exibirá um `Grid` contendo os filmes carregados pela `API` do [TMDB](). A requisição foi realizada utilizando o `endpoint` `Movie Lists/Popular`. É necessário informar a página para que este `endpoint` retorne um `Array` contendo no máximo 20 filmes.

Sempre que o último elemento da lista é exibido, será feita uma requisição de novos vídeos referentes a página seguinte.

### Filtrar os filmes por `Popular` e `Upcoming`
Por padrão, todos os filmes retornados pela `API` serão exibidos. Ao clicar em `Upcoming` será realizado um filtro nos filmes já carregados, exibindo apenas os filmes que ainda serão lançados. Ao clicar em `Popular`, o filtro será removido e todos os filmes previamente carregados, serão exibidos novamente.

### Exibir os detalhes do filme selecionado
Ao clicar em algum filme da lista, será exibido uma nova tela contendo os detalhes do filme selecionado.

## Layout
### Portrait
Quando a aplicação está no formato `Portrait` (Vertical), os elementos da tela inicial serão exibidos no formato de `Grid`.

|  |  |
| :--------: | :-------: |
| ![Portrait (Home)](https://github.com/user-attachments/assets/194904e5-988f-4ba2-9f18-b4d49a708361) | ![Portrailt (Details)](https://github.com/user-attachments/assets/a5f44629-df26-4f87-afa9-53c68a730532) |

### Landscape
Quando a aplicação está no formato `Landscape` (Horizontal), os elementos da tela inicial serão exibidos no formato de `Lista`, para facilitar a navegação e visualização dos filmes exibidos.

![Landscape (Home)](https://github.com/user-attachments/assets/6cf2f617-b571-48b1-958b-7006c3491c23)

## Projeto
As `features` foram criadas utilizando a arquitetura `VIP (View, Interactor, Presenter)`. As interações do usuário na tela, fazem com que a `View` comunique com o `Interactor`, para que o mesmo efetue requisições ao `TMDB` através da classe `NetworkService`. Após receber os dados da requisição, o `Interactor` passa os dados para o `Presenter`, que será responsável por manipular/tratar os dados e encaminhar para a `View`, que irá exibir as informações na tela. Devido a forma como o `SwiftUI` renderiza a hierarquia de `Views`, foi necessário adicionar uma classe `ViewModel`, que retem os dados e, ao ser alterada, faz com que o `SwiftUI` renderize a tela novamente.

![VIP](https://github.com/user-attachments/assets/5346ea72-16b6-48d1-8872-b1ec79883425)

Foi criada uma classe chamada `ImageDownloader`, responsável por fazer cache das imagens (banners e fotos), para melhorar a performance da aplicação. Existe também uma classe `Formatter`, com funções auxiliares responsáveis por formatar as datas que serão exibidas na tela.

## Cobertura de Testes
XCode Build Code Coverage: **63%** - Foram criados `Spy`, `Mocks`, `Fake` e `Stubs` das camadas, entidades e network, para realização dos testes. Os testes estão configurados para serem executados no `Xcode` usando o `XCTest`.

## Próximos Passos
- Mudar a arquitetura `para MVVM` ou `Composable Architecture` pois funcionam melhor com o `SwiftUI`.
- Adicionar a possibilidade da autenticação de usuário;
- Melhorar design das telas
- Tratar Light / Dark mode

## Dividas Tecnicas
- Remover variáveis que não estão sendo utilizadas nas entidades.
- Avaliar o que realmente precisa ser `async` e o que precisa atuar na `main thread`

## Requisitos para rodar o projeto
- Sistema operacional: MacOS
- IDE: Xcode 16
- Simulador iOS (18.1): iPhone 15 Pro / iPhone 15 Pro Max
- *Ao abrir o projeto, ter certeza que esteja selecionado o scheme "TMDB, conforme imagem abaixo"*

![Xcode](https://github.com/user-attachments/assets/ea7f6f11-405a-4892-95c1-043c74b2cc5e)

## Links de referência
- [VIP Architecture](https://medium.com/@aldo.vernando/vip-clean-architecture-in-swiftui-51673a01d24e)
- [TMDB - API Reference](https://developer.themoviedb.org/reference/intro/getting-started)

## Video
https://github.com/user-attachments/assets/fb66ab19-b970-461c-8dd4-051f6a2a6c7d


