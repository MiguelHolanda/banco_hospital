🏥 Banco de Dados Hospitalar — Sistema de Gerenciamento Hospitalar
Projeto acadêmico de Banco de Dados Relacional desenvolvido utilizando MySQL , com o objetivo de organizar e gerenciar informações de um hospital.

O banco de dados permite armazenar e relacionar informações de pacientes, médicos, quartos, internações, consultas e prescrições médicas, garantindo a organização dos dados por meio de chaves primárias, chaves estrangeiras e relacionamentos.

📌 Contextualização
A administração de um hospital envolve diversas informações que devem ser armazenadas e consultadas constantemente.

O cadastro de pacientes, o controle de médicos, a disponibilidade de quartos, as internações e o histórico de consultas são processos fundamentais para o funcionamento de uma instituição hospitalar.

Quando essas informações são armazenadas separadamente, podem ocorrer problemas como:

Dificuldade para localizar informações de pacientes.
Falta de organização dos registros de consultas.
Dificuldade no acompanhamento das internações.
Falta de controle sobre os quartos hospitalares.
Dificuldade para consultar prescrições médicas.
Repetição e inconsistência de informações.
🎯 Proposta
Desenvolver um banco de dados relacional utilizando MySQL para centralizar e organizar as informações hospitalares.

A estrutura foi projetada para conectar as diferentes áreas do hospital por meio de relacionamentos entre tabelas, facilitando consultas, verificações e o gerenciamento das informações.

⚙️ Tecnologias utilizadas
MySQL 8.0: Sistema de gerenciamento de banco de dados.
SQL: Linguagem utilizada para criação, manipulação e consulta de dados.
MySQL Workbench: Ferramenta para modelagem, administração e visualização do banco.
InnoDB: Mecanismo de armazenamento utilizado para garantir a integridade referencial.
🗄️ Modelagem do Banco de Dados
O banco de dados possui o nome hospital_dbe é composto por 6 tabelas relacionadas .

Diagrama Entidade-Relacionamento (DER)
O diagrama apresenta a estrutura do banco, suas entidades e os relacionamentos entre elas.

Captura de tela 2026-11-11 185735

Modelagem lógica
A seguir estão as principais tabelas e seus respectivos atributos.

1. Pacientes
Armazena as informações cadastrais dos pacientes.

Campo	Tipo	Descrição
id_paciente	INT	Chave primária
nome_paciente	VARCHAR(100)	Nome do paciente
cpf	CARACTER(14)	CPF único
data_nascimento	DATA	Data de nascimento
telefone_paciente	CARACTER(15)	Telefone
convenção	CARACTER(50)	Conva médico
Na
imagem
2. Médicos
Armazena os dados dos profissionais responsáveis ​​pelos atendimentos.

Campo	Tipo	Descrição
id_médico	INT	Chave primária
nome_médico	CARACTER(100)	Nome do médico
CRM	CARACTER(12)	CRM único
especialidade	CARACTER(50)	Especialidade médica
Na
imagem
3. Quartos
Responsável pelo armazenamento das informações dos quartos hospitalares.

Campo	Tipo	Descrição
id_quarto	INT	Chave primária
numero_quarto	CARACTER(3)	Número único do quarto
andar	CARACTER(3)	Andar do quarto
tipo_quarto	CARACTER(30)	Categoria do quarto
status_quarto	CARACTER(20)	Situação do quarto
Na
imagem
4. Internacionalizações
Registrar as internações dos pacientes e os quartos utilizados.

Campo	Tipo	Descrição
id_internacao	INT	Chave primária
id_paciente	INT	Chave;
id_quarto	INT	Chave;
entrada de dados	DATA	Data de entrada
dados_disse	DATA	Data de saída
valor_diário	DECIMAL(10,2)	Valor da diária
Na
imagem
5. Consultas
Armazena os atendimentos realizados pelos médicos.

Campo	Tipo	Descrição
id_consulta	INT	Chave primária
consulta de dados	DATA E HORA	Data e horário
status_consulta	CARACTER(20)	Situação da consulta
valor_consulta	DECIMAL(10,2)	Valor do ano
id_paciente	INT	Chave;
id_médico	INT	Chave;
Na
imagem
6. Prescrições
Armazene os medicamentos e as orientações prescritas durante as consultas.

Campo	Tipo	Descrição
id_prescricao	INT	Chave primária
id_consulta	INT	Chave;
medicamento	CARACTER(100)	Nome do medicamento
dosagem	CARACTER(50)	Orientação de uso
Ó	CARACTER(30)	quantidade prescrita
Na
imagem
🔗 Relacionamentos e Cardinalidade
O banco utiliza relacionamentos para conectar informações de diferentes tabelas.

Relacionamentos 1:N (Um para Muitos)
Pacientes → Internações: Um paciente pode possuir várias internações, mas cada internação pertence a um único paciente.
Quartos → Internações: Um quarto pode aparecer em várias internacionais ao longo do tempo, mas cada internação está vinculada a um único quarto.
Pacientes → Consultas: Um paciente pode realizar várias consultas, mas cada consulta pertence a um único paciente.
Médicos → Consultas: Um médico pode realizar várias consultas, mas cada consulta está vinculada a um único médico.
Consultas → Prescrições: Uma consulta pode possuir várias prescrições, mas cada prescrição pertence a uma única consulta.
Integridade referencial
Os relacionamentos são implementados por meio de chaves estrangeiras (FK), garantindo que os registros relacionados respeitem as referências existentes no banco.

As chaves primárias (PK) identificam-se exclusivamente em cada registro.

🚀 Como executar o projeto
Pré-requisitos
Antes de executar o projeto, é necessário possuir:

MySQL 8.0 ou superior.
MySQL Workbench ou outra ferramenta compatível com MySQL.
1. Criar o banco de dados
Execute o seguinte comando:

CREATE DATABASE IF NOT EXISTS hospital_db;

USE hospital_db;
2. Executar os arquivos SQL
Após criar o banco de dados, importe os arquivos na seguinte ordem:

hospital_db_pacientes.sql
hospital_db_medicos.sql
hospital_db_quartos.sql
hospital_db_internacoes.sql
hospital_db_consultas.sql
hospital_db_prescricoes.sql
Sem MySQL Workbench:

Abra sua conexão com o MySQL.
Selecione o banco de dados hospital_db.
Acesse Arquivo → Abrir Script SQL .
Escolha o primeiro arquivo SQL.
Execute o script pelo botão de raio.
Repita o procedimento para os demais arquivos, respeitando a ordem indicada.
Atenção: Os arquivos SQL possuem comandos DROP TABLE IF EXISTSe inserções de dados. Portanto, repetir-los novamente recria as respectivas tabelas e pode apagar os dados existentes.

3. Verifique a criação do banco
Após executar todos os arquivos, utilize:

USE hospital_db;

SHOW TABLES;
O resultado deverá apresentar como seis tabelas:

pacientes
médicos
quartos
internações
consultas
prescrições
Para conferir os registros:

SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM quartos;
SELECT * FROM internacoes;
SELECT * FROM consultas;
SELECT * FROM prescricoes;
📊 Índices e Otimização
Foram criados índices para facilitar buscas frequentes e melhorar o desempenho de determinadas consultas.

índice	Tabela	Campo
idx_pacientes_nome	pacientes	nome_paciente
idx_médicos_especialidade	médicos	especialidade
idx_consultas_data	consultas	consulta de dados
Também são utilizados índices associados a chaves primárias, chaves estrangeiras e restrições de unicidade.

📝 Consultas SQL
A estrutura permite desenvolver consultas para extrair informações importantes do hospital, utilizando recursos da linguagem SQL, como:

SELECT: Consultar informações.
WHERE: Filtrar registros.
JOIN: Relacionar diferentes tabelas.
GROUP BY: Agrupar informações.
ORDER BY: Ordenar resultados.
COUNT(): Contabilizar registros.
SUM(): Calcula valores acumulados.
AVG(): Calcular médias.
HAVING: Filtrar resultados agrupados.
Like: buscar padrões de texto em colunas de uma tabela.
1. Faturamento Total de Consultas por Convênio
Contextualização e Situação-Problema: O setor financeiro necessita de um levantamento simples do valor total arrecadado em consultas para os convênios que possuem "Saúde" sem nome, controlando o faturamento por parceiro.

imagem
2. Média do Valor de Consulta por Especialidade Médica
Contextualização e Situação-Problema: Uma clínica cooperativa deseja verificar a média do valor das consultas realizadas apenas nas especialidades ligadas à Cardiologia.

imagem
3. Valor Médio das Diárias por Tipo de Quarto
Contextualização e Situação-Problema: A gestão da infraestrutura hospitalar precisa analisar o valor médio do dia a dia praticado nas internações em proteção do tipo "Apartamento" ou "UTI".

imagem
4. Total de Consultas Realizadas por Médico
Contextualização e Situação-Problema: A diretoria de atendimento quer um relatório que liste o nome dos médicos e a soma total dos valores de suas consultas, filtrando apenas consultas com status de "Realizada" ou "Finalizada".

imagem
5. Soma de Diárias por Paciente com Sobrenome "Silva"
Contextualização e Situação-Problema: O setor de cobrança precisa identificar a soma acumulada do valor das diárias de internação para todos os pacientes que possuem o sobrenome "Silva".

imagem
6. Contagem de Prescrições por Status da Consulta
Contextualização e Situação-Problema: Uma farmácia hospitalar solicita a quantidade total de medicamentos prescritos agrupados pelo status da consulta correspondente, considerando apenas prescrições onde o medicamento contém "Dipirona" ou "Paracetamol".

imagem
7. Média de Valor de Consultas por Convênio e Especialidade
Contextualização e Situação-Problema: Em negociação contratual, os auditores do hospital querem saber o valor médio pago por consulta cruzando os convênios que contêm "Unimed" com a especialidade do médico.

imagem
8. Média de Diário de Internação por Convênio em Quartos de UTI
Contextualização e Situação-Problema: A regulação hospitalar precisa calcular o valor médio gasto em diários de internação agrupados por convênio, considerando unicamente os quartos classificados como "UTI".

imagem
9. Medicamentos Prescritos por Médico em Consultas Realizadas
Contextualização e Situação-Problema: A comissão de farmácia e terapêutica deseja saber a quantidade total de itens prescritos pelo médico nas consultas que foram marcadas como "Realizada".

imagem
10. Valor Total e Média de Consultas por Paciente
Contextualização e Situação-Problema: O atendimento ao cliente precisa de um extrato financeiro simples mostrando a soma e a média dos valores gastos em consultas por pacientes cujo nome começa com a letra "M".

imagem
Esses recursos permitem elaborar relatórios de consultas, internações, pacientes e valores hospitalares.

👨‍💻 Autor
Projeto desenvolvido como atividade acadêmica de Banco de Dados.

Autor: Felipe Lisboa Carvalho

📚 Objetivo Educacional
Este projeto tem como finalidade colocar na prática os conceitos de Banco de Dados Relacionais, incluindo:

Desenvolvimento de consultas SQL.
Criação e estruturação de tabelas.
Definição de chaves primárias e estrangeiras.
Relacionamentos e cardinalidade.
Inserção e manipulação de dados.
Projeto desenvolvido para fins educacionais. Os dados utilizados são fictícios e destinados exclusivamente a testes e projeções.
