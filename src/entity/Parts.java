package entity;

public class Parts {

    private int partsID;
    private double ratings;
    private double price;
    private String brand;
    private String partsName;
    private String type;

    public int getPartsID() {
        return partsID;
    }

    public void setPartsID(int partID) {
        this.partsID = partID;
    }

    public double getRatings() {
        return ratings;
    }

    public void setRatings(double ratings) {
        this.ratings = ratings;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getPartsName() {
        return partsName;
    }

    public void setPartsName(String partsName) {
        this.partsName = partsName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
