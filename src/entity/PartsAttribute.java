package entity;

public class PartsAttribute {
    double price;
    String Brand;
    int RGB;
    int noiseproof;

    public PartsAttribute(){
        Brand = null;
        RGB = -1;
        noiseproof = -1;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price=price;
    }

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String brand) {
        Brand=brand;
    }

    public int getRGB() {
        return RGB;
    }

    public void setRGB(int RGB) {
        this.RGB=RGB;
    }

    public int getNoiseproof() {
        return noiseproof;
    }

    public void setNoiseproof(int noiseproof) {
        this.noiseproof=noiseproof;
    }
}
