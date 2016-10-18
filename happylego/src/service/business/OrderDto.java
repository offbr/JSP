package service.business;

public class OrderDto {
	private String o_gid, o_pno, o_sdate, o_edate, o_state, p_name, p_price, p_size, total;
	private int o_no;
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getP_name() {
		return p_name;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public String getO_gid() {
		return o_gid;
	}
	public void setO_gid(String o_gid) {
		this.o_gid = o_gid;
	}
	public String getO_pno() {
		return o_pno;
	}
	public void setO_pno(String o_pno) {
		this.o_pno = o_pno;
	}
	public String getO_sdate() {
		return o_sdate;
	}
	public void setO_sdate(String o_sdate) {
		this.o_sdate = o_sdate;
	}
	public String getO_edate() {
		return o_edate;
	}
	public void setO_edate(String o_edate) {
		this.o_edate = o_edate;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	
	
}

