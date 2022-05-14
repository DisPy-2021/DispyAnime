# DispyAnime
### Para executar o back-end, você precisará de uma imagem docker do MySQL com a porta 3306
Para baixar o docker acesse o link [https://www.docker.com/products/docker-desktop].<br/>
Caso for usuario de linux acesse o link e siga as instrucoes [https://docs.docker.com/engine/install/{sua Distribuicao do Linux}/].<br/>
Para fazer download da imagem execute o codigo na linha de comando :```docker pull mysql```<br/>
Para criar um container com a imagem do MySQL execute o code na linha de comando: <br/>
```docker run -p 3306:3306 --name {Nome que queira dar} -e MYSQL_ROOT_PASSWORD={Sua senha de preferencia} -d mysql:latest```

Com o container pronto, você pode copiar e colar o código no arquivo CreateTables.sql no repositório DataBase para criar as tabelas no servidor MySQL. Para preencher as tabelas, você pode fazer isso sozinho ou executar os arquivos com a extensão .sql no mesmo repositório.

## DAO
No package 'com.dispy.dao' a classe ConnectionMySQL serve para se conectar com o banco e preparar para executar as queries no MySQL, com a biblioteca SQL do Java.<br />
Para se conectar com o servidor MySQL utilizamos um companion object no pacote 'com.dispy.shared' na classe SharedPaths, nele há 4 variáveis:<br />
***mySQLHostname***: onde está sendo hospedado o servidor;<br />
***mySQLName***: O nome do Scheme que está utilizando;<br />
***mySQLUser***: O usuário que irá acessar o banco de dados;<br />
***mySQLPassword***: A senha para entrar no banco de dados;<br />
Há também a interface genericDAO que determina métodos que pertencem a todas as outras classes DAO do pacote(AnimeDAO, GenreDAO, ReviewDAO, UserDAO, UserDataDAO).

## DataClass
No pacote 'com.dispy.dataclasses' está os datas classes de cada tabela criada, para facilitar alteramos o método toString para retornar uma String no formato JSON.

## Format
No pacote 'com.dispy.format' está a classe que auxilia a transformar o JSON recebido pelo front-end e transforma em alguma das Data classes citadas anteriormente.

## Plugins
No pacote 'com.dispy.plugins' está o método que configura as rotas definidas. <br/>
O que estará entre '{ }' pode ser substituido.

### Requisições
#### Get
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/anime```: Envia uma lista com todos os animes na base dados no formato de um JSON array.<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/anime/{anime_id}```: Envia as informações de um anime ,com o id definido na URL, em formato JSON.<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/anime/{anime_id}/reviews```: Envia as informações de todas as review de um anime em formato de um JSON array.<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/user/{user_id}```: Envia as informações de um usuário no formato JSON.<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/user/{user_id}/watchlist```: Envia a Watch List de um usuario com um id correspondente ao da URL.<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/user/{user_id}/finished```: Envia a Finished List de um usuario com o id conrrespondente ao da URL.<br/>
#### Post
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/user/login``` : Recebe um JSON com o userName e Password verifica se há algum usuário compatível com os dois e se houver envia as informações do usuário correspondente com o userName recebido em formato JSON.<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/user/new```: Recebe um JSON com user_id, userName, nickName, email, password, profilePhoto e cria um novo usuario, então retorna um JSON com as informações do usuário que confirma a sua criação.<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/user/{user_id}/anime/{anime_id}/reviews/new```: Recebe um JSON com o review_id, user_id, anime_id, reviewText, likes, dislikes, grade, então retorna "review added".<br/>
```http://{ip Do servidor que hospeda seu banco}:{porta utilizada}/user/{user_id}/anime/{anime_id}/add/watchList"```: Recebe um JSON com o user_id, anime_id e type_list= "3" e verifica se há esse anime na watchList desse usuário, caso exista retorna 'Anime already in watchList', se não 'Anime added to watchList'.<br/>

## Casos de uso
https://documenter.getpostman.com/view/18302168/UVJckGPK

## Front

### Login Page
![image](https://user-images.githubusercontent.com/79317347/141398535-f441fd91-20fc-4dda-9a7a-29665945ba1e.png)

### Register Page
![image](https://user-images.githubusercontent.com/79317347/141398791-975b9e26-ae2c-4bad-9ffc-232db591b156.png)

### Home Page
![image](https://user-images.githubusercontent.com/79259612/143783338-1028617b-49a5-4f07-abed-c00d8a9a8236.png)

### Review Page
![image](https://user-images.githubusercontent.com/79259612/143783382-7189837a-e1e9-4374-bacf-9c6f1174fa69.png)

### Perfil Page
![image](https://user-images.githubusercontent.com/79317347/141398727-11cbc40e-d072-41fc-8e0e-65be181fe7ff.png)
