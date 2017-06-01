# Instalação para Desenvolvimento

## Requisitos

* **Oracle Java** versão **1.8**
* **Apache Maven** versão **3.0.x**
* **MySQL** versão **14.14**

## Instruções para IDE [STS](https://spring.io/tools/sts)

* **Passo 1**: [Crie o Banco de Dados](INSTALL.md#passo-1-crie-o-banco-de-dados);
* **Passo 2**: Realize o _download_ da IDE [STS](https://spring.io/tools/sts);
* **Passo 3**: Inicie a IDE, configurando a _workspace_ no caminho de preferência. Lembre-se de manter o código-fonte do projeto neste _workspace_;
* **Passo 4**: Vá em `File -> Import...`;
* **Passo 5**: Encontre o item `Existing Maven Projects`, na pasta `Maven` e clique em `Next`;
* **Passo 6**: Selecione o `pom.xml` do projeto **Banco de Perfis** e clique em `Finish`;
* **Passo 7**: [Altere as Configurações de Banco de Dados no Projeto](INSTALL.md#passo-2-altere-as-configurações-de-banco-de-dados-no-projeto);
* **Passo 8**: Clique com o botão direito na raíz do projeto no `Package Explorer` e selecione `Run As -> Run on Server...`;
* **Passo 9**: Escolha/Configure o servidor de preferência (Padrão: `Pivotal tc Server Developer Edition`) e clique em `Finish`.
