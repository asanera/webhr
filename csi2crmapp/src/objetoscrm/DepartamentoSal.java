package objetoscrm;

public class DepartamentoSal {
	private String departmentName;
	private double salario;
	public DepartamentoSal(String departmentName, double salario) {
		super();
		this.departmentName = departmentName;
		this.salario = salario;
	}
	public DepartamentoSal(String departmentName, String salario) {
		super();
		this.departmentName = departmentName;
		try {
			this.salario = Double.parseDouble(salario);
		} catch (Exception e) {
			System.out.println("No se ha podido convertir en double");
		}
		
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}

}
