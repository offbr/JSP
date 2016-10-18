package pack;

public class Para_exProcess {
	private Para_exBean para_exBean;

	public void setPara_exBean(Para_exBean para_exBean) {
		this.para_exBean = para_exBean;
	}
	
	public double getSaleMoney(){
		return (int) Math.round(para_exBean.getMoney() * (para_exBean.getSale() * 0.01));
	}
	
	public double getTot(){
		return (int) Math.round(para_exBean.getMoney() - para_exBean.getMoney() * (para_exBean.getSale() * 0.01));
	}
}
