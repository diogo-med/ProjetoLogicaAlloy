# Projeto Lógica com Alloy

Este repositório contém a especificação de um sistema de controle de acesso a repositórios, modelado em Alloy para a disciplina de Lógica para Computação.

## Professor
- Tiago Lima Massoni

## Participantes

- Diogo Medeiros – 123110779  
- Isaac Vieira Batista de Andrade – 123210378  
- José Daniel Brandão Nobrega – 123210303

## Descrição do Projeto

O objetivo do projeto é modelar um sistema simples de controle de acesso a repositórios de código em uma plataforma colaborativa (como GitHub ou GitLab),
utilizando a linguagem Alloy. A modelagem contempla:

- Organizações;
- Repositórios que devem pertencer a uma organização;
- Usuários que podem ter acesso a repositórios da organização que eles participam;
- Desenvolvedores (subtipo de usuário) que trabalham em repositórios;
- Limitação de 1 a 5 repositórios ativos por desenvolvedor;

## O que está incluído

- Assinaturas e relações principais (`Organizacao`, `Repositorio`, `Usuario`, `Desenvolvedor`);
- Fatos que impõem restrições e regras do sistema;
- Asserts que validam propriedades da modelagem;
- Predicado `exemplo` com um cenário de teste;
- Comandos `run` e `check` com escopo de 5.


