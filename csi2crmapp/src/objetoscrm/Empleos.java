package objetoscrm;

public class Empleos {

	private String titulo;
	private double sueldoMaximo;
	private double sueldoMinimo;

	public Oficios(String titulo, double sueldoMaximo double sueldoMinimo){
		this.titulo = titulo;
		try {
			this.sueldoMaximo = sueldoMaximo;
		} catch (Exception e) {
			this.sueldoMaximo = Double.parseDouble(sueldoMaximo);
		}
		try {
			this.sueldoMinimo = sueldoMinimo;
		} catch (Exception e) {
			this.sueldoMinimo = Double.parseDouble(sueldoMinimo);
		}
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public double getSueldoMaximo() {
		return sueldoMaximo;
	}

	public void setSueldoMaximo(double sueldoMaximo) {
		this.sueldoMaximo = sueldoMaximo;
	}

	public double getSueldoMinimo() {
		return sueldoMinimo;
	}

	public void setSueldoMinimo(double sueldoMinimo) {
		this.sueldoMinimo = sueldoMinimo;
	}

}
