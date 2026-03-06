# Finanças Pro
Sistema Fullstack de controle de financeiro (React + Node.js)

## Sobre o Projeto 
Este projeto é um **Monorepo** que contém o ecossistema completo de uma aplicação financeira. O objetivo é sair do CRUD básico e chegar a uma arquitetura profissional com autenticação e gráficos.

---

## Tecnologias Utilizadas

* **Backend**
    - Node.js com NestJS (pela estrutura organizada e profissional).
    - PostgreSQL com Prisma ORM.
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
