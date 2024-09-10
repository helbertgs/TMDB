# TMDB - App Test

## Objetivo
Criação de uma aplicação, que exibe uma lista de fimes usando a API do [TMDB]().

## Features
### Carregar a lista filmes.
Após abrir a aplicação, a tela inicial exibirá um `Grid` contendo os filmes carregados pela `API` do [TMDB](). A requisição foi realizada utilizando o `endpoint` `Movie Lists/Popular`. É necessário informar a página para que este `endpoint` retorne um `Array` contendo no máximo 20 filmes.

Sempre que o ultimo elemento da lista é exibido, será feita uma requisição de novos videos referentes a página seguinte.

### Filtrar os filmes por `Popular` e `Upcoming`
Por padrão, todos os filmes retornados pela `API` serão exibidos. Ao clicar em `Upcoming` será realizado um filtro nos filmes já carregados, exibindo apenas os filmes que ainda serão lançados. Ao clicar em `Popular`, o filtro será removido e todos os filmes previamente carregados, serão exibidos novamente.

### Exibir os detalhes do filme selecionado
Ao clicar em algum filme da lista, será exibido uma nova tela contendo os detalhes do filme selecionado.

## Layout
### Portrait
Quando a aplicação está no formato `Portrait` (Vertical), os elementos da tela inicial serão exibidos no formato de `Grid`

<!-- Adicionar grid com as telas em portrait aqui -->

### Landscape
Quando a aplicação está no formato `Landscape` (Horizontal), os elementos da tela inicial serão exibidos no formato de `Lista`, para facilitar a navegação e visualização dos filmes exibidos.

<!-- Adicionar grid com as telas em landscape aqui -->

## Projeto
As features foram criadas utilizando a arquitetura `VIP (View, Interactor, Presenter)`. As interações do usuário na tela, fazem com que a `View` comunique com o `Interactor`, para que o mesmo efetue requisições ao `TMDB` através da nossa classe `NetworkService`. Após receber os dados da requisição, o `Interactor` passa os dados para o `Presenter`, que será responsável por manipular/tratar os dados e encaminhar para a `View`, que irá exibir as informações na tela. Devido a forma como o `SwiftUI` renderiza a hierarquia de `Views`, foi necessário adicionar uma classe `ViewModel`. Está classe retem os dados e, ao ser alterada, a mesma faz com que o `SwiftUI` renderize a tela novamente.

<!-- Adicionar a imagem com o fluxo do VIP -->

Foi criada uma classe chamada `ImageDownloader`, responável por fazer cache das imagens (banners e fotos), para melhorar a performance da aplicacão. Existe também uma classe `Formatter`, com funções auxiliares responsáveis por formatar as datas que serão exibidas nas telas.

## Cobertura de Testes
XCode Build Code Coverage: **63%** - Foram criados `Spy`, `Mocks`, `Fake` e `Stubs` das camadas, entidades e netowrk, para realização dos testes. Os testes estão configuração para serem executados no `Xcode` usando o `XCTest`.

## Requisitos pra rodar o projeto
- Sistema operacional: MacOS
- IDE: Xcode 16
- Simulador iOS: iPhone 15 Pro / iPhone 15 Pro Max

## Links de referência
- [VIP Architecture](https://medium.com/@aldo.vernando/vip-clean-architecture-in-swiftui-51673a01d24e)
- [TMDB - API Reference](https://developer.themoviedb.org/reference/intro/getting-started)