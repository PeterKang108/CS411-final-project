package utils;

import com.mongodb.MongoClientSettings;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MangoDBhelp {
        public static MongoDatabase getconn1(){
            //no password conn
            MongoClient mongoClient = MongoClients.create();;

            //连接到数据库
            MongoDatabase mongoDatabase = mongoClient.getDatabase("courses");

            //返回连接数据库对象
            return mongoDatabase;
        }

    public static MongoDatabase getconn2() {
            //password conn
        List<ServerAddress> adds = new ArrayList<>();

        List<MongoCredential> credentials = new ArrayList<>();
        //MongoCredential.createScramSha1Credential()三个参数分别为 用户名 数据库名称 密码
        MongoCredential mongoCredential = MongoCredential.createScramSha1Credential("admin", "databaseName", "password".toCharArray());
        credentials.add(mongoCredential);

        //通过连接认证获取MongoDB连接
        MongoClientSettings settings = MongoClientSettings.builder()
                .credential(mongoCredential)
                .applyToSslSettings(builder -> builder.enabled(true))
                .applyToClusterSettings(builder ->
                        builder.hosts(Arrays.asList(new ServerAddress("host1", 27017))))
                .build();

        MongoClient mongoClient = MongoClients.create(settings);
        //连接到数据库
        MongoDatabase mongoDatabase = mongoClient.getDatabase("AssembledComputers");

        //返回连接数据库对象
        return mongoDatabase;
    }

}
