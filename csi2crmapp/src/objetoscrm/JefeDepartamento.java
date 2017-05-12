package objetoscrm;

public class JefeDepartamento extends JefeEquipo {

	private String departamento, oficina;
	public JefeDepartamento(String nombre, String apellidos, String departamento, String oficina) {
		super(nombre, apellidos);
		this.departamento = departamento;
		this.oficina = oficina;
	}
	public String getDepartamento() {
		return departamento;
	}
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	public String getOficina() {
		return oficina;
	}
	public void setOficina(String oficina) {
		this.oficina = oficina;
	}
	
}
