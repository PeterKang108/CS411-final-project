package DAO;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import entity.Memory;
import entity.MongoDBresult;
import org.bson.Document;
import org.bson.types.ObjectId;
import utils.MangoDBhelp;

import java.util.ArrayList;
import java.util.Map;

import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Updates.*;

public class MongoDAO {
    public int insertDocument(Map<String, String> map, String username){

        MongoDatabase database = MangoDBhelp.getconn1();
        MongoCollection<Document> collection = database.getCollection("userhistory");
        Document document = new Document("user", username);
        for (String key : map.keySet()) {
            document.append(key, Integer.parseInt(map.get(key)));
        }
        collection.insertOne(document);
        return 1;
    }
    public int replaceDocument(Map<String, String> map, String username, String id){
        MongoDatabase database = MangoDBhelp.getconn1();
        MongoCollection<Document> collection = database.getCollection("userhistory");
        Document document = new Document("user", username);
        for (String key : map.keySet()) {
            document.append(key, Integer.parseInt(map.get(key)));
        }
        collection.replaceOne(eq("_id", new ObjectId(id)), document);
        return 1;
    }
    public int deleteDocument(String id){
        MongoDatabase database = MangoDBhelp.getconn1();
        MongoCollection<Document> collection = database.getCollection("userhistory");
        collection.deleteOne(eq("_id", new ObjectId(id)));
        return 1;
    }
    public ArrayList<MongoDBresult> findUserDocuments(String username){
        ArrayList<MongoDBresult> list = new ArrayList<MongoDBresult>();
        MongoDatabase database = MangoDBhelp.getconn1();
        MongoCollection<Document> collection = database.getCollection("userhistory");
        FindIterable<Document> findIterable = collection.find(eq("user", username));
        MongoCursor<Document> mongoCursor = findIterable.iterator();
        int flag = 0;
        while(mongoCursor.hasNext()){
            flag = 1;
            Document curr= mongoCursor.next();
            MongoDBresult result = new MongoDBresult();
            result.setId(curr.getObjectId("_id").toString());
            result.setUser(username);
            result.setCPU(curr.getInteger("CPU"));
            if(curr.containsKey("GPU")){
                 result.setGPU(curr.getInteger("GPU"));
            }
            if(curr.containsKey("GPU2")){
                result.setGPU2(curr.getInteger("GPU2"));
            }
            result.setMotherboard(curr.getInteger("Motherboard"));
            result.setComputerCase(curr.getInteger("ComputerCase"));
            result.setMemory(curr.getInteger("Memory"));
            if(curr.containsKey("Memory2")){
                result.setMemory2(curr.getInteger("Memory2"));
            }
            result.setStorage(curr.getInteger("Storage"));
            if(curr.containsKey("Storage2")){
                result.setStorage2(curr.getInteger("Storage2"));
            }
            if(curr.containsKey("Storage3")){
                result.setStorage3(curr.getInteger("Storage3"));
            }
            if(curr.containsKey("Storage4")){
                result.setStorage4(curr.getInteger("Storage4"));
            }
            if(curr.containsKey("Storage5")){
                result.setStorage5(curr.getInteger("Storage5"));
            }
            if(curr.containsKey("Storage6")){
                result.setStorage6(curr.getInteger("Storage6"));
            }
            result.setCoolingsystem(curr.getInteger("Coolingsystem"));
            result.setPowersupply(curr.getInteger("Powersupply"));
            list.add(result);

        }
        if(flag == 0){
            return null;
        }


        return list;
    }

    public int countUserhistory(String username){
        MongoDatabase database = MangoDBhelp.getconn1();
        MongoCollection<Document> collection = database.getCollection("userhistory");
        FindIterable<Document> findIterable = collection.find(eq("user", username));
        MongoCursor<Document> mongoCursor = findIterable.iterator();
        int count = 0;
        while(mongoCursor.hasNext()){
            Document curr= mongoCursor.next();
            count++;

        }
        return count;
    }
}
