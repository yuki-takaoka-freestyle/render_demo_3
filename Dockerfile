# ビルドステージ
# maven:3.8.5-openjdk-17という名前のDockerイメージを基に新しいビルドステージを作成します。
FROM maven:3.8.5-openjdk-17 as build

# ホストマシンの現在のディレクトリのすべてのファイルとディレクトリをDockerイメージにコピーします。
COPY . .

# Mavenを使用してプロジェクトをビルドし、テストをスキップします。
RUN mvn clean package -DskipTests


# パッケージステージ
# openjdk:17.0.1-jdk-slimという名前のDockerイメージを基に新しいパッケージステージを作成します。
FROM openjdk:17.0.1-jdk-slim

# ビルドステージで作成したJARファイルをパッケージステージにコピーします。
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar

# Dockerコンテナが8181ポートで待ち受けるように設定します。
EXPOSE 8181

# Dockerコンテナが起動したときに実行するコマンドを設定します。ここではJavaアプリケーションを起動します。
ENTRYPOINT ["java","-jar","demo.jar"]
