# 🚨 Simulador de Sistema de Alarme Industrial

> **Disciplina:** Projeto Integrador I  
> **Curso:** Engenharia de Computação — Universidade Federal do Pampa (UNIPAMPA — Campus Bagé)  
> **Ferramentas:** MARS (Assembly MIPS) & Logisim  

---

## 📄 Sobre o Projeto

Este projeto consiste no desenvolvimento e simulação de um **Sistema de Alarme Industrial** voltado para o monitoramento de acesso e movimentação em áreas restritas[cite: 1]. O trabalho integra conceitos cruciais da Engenharia de Computação, abrangendo desde a **lógica digital básica** até a **arquitetura de computadores e simulação de hardware**[cite: 1].

---

## 🎯 Objetivos

- **Lógica Digital:** Construção e análise de Tabelas Verdade e Simplificação de Expressões Booleanas[cite: 1, 2].
- **Arquitetura de Computadores:** Programação em linguagem Assembly MIPS utilizando o simulador MARS, manipulando operações bit a bit e chamadas de sistema (`syscall`)[cite: 1, 2, 3].
- **Sistemas Digitais:** Projeto, montagem e teste do circuito lógico equivalente utilizando o simulador Logisim[cite: 1, 3].
- **Documentação Técnica:** Elaboração de relatório técnico nos padrões da Sociedade Brasileira de Computação (SBC).

---

## 🧠 Especificação Lógica do Sistema

### 1. Sensores e Sinais de Entrada

O sistema recebe entradas de três sensores binários:

| Variável | Sensor | Estado `0` | Estado `1` |
| :---: | :--- | :--- | :--- |
| **A** | Porta de Acesso | Porta Fechada | Porta Aberta[cite: 1] |
| **B** | Detector de Movimento | Sem Movimento | Movimento Detectado[cite: 1] |
| **C** | Chave Geral de Ativação | Sistema Desligado | Sistema Ligado[cite: 1] |

### 2. Regra de Negócio da Saída ($S$)

A saída $S$ representa o estado do alarme (`0` = Desligado, `1` = Ligado)[cite: 2].  
O alarme será acionado **exclusivamente** quando o sistema estiver **ligado ($C = 1$)** e houver ao menos uma condição de risco presente: **porta aberta ($A = 1$) OU movimento detectado ($B = 1$)**[cite: 2].

---

## 🛠️ Implementações

### 1. Assembly MIPS (MARS)
O programa interativo foi desenvolvido para a arquitetura MIPS[cite: 2]:
- Solicita as entradas binárias ($A$, $B$ e $C$) ao usuário via `syscall`.
- Executa o processamento lógico bit a bit utilizando instruções MIPS recomendadas (`and`, `or`, `xori`, `li`, `syscall`).
- Exibe o resultado do alarme no console[cite: 2].
- Todo o código fonte possui documentação e comentários detalhados[cite: 3, 5].

### 2. Circuito Digital (Logisim)
Esquema funcional equivalente implementado no software Logisim:
- Mapeamento das entradas $A$, $B$ e $C$.
- Portas lógicas **AND**, **OR** e **Inversores**[cite: 3].
- LED indicador para visualização do estado da saída $S$[cite: 3].
- Organização do diagrama com layout limpo e legível[cite: 5].

---

## 📁 Estrutura do Repositório

```text
├── src/
│   ├── alarme_mips.asm    # Código Assembly MIPS para o MARS
│   └── circuito_alarme.circ # Circuito digital para o Logisim
├── docs/
│   └── Relatorio_SBC.pdf  # Relatório completo formatado no padrão SBC
└── README.md              # Documentação principal do repositório
