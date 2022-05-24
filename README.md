# Blockchain-hothints


#### NodeJS with version

```
sudo npm cache clean -f
sudo npm install -g n
sudo n stable (можно указать конкретную версию)
```

#### installing @openzeppline contracts

```
sudo npm install @openzeppelin/contracts
```



#### хороший курс по solidity в remix-ide
[видео](https://www.youtube.com/watch?v=alK0PY-Qa4Q&ab_channel=IlyaKrukowski)
#### remix-ide install mac m1
1. install brew

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

2. export path

  ```
  export PATH=/opt/homebrew/bin:$PATH
  ```

3. install remix-ide

  ```
  brew install --cask remix-ide
  ```
4. mac не даст отрыть приложение, так как разработчик неизвестен. Жмем на вопрос и переходим в настройки. Подтверждаем, что приложение remix-ide можно открывать. 


#### тесты с помощью truffle
1. установка Ganache
2. добавление truffle-config.js в проект, обязательно выставить низкую цену газа и побольше эфира на балансах аккаунтов
3. выполнить 
```
truffle migrate
```
4. выполнить 
```
truffle test
```
