# OrderApi

[![Build Status](https://www.travis-ci.com/gissandrogama/delivery_order.svg?branch=main)](https://www.travis-ci.com/gissandrogama/delivery_order)

[![codecov](https://codecov.io/gh/gissandrogama/delivery_order/branch/main/graph/badge.svg?token=5S6KS3h8s6)](https://codecov.io/gh/gissandrogama/delivery_order)

Desafio **bac-kend** que o objetivo é criar uma `parse` de um payload para enviar para uma api. Esse teste foi proposto pela [Delivery Center](https://www.deliverycenter.com/)

# Informacoes Tecnicas

- credo para garantir qualidade
- Sobelow para segurança
- Arquivos licença e log para processo de qualidade de projeto
- Coveralls e codecov manter cobertura e relatório de testes
- Travis para CI e CD

## Iniciando localmente

**1.** Clone o projeto:

 * ssh
```sh
$ git git@github.com:gissandrogama/delivery_order.git
```

 * https
```sh
$ git clone https://github.com/gissandrogama/delivery_order.git
```

**2.** Acesse a pasta do projeto:

```sh
$ cd delivery_order
```

**3.** Instale as dependências:

```sh
$ mix deps.get
```

**4.** criar e migrar o banco de dados, e inserir dados do db.json:

```sh
$ mix ecto.setup
```

**5.** inicie o endpoit phoenix com:

```sh
$ mix phx.sever
```
ou

```sh
$ iex -S mix phx.server
```

A função que faz a requisição para a api `https://delivery-center-recruitment-ap.herokuapp.com/` é `run/0` que está no em `lib/order_api/services/solicit.ex`. Para executar a função basta usar esse comando no terminal interativo do elixir o `iex`.

```Elixir
  iex> OrderApi.Services.Solicit.run
```

Esse comando retornará o request da solicitação, se a estrutura passada estiver de acordo como a api aceita, vai retonar dessa forma.

```Elixir
iex> {:ok,
 %HTTPoison.Response{
   body: "OK",
   headers: [
     {"Server", "Cowboy"},
     {"Date", "Thu, 28 Jan 2021 06:09:57 GMT"},
     {"Connection", "keep-alive"},
     {"Content-Type", "text/html;charset=utf-8"},
     {"X-Xss-Protection", "1; mode=block"},
     {"X-Content-Type-Options", "nosniff"},
     {"X-Frame-Options", "SAMEORIGIN"},
     {"Content-Length", "2"},
     {"Via", "1.1 vegur"}
   ],
   request: %HTTPoison.Request{
     body: "{\"city\":\"Cidade de Testes\",\"complement\":\"teste\",\"country\":\"BR\",\"customer\":{\"contact\":\"41999999999\",\"email\":\"john@doe.com\",\"externalCode\":\"136226073\",\"name\":\"John Doe\"},\"deliveryFee\":\"5.14\",\"district\":\"Vila de Testes\",\"dtOrderCreate\":\"2019-06-24T16:45:32.000-04:00\",\"externalCode\":\"9987071\",\"items\":[{\"externalCode\":\"IT4801901403\",\"name\":\"Produto de Testes\",\"price\":49.9,\"quantity\":1,\"subItems\":[],\"total\":49.9}],\"latitude\":-23.629037,\"longitude\":-46.712689,\"number\":\"3454\",\"payments\":[{\"type\":\"credit_card\",\"value\":55.04}],\"postalCode\":\"85045020\",\"state\":\"São Paulo\",\"storeId\":282,\"street\":\"Rua Fake de Testes\",\"subTotal\":\"49.9\",\"total\":\"55.04\",\"total_shipping\":5.14}",
     headers: [
       {"X-Sent", "22h07 - 27/01/21"},
       {"Content-Type", "application/json"}
     ],
     method: :post,
     options: [],
     params: %{},
     url: "https://delivery-center-recruitment-ap.herokuapp.com/"
   },
   request_url: "https://delivery-center-recruitment-ap.herokuapp.com/",
   status_code: 200
 }}
```

Também foi criado uma rota `parse` localmente. Para usar essa rota eu usei o insomnia, passando um metodo `get` para o endereço `http://localhost:4000/api/parse`.

# Deploy
A aplicação está no gigalixir no endereço <https://order.gigalixirapp.com/>. Um dos motivos de escolher o gigalixir é que não tem sleeps da aplicação no plano free.

# Gerar documentação da aplicação

Para gerar a documentação da aplicação só excutar o comando:
```sh
$ mix docs
```
