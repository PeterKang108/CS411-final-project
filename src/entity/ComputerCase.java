package entity;

public class ComputerCase extends Parts{
    private String Case_type;
    private int number_of_case_fan;
    private String RGB;
    private String side_panel;
    private String noise_proof;

    public String getCase_type() {
        return Case_type;
    }

    public void setCase_type(String case_type) {
        Case_type = case_type;
    }

    public int getNumber_of_case_fan() {
        return number_of_case_fan;
    }

    public void setNumber_of_case_fan(int number_of_case_fan) {
        this.number_of_case_fan = number_of_case_fan;
    }

    public String getRGB() {
        return RGB;
    }

    public void setRGB(String RGB) {
        this.RGB = RGB;
    }

    public String getSide_panel() {
        return side_panel;
    }

    public void setSide_panel(String side_panel) {
        this.side_panel = side_panel;
    }

    public String getNoise_proof() {
        return noise_proof;
    }

    public void setNoise_proof(String noise_proof) {
        this.noise_proof = noise_proof;
    }
}
