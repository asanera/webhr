package objetoscrm;

public class PaisSal {
		private String countryName;
		private double salario;
		public PaisSal(String countryName, double salario) {
			super();
			this.countryName = countryName;
			this.salario = salario;
		}
		public PaisSal(String countryName, String salario) {
			super();
			this.countryName = countryName;
			try {
				this.salario = Double.parseDouble(salario);
			} catch (Exception e) {
				System.out.println(e);
			}
			
		}
		public String getCountryName() {
			return countryName;
		}
		public void setCountryName(String countryName) {
			this.countryName = countryName;
		}
		public double getSalario() {
			return salario;
		}
		public void setSalario(double salario) {
			this.salario = salario;
		}
		
		
		
}
