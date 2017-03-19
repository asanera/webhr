package objetoscrm;

public class TrabajoSal {
	private String trabajos;
	private double salario;
	public TrabajoSal(String trabajos, double salario) {
		super();
		this.trabajos = trabajos;
		this.salario = salario;
	}
	public TrabajoSal(String trabajos, String salario) {
		super();
		this.trabajos = trabajos;
		try {
			this.salario = Double.parseDouble(salario);
		} catch (Exception e) {
			System.out.println("No se ha podido convertir en double");
		}
	}
	public String getTrabajos() {
		return trabajos;
	}
	public void setTrabajos(String trabajos) {
		this.trabajos = trabajos;
	}
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}
	

}
