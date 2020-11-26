package entity;

public class Storage extends Parts{
    private String storage_type;
    private int capacity;
    private String Interface;

    public String getStorage_type() {
        return storage_type;
    }

    public void setStorage_type(String storage_type) {
        this.storage_type = storage_type;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getInterface() {
        return Interface;
    }

    public void setInterface(String anInterface) {
        Interface = anInterface;
    }
}
