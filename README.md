# 🏥 Hospital Database — Sistema de Gerenciamento Hospitalar

Projeto acadêmico de **Banco de Dados Relacional**, desenvolvido utilizando **MySQL 8.0**, com o objetivo de organizar e gerenciar informações de um hospital.

O sistema permite armazenar e relacionar informações de pacientes, médicos, quartos, internações, consultas e prescrições médicas, garantindo a organização dos dados por meio de chaves primárias, chaves estrangeiras e relacionamentos.

---

## 📌 Contextualização

A administração de um hospital envolve diversas informações que precisam ser armazenadas, organizadas e consultadas constantemente.

O cadastro de pacientes, o controle de médicos, a disponibilidade de quartos, as internações e o histórico de consultas são processos fundamentais para o funcionamento de uma instituição hospitalar.

Quando essas informações são armazenadas separadamente, podem ocorrer problemas como:

- Dificuldade para localizar informações de pacientes.
- Falta de organização dos registros de consultas.
- Dificuldade no acompanhamento das internações.
- Falta de controle sobre os quartos hospitalares.
- Dificuldade para consultar prescrições médicas.
- Repetição e inconsistência de informações.

## 🎯 Objetivo do Projeto

Desenvolver um banco de dados relacional utilizando MySQL para centralizar e organizar as informações hospitalares.

A estrutura foi planejada para conectar diferentes áreas do hospital por meio de relacionamentos entre tabelas, facilitando consultas, atualizações e o gerenciamento das informações.

---

## ⚙️ Tecnologias Utilizadas

- **MySQL 8.0:** Sistema de gerenciamento de banco de dados.
- **SQL:** Linguagem utilizada para criação, manipulação e consulta dos dados.
- **MySQL Workbench:** Ferramenta para modelagem, administração e visualização do banco.
- **InnoDB:** Mecanismo de armazenamento utilizado para garantir a integridade referencial.

---

## 🗄️ Modelagem do Banco de Dados

O banco de dados possui o nome `hospital_db` e é composto por **6 tabelas relacionadas**.

### 📊 Diagrama Entidade-Relacionamento (DER)

O diagrama apresenta as entidades, seus atributos e os relacionamentos existentes no banco de dados.

### 📋 Estrutura das Tabelas

#### 1. Pacientes (`pacientes`)

Armazena as informações cadastrais dos pacientes.

| Campo | Tipo | Descrição |
|---|---|---|
| id_paciente | INT | Chave primária |
| nome_paciente | VARCHAR(100) | Nome do paciente |
| cpf | CHAR(14) | CPF único |
| data_nascimento | DATE | Data de nascimento |
| telefone_paciente | CHAR(15) | Telefone |
| convenio | CHAR(50) | Convênio médico |

#### 2. Médicos (`medicos`)

Armazena os dados dos profissionais responsáveis pelos atendimentos.

| Campo | Tipo | Descrição |
|---|---|---|
| id_medico | INT | Chave primária |
| nome_medico | CHAR(100) | Nome do médico |
| crm | CHAR(12) | CRM único |
| especialidade | CHAR(50) | Especialidade médica |

#### 3. Quartos (`quartos`)

Responsável pelo armazenamento das informações dos quartos hospitalares.

| Campo | Tipo | Descrição |
|---|---|---|
| id_quarto | INT | Chave primária |
| numero_quarto | CHAR(3) | Número único do quarto |
| andar | CHAR(3) | Andar do quarto |
| tipo_quarto | CHAR(30) | Categoria do quarto |
| status_quarto | CHAR(20) | Situação do quarto |

#### 4. Internações (`internacoes`)

Registra as internações dos pacientes e os quartos utilizados.

| Campo | Tipo | Descrição |
|---|---|---|
| id_internacao | INT | Chave primária |
| id_paciente | INT | Chave estrangeira |
| id_quarto | INT | Chave estrangeira |
| data_entrada | DATE | Data de entrada |
| data_saida | DATE | Data de saída |
| valor_diaria | DECIMAL(10,2) | Valor da diária |

#### 5. Consultas (`consultas`)

Armazena os atendimentos realizados pelos médicos.

| Campo | Tipo | Descrição |
|---|---|---|
| id_consulta | INT | Chave primária |
| data_consulta | DATETIME | Data e horário |
| status_consulta | CHAR(20) | Situação da consulta |
| valor_consulta | DECIMAL(10,2) | Valor do atendimento |
| id_paciente | INT | Chave estrangeira |
| id_medico | INT | Chave estrangeira |

#### 6. Prescrições (`prescricoes`)

Armazena os medicamentos e as orientações prescritas durante as consultas.

| Campo | Tipo | Descrição |
|---|---|---|
| id_prescricao | INT | Chave primária |
| id_consulta | INT | Chave estrangeira |
| medicamento | CHAR(100) | Nome do medicamento |
| dosagem | CHAR(50) | Orientação de uso |
| quantidade | CHAR(30) | Quantidade prescrita |

---

## 🔗 Relacionamentos e Cardinalidade

O banco utiliza relacionamentos do tipo **1:N (Um para Muitos)**.

| Relacionamento | Descrição |
|---|---|
| Pacientes → Internações | Um paciente pode possuir várias internações. |
| Quartos → Internações | Um quarto pode aparecer em várias internações ao longo do tempo. |
| Pacientes → Consultas | Um paciente pode realizar várias consultas. |
| Médicos → Consultas | Um médico pode realizar várias consultas. |
| Consultas → Prescrições | Uma consulta pode possuir várias prescrições. |

### Integridade Referencial

Os relacionamentos são implementados por meio de chaves estrangeiras (FK), garantindo que os registros relacionados respeitem as referências existentes no banco.

As chaves primárias (PK) identificam exclusivamente cada registro.

---

## 🚀 Como Executar o Projeto

### 📋 Pré-requisitos

Antes de executar o projeto, é necessário possuir:

- MySQL 8.0 ou superior.
- MySQL Workbench ou outra ferramenta compatível com MySQL.

### 1. Criar o Banco de Dados

Execute o seguinte comando:

```sql
CREATE DATABASE IF NOT EXISTS hospital_db;

USE hospital_db;
```

### 2. Executar os Arquivos SQL

Após criar o banco de dados, importe os arquivos na seguinte ordem:

1. `hospital_db_pacientes.sql`
2. `hospital_db_medicos.sql`
3. `hospital_db_quartos.sql`
4. `hospital_db_internacoes.sql`
5. `hospital_db_consultas.sql`
6. `hospital_db_prescricoes.sql`

### 3. Executar pelo MySQL Workbench

1. Abra sua conexão com o MySQL.
2. Selecione o banco de dados `hospital_db`.
3. Acesse **File → Open SQL Script**.
4. Escolha o primeiro arquivo SQL.
5. Execute o script pelo botão de raio.
6. Repita o procedimento para os demais arquivos, respeitando a ordem indicada.

⚠️ **Atenção:** Os arquivos SQL possuem comandos `DROP TABLE IF EXISTS` e inserções de dados. Portanto, executá-los novamente recria as respectivas tabelas e pode apagar os dados existentes.

### 4. Verificar a Criação do Banco

Após executar todos os arquivos, utilize:

```sql
USE hospital_db;

SHOW TABLES;
```

O resultado deverá apresentar as seis tabelas:

- pacientes
- medicos
- quartos
- internacoes
- consultas
- prescricoes

Para conferir os registros:

```sql
SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM quartos;
SELECT * FROM internacoes;
SELECT * FROM consultas;
SELECT * FROM prescricoes;
```

---

## 📊 Índices e Otimização

Foram criados índices para facilitar buscas frequentes e melhorar o desempenho de determinadas consultas.

| Índice | Tabela | Campo |
|---|---|---|
| idx_pacientes_nome | pacientes | nome_paciente |
| idx_medicos_especialidade | medicos | especialidade |
| idx_consultas_data | consultas | data_consulta |

Também são utilizados índices associados às chaves primárias, chaves estrangeiras e restrições de unicidade.

---

## 📝 Consultas SQL Desenvolvidas

O projeto possui **10 consultas SQL**, desenvolvidas para simular situações reais da administração hospitalar.

| Nº | Consulta | Objetivo |
|---|---|---|
| 01 | Faturamento por Convênio | Calcular o total arrecadado em consultas por convênios com "Saúde" no nome. |
| 02 | Média por Especialidade | Calcular a média dos valores de consultas relacionadas à Cardiologia. |
| 03 | Média das Diárias | Analisar a média das diárias em quartos Apartamento ou UTI. |
| 04 | Consultas por Médico | Identificar os valores das consultas realizadas ou finalizadas por médico. |
| 05 | Diárias por Paciente | Calcular a soma das diárias dos pacientes com sobrenome Silva. |
| 06 | Prescrições por Status | Contabilizar prescrições de Dipirona ou Paracetamol por status da consulta. |
| 07 | Convênio e Especialidade | Analisar a média das consultas por convênio Unimed e especialidade médica. |
| 08 | Diárias em UTI | Calcular a média das diárias agrupadas por convênio em quartos de UTI. |
| 09 | Medicamentos por Médico | Contabilizar itens prescritos por médico em consultas realizadas. |
| 10 | Gastos por Paciente | Calcular a soma e a média dos valores das consultas de pacientes cujo nome começa com M. |

### Principais Comandos SQL Utilizados

- `SELECT`: Consultar informações.
- `WHERE`: Filtrar registros.
- `JOIN`: Relacionar diferentes tabelas.
- `GROUP BY`: Agrupar informações.
- `ORDER BY`: Ordenar resultados.
- `COUNT()`: Contabilizar registros.
- `SUM()`: Calcular valores acumulados.
- `AVG()`: Calcular médias.
- `HAVING`: Filtrar resultados agrupados.
- `LIKE`: Buscar padrões de texto em colunas.

Esses recursos permitem elaborar relatórios e extrair informações relevantes para a administração hospitalar.

---

## 🎓 Objetivo Educacional

Este projeto tem como finalidade colocar em prática os principais conceitos de Banco de Dados Relacionais, incluindo:

- Desenvolvimento de consultas SQL.
- Criação e estruturação de tabelas.
- Definição de chaves primárias e estrangeiras.
- Relacionamentos e cardinalidade.
- Inserção e manipulação de dados.
- Utilização de funções de agregação.
- Aplicação de índices e otimização de consultas.

---

## 👨‍💻 Autor

**Miguel Holanda**

Projeto desenvolvido como atividade acadêmica de Banco de Dados.
---

## 📄 Licença e Observações

Projeto desenvolvido para fins educacionais.

Os dados utilizados são fictícios e destinados exclusivamente a testes e demonstrações.

---

**Hospital Database — Organização, relacionamento e gerenciamento de dados hospitalares utilizando MySQL.**
