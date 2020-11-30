package entity;

public class MongoDBresult {
    private String id;
    private String user;
    private int CPU;
    private int GPU;
    private int GPU2;
    private int Motherboard;
    private int ComputerCase;
    private int Memory;
    private int Memory2;
    private int Storage;
    private int Storage2;
    private int Storage3;
    private int Storage4;
    private int Storage5;
    private int Storage6;
    private int Coolingsystem;
    private int Powersupply;

    public MongoDBresult(){
        GPU = -1;
        GPU2 = -1;
        Memory2 = -1;
        Storage2 = -1;
        Storage3 = -1;
        Storage4 = -1;
        Storage5 = -1;
        Storage6 = -1;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id=id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user=user;
    }

    public int getCPU() {
        return CPU;
    }

    public void setCPU(int CPU) {
        this.CPU=CPU;
    }

    public int getGPU() {
        return GPU;
    }

    public void setGPU(int GPU) {
        this.GPU=GPU;
    }

    public int getGPU2() {
        return GPU2;
    }

    public void setGPU2(int GPU2) {
        this.GPU2=GPU2;
    }

    public int getMotherboard() {
        return Motherboard;
    }

    public void setMotherboard(int motherboard) {
        Motherboard=motherboard;
    }

    public int getComputerCase() {
        return ComputerCase;
    }

    public void setComputerCase(int computerCase) {
        ComputerCase=computerCase;
    }

    public int getMemory() {
        return Memory;
    }

    public void setMemory(int memory) {
        Memory=memory;
    }

    public int getMemory2() {
        return Memory2;
    }

    public void setMemory2(int memory2) {
        Memory2=memory2;
    }

    public int getStorage() {
        return Storage;
    }

    public void setStorage(int storage) {
        Storage=storage;
    }

    public int getStorage2() {
        return Storage2;
    }

    public void setStorage2(int storage2) {
        Storage2=storage2;
    }

    public int getStorage3() {
        return Storage3;
    }

    public void setStorage3(int storage3) {
        Storage3=storage3;
    }

    public int getStorage4() {
        return Storage4;
    }

    public void setStorage4(int storage4) {
        Storage4=storage4;
    }

    public int getStorage5() {
        return Storage5;
    }

    public void setStorage5(int storage5) {
        Storage5=storage5;
    }

    public int getStorage6() {
        return Storage6;
    }

    public void setStorage6(int storage6) {
        Storage6=storage6;
    }

    public int getCoolingsystem() {
        return Coolingsystem;
    }

    public void setCoolingsystem(int coolingsystem) {
        Coolingsystem=coolingsystem;
    }

    public int getPowersupply() {
        return Powersupply;
    }

    public void setPowersupply(int powersupply) {
        Powersupply=powersupply;
    }
}
