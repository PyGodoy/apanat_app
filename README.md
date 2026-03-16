# 🏊 Apanat App

Aplicativo mobile desenvolvido para o gerenciamento de uma academia de natação. O app permite que alunos acompanhem a grade de aulas, realizem check-ins, visualizem seu histórico e recebam notificações da academia. Administradores têm acesso a funcionalidades exclusivas de gerenciamento.

---

## 📱 Telas e Funcionalidades

### Autenticação
- **Cadastro** — criação de conta com nome, e-mail e senha
- **Login** — autenticação com JWT, sessão salva localmente

### Home — Grade de Aulas
- Visualização da programação semanal agrupada por dia
- Sistema de **check-in e cancelamento** por aula
- Check-in persistente — ao voltar para a tela o status é mantido

### Histórico
- Lista completa de check-ins realizados pelo aluno
- Exibe nome da aula, professor, data e horário

### Notificações
- Visualização de notificações criadas pela academia

### Perfil
- Exibição de dados do usuário (nome, e-mail, telefone)
- Foto de perfil carregada da galeria do celular
- Estatísticas: check-ins no mês e total de aulas realizadas
- Edição de perfil

### Painel Admin *(exclusivo para administradores)*
- **Criar aula** — cadastro de nova aula na grade semanal
- **Deletar aula** — remoção de aulas existentes
- **Criar notificação** — envio de notificações para todos os alunos
- **Selecionar professor** — dropdown carregado dinamicamente do banco de dados

---

## 🛠️ Tecnologias Utilizadas

### Frontend
| Tecnologia | Uso |
|---|---|
| Flutter & Dart | Desenvolvimento mobile |
| MVVM | Arquitetura do projeto |
| Dio | Requisições HTTP |
| SharedPreferences | Persistência local do token e role |
| image_picker | Seleção de foto da galeria |

### Backend
| Tecnologia | Uso |
|---|---|
| Node.js & Express | Servidor e API REST |
| JWT | Autenticação e controle de sessão |
| Bcrypt | Criptografia de senhas |
| PostgreSQL (NeonDB) | Banco de dados em nuvem |

---

## 🗂️ Estrutura do Projeto

```
apanat_app/
└── lib/
    ├── modules/
    │   ├── admin/          # Modais exclusivos do administrador
    │   ├── home/           # Tela principal com grade de aulas
    │   ├── historico/      # Histórico de check-ins
    │   ├── notificacoes/   # Tela de notificações
    │   └── perfil/         # Perfil do usuário
    ├── services/           # Comunicação com a API
    └── shared/
        ├── models/         # Modelos de dados
        └── widgets/        # Widgets reutilizáveis

apanat_backend/
└── src/
    ├── config/             # Configuração do banco de dados
    ├── controllers/        # Lógica das rotas
    ├── middlewares/        # Autenticação e controle de acesso
    └── routes/             # Definição das rotas da API
```

---

## 👤 Autor

**Mikaell Godoy**  
Desenvolvedor Mobile  
godoyvitorio99@gmail.com
