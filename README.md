# Sistema Financeiro API

### Descrição

Este é o repositório da API do sistema financeiro. Essa API foi desenvolvida para gerenciar transações financeiras de usuários, permitindo o cadastro, login, atualização e exclusão de usuários, além de operações relacionadas a categorias e transações.

# Documentação da API

A documentação a seguir descreve todas as rotas disponíveis na API, bem como suas requisições e respostas.

**1. Cadastrar usuário**

- Descrição: Rota para cadastrar um novo usuário no sistema.
- Endpoint: **POST /usuario**

* Requisição:

  - O corpo (body) deverá possuir um objeto com as seguintes propriedades:

  ```perl

  {
  "nome": "José",
  "email": "jose@email.com",
  "senha": "123456"
  }
  ```

  - Resposta:

    - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá o conteúdo do usuário cadastrado, incluindo seu respectivo id e excluindo a senha criptografada.
    - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**2. Login do usuário**

- Descrição: Rota para permitir que o usuário cadastrado realize o login no sistema.
- Endpoint: POST /login
- Requisição:
  - O corpo (body) deverá possuir um objeto com as seguintes propriedades:

```perl

{
"email": "jose@email.com",
"senha": "123456"
}
```

- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá um objeto com a propriedade "token" que conterá o token de autenticação gerado e uma propriedade "usuario" com as informações do usuário autenticado, exceto a senha.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**3. Detalhar usuário**

- Descrição: Rota para o usuário obter os dados do seu próprio perfil.
- Endpoint: GET /usuario
- Requisição:

  - Não deverá possuir parâmetros de rota ou de query.
  - O corpo (body) da requisição não deverá possuir conteúdo.

- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá um objeto representando o usuário encontrado, com todas as suas propriedades, exceto a senha.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**4. Atualizar usuário**

- Descrição: Rota para o usuário realizar alterações no seu próprio usuário.
- Endpoint: PUT /usuario
- Requisição:
  - Não deverá possuir parâmetros de rota ou de query.
  - O corpo (body) deverá possuir um objeto com as seguintes propriedades:

```perl

{
"nome": "José de Abreu",
"email": "jose_abreu@email.com",
"senha": "j4321"
}
```

- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), não deveremos enviar conteúdo no corpo (body) da resposta.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**5. Listar categorias**

- Descrição: Rota para listar todas as categorias cadastradas.
- Endpoint: GET /categoria
- Requisição:
  - Não deverá possuir parâmetros de rota ou de query.
  - O corpo (body) da requisição não deverá possuir conteúdo.

* Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá um array dos objetos (categorias) encontrados.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha

**6. Listar transações do usuário logado**

- Descrição: Rota para listar todas as transações cadastradas do usuário logado.
- Endpoint: GET /transacao
- Requisição:
  - Não deverá possuir parâmetros de rota ou de query.
  - O corpo (body) da requisição não deverá possuir conteúdo.

* Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá um array dos objetos (transações) encontradas.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**7. Detalhar uma transação do usuário logado**

- Descrição: Rota para o usuário logado obter uma das suas transações cadastradas.
- Endpoint: GET /transacao/:id
- Requisição:
  - Deverá ser enviado o ID da transação no parâmetro de rota do endpoint.
  - O corpo (body) da requisição não deverá possuir conteúdo.
- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá um objeto que representa a transação encontrada, com todas as suas propriedades.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**8. Cadastrar transação para o usuário logado**

- Requisição:

  - O corpo (body) da requisição deverá possuir um objeto com as seguintes propriedades:

```json
{
  "tipo": "entrada",
  "descricao": "Salário",
  "valor": 300000,
  "data": "2022-03-24T15:30:00.000Z",
  "categoria_id": 6
}
```

- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá as informações da transação cadastrada, incluindo seu respectivo id.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**9. Atualizar transação do usuário logado**

- Descrição: Rota para o usuário logado atualizar uma das suas transações cadastradas.
- Endpoint: PUT /transacao/:id
- Requisição:
  - Deverá ser enviado o ID da transação no parâmetro de rota do endpoint.
  - O corpo (body) da requisição deverá possuir um objeto com as seguintes propriedades:

```json
{
  "descricao": "Sapato amarelo",
  "valor": 15800,
  "data": "2022-03-23T12:35:00",
  "categoria_id": 4,
  "tipo": "saida"
}
```

- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), não deveremos enviar conteúdo no corpo (body) da resposta.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**10. Excluir transação do usuário logado**

- Descrição: Rota para o usuário logado excluir uma das suas transações cadastradas.
- Endpoint: DELETE /transacao/:id
- Requisição:
  - Deverá ser enviado o ID da transação no parâmetro de rota do endpoint.
  - O corpo (body) da requisição não deverá possuir nenhum conteúdo.
- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), não deveremos enviar conteúdo no corpo (body) da resposta.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.

**11. Filtrar transações por categoria (Extra)**

- Descrição: Permite que o usuário logado consulte apenas transações das categorias informadas.
- Endpoint: GET /transacao
- Requisição:
  - Parâmetro opcional do tipo query "filtro". Quando enviado, deverá ser sempre um array contendo a descrição de uma ou mais categorias.
  - O corpo (body) da requisição não deverá possuir conteúdo.
- Resposta:
  - Em caso de sucesso (HTTP Status 200/201/204), o corpo (body) da resposta conterá um array dos objetos (transações) encontradas.
  - Em caso de falha na validação, a resposta conterá um status code apropriado, e o corpo (body) terá um objeto com a propriedade "mensagem" explicando o motivo da falha.
