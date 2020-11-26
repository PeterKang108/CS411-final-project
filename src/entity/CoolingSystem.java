package entity;

public class CoolingSystem extends Parts{
    private String cooler_type;
    private double radiator_size;
    private String RGB;
    private String compatible_socket;

    public String getCooler_type() {
        return cooler_type;
    }

    public void setCooler_type(String cooler_type) {
        this.cooler_type = cooler_type;
    }

    public double getRadiator_size() {
        return radiator_size;
    }

    public void setRadiator_size(double radiator_size) {
        this.radiator_size = radiator_size;
    }

    public String getRGB() {
        return RGB;
    }

    public void setRGB(String RGB) {
        this.RGB = RGB;
    }

    public String getCompatible_socket() {
        return compatible_socket;
    }

    public void setCompatible_socket(String compatible_socket) {
        this.compatible_socket = compatible_socket;
    }
}
