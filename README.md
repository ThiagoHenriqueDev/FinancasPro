# Finanças Pro
Sistema Fullstack de controle de financeiro (React + Node.js)

## Sobre o Projeto 
Este projeto é utilizado para estudo e prática de desenvolvimento fullstack, para aprender e registrar meu progresso.
a ideia é criar um sistema de controle financeiro, onde o usuário pode cadastrar suas receitas e despesas, e visualizar gráficos e relatórios para acompanhar sua saúde financeira.

---

## Tecnologias Utilizadas

* **Backend**
    - Node.js com NestJS (pela estrutura organizada e profissional).
    - PostgreSQL com Prisma ORM (Banco de dados Neon para nao ter que configurar localmente).
* **Frontend**
     - React + Vite
     - Tailwind CSS
     - Lucide React (ícones)

---

## Estrutura do Projeto
|`frontend/`| Interface do Usuário e Dashboard | React |
|`backend/`| Lógica de Negócio, API e Banco de Dados | Node.js com NestJS |


## Como Rodar o Projeto

### Backend
1. Navegue até a pasta `backend`:
   ```bash
   cd backend
   ```
2. Instale as dependências:
   ```bash
    npm install
    ```
3. Configure o banco de dados PostgreSQL e atualize as variáveis de ambiente no arquivo `.env`.
4. Rode as migrações do Prisma para criar as tabelas:
   ```bash
   npx prisma migrate dev
   ```
5. Inicie o servidor:
   ```bash
    npm run start:dev
    ```
### Frontend
1. Navegue até a pasta `frontend`:

    ```bash
    cd frontend
    ``` 
2. Instale as dependências:
    ```bash
    npm install
    ```
3. Inicie o servidor de desenvolvimento:
    ```bash
    npm run dev
    ```
