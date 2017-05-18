package objetoscrm;

public class Empleos {
	private String id;
	private String titulo;
	private double sueldoMax;
	private double sueldoMin;

	public Empleos(String id, String titulo, String sueldoMax, String sueldoMin) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.sueldoMax = Double.parseDouble(sueldoMax);
		this.sueldoMin = Double.parseDouble(sueldoMin);
	}

	public String getId() {
		return id;
	}
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public double getSueldoMax() {
		return sueldoMax;
	}

	public void setSueldoMax(double sueldoMax) {
		this.sueldoMax = sueldoMax;
	}

	public double getSueldoMin() {
		return sueldoMin;
	}

	public void setSueldoMin(double sueldoMin) {
		this.sueldoMin = sueldoMin;
	}
	

}
