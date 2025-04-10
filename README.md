# Projeto Lógica com Alloy

Este repositório contém a especificação de um sistema de controle de acesso a repositórios, modelado em Alloy para a disciplina de Lógica para Computação.

## Descrição do Projeto

O objetivo do projeto é modelar um sistema simples de controle de acesso a repositórios de código em uma plataforma colaborativa (como GitHub ou GitLab),
utilizando a linguagem Alloy. A modelagem contempla:

- Organizações;
- Repositórios que devem pertencer a uma organização;
- Usuários que podem ter acesso a repositórios da organização que eles participam;
- Desenvolvedores (subtipo de usuário) que trabalham em repositórios;
- Regras de acesso baseadas na organização;
- Limite de 5 repositórios ativos por desenvolvedor;
- Situações com usuários ou repositórios sem vínculo (permitidas pelo sistema).

## O que está incluído

- Assinaturas e relações principais (`Organizacao`, `Repositorio`, `Usuario`, `Desenvolvedor`);
- Fatos que impõem restrições e regras do sistema;
- Assertivas que validam propriedades da modelagem;
- Predicado `exemplo` com um cenário de teste;
- Comandos `run` e `check` com escopo de 5.

## Participantes

- Diogo Medeiros – 123110779  
- Isaac Vieira Batista de Andrade – 123210378  
- José Daniel Brandão Nobrega – 123210303

## Requisitos atendidos

- Modelagem de sistema com entidades e relações coerentes com a descrição;
- Uso de `sig`, `fact`, `assert`, `pred` e `check` conforme solicitado;
- Definição de cenário exemplo (`pred exemplo`) com `run` apropriado;
- Verificação de propriedades com `check` no escopo definido.
