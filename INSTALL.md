# Instalação do Banco de Perfis

## Requisitos

* **Oracle Java** versão **1.8**
* **Apache Maven** versão **3.0.x**
* **MySQL** versão **14.14**

## Configuração e Instalação

### Passo 1: Crie o Banco de Dados

* **Passo 1.0**: Acesse o **MySQL** na interface de sua preferência;
* **Passo 1.1**: Crie um usuário que será utilizado como dono do banco de dados do **Banco de Perfis**;
* **Passo 1.2**: Crie um banco de dados chamado `bancoperfis` associando o usuário criado anteriormente como dono deste banco;

### Passo 2: Altere as Configurações de Banco de Dados no Projeto

* **Passo 2.0**: Acesse o arquivo [src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml](src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml)
* **Passo 2.1**: Encontre a _bean_ de id `dataSource`:
```XML
<beans:bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close">
	<beans:property name="driverClassName" value="com.mysql.jdbc.Driver"/>
	<beans:property name="url" value="jdbc:mysql://localhost:3306/bancoperfis?useLegacyDatetimeCode=false&amp;serverTimezone=UCT"/>
	<beans:property name="username" value="root" />
	<beans:property name="password" value="root" />
</beans:bean>
```
* **Passo 2.2**: Modifique o atributo `value` da _property_ de nome `username` com o nome de usuário criado no MySQL no Passo 1.1;
* **Passo 2.3**: Modifique o atributo `value` da _property_ de nome `password` com a senha do usuário criado no MySQL no Passo 1.1;
* **Passo 2.4**: Encontre a _bean_ de id `hibernate4AnnotatedSessionFactory`:
```XML
<beans:bean id="hibernate4AnnotatedSessionFactory" class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">
		<beans:property name="dataSource" ref="dataSource" />
		<beans:property name="annotatedClasses">
			<beans:list>
				<beans:value>br.unb.itrac.model.Competency</beans:value>
				<beans:value>br.unb.itrac.model.Collaborator</beans:value>
				<beans:value>br.unb.itrac.model.Document</beans:value>
				<beans:value>br.unb.itrac.model.Contract</beans:value>
				<beans:value>br.unb.itrac.model.Profile</beans:value>
			</beans:list>
		</beans:property>
		<beans:property name="hibernateProperties">
			<beans:props>
				<beans:prop key="hibernate.dialect">org.hibernate.dialect.MySQL5InnoDBDialect</beans:prop>
				<beans:prop key="hibernate.show_sql">true</beans:prop>
				<beans:prop key="hibernate.hbm2ddl.auto">update</beans:prop>
			</beans:props>
		</beans:property>
	</beans:bean>
```
* **Passo 2.5**: Modifique a _key_ `hibernate.hbm2ddl.auto` da _property_ de nome `hibernateProperties` de `update` para `create`.

### Passo 3: Coloque em Produção

* **Passo 3.0**: Configure o _Java Servlet Container_ de sua preferência;
* **Passo 3.1**: Insira o projeto no _Java Servlet Container_;
* **Passo 3.2**: Inicie o servidor. Ao iniciar, o Hibernate irá montar a estrutura do banco de dados automaticamente;

### Passo 4: Modifique o Hibernate

* **Passo 4.0**: Acesse o arquivo [src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml](src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml)
* **Passo 4.1**: Encontre a _bean_ de id `hibernate4AnnotatedSessionFactory`:
```XML
<beans:bean id="hibernate4AnnotatedSessionFactory" class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">
		<beans:property name="dataSource" ref="dataSource" />
		<beans:property name="annotatedClasses">
			<beans:list>
				<beans:value>br.unb.itrac.model.Competency</beans:value>
				<beans:value>br.unb.itrac.model.Collaborator</beans:value>
				<beans:value>br.unb.itrac.model.Document</beans:value>
				<beans:value>br.unb.itrac.model.Contract</beans:value>
				<beans:value>br.unb.itrac.model.Profile</beans:value>
			</beans:list>
		</beans:property>
		<beans:property name="hibernateProperties">
			<beans:props>
				<beans:prop key="hibernate.dialect">org.hibernate.dialect.MySQL5InnoDBDialect</beans:prop>
				<beans:prop key="hibernate.show_sql">true</beans:prop>
				<beans:prop key="hibernate.hbm2ddl.auto">create</beans:prop>
			</beans:props>
		</beans:property>
	</beans:bean>
```
* **Passo 4.2**: Modifique a _key_ `hibernate.hbm2ddl.auto` da _property_ de nome `hibernateProperties` de `create` para `update`.
