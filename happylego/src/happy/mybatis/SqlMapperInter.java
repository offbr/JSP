package happy.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mypage.business.GuestBean;
import mypage.business.GuestDto;
import mypage.business.ZiptabBean;
import service.business.OrderDto;

public interface SqlMapperInter {
	//zipcode 얻기
	@Select("select * from ziptab where area3 like #{area3} '%'")
	public ArrayList<ZiptabBean> zipserch(String zipcode);
	
	//id 중복확인.
	@Select("select * from guest where g_id = #{g_id}")
	public ArrayList<GuestDto> idcheck(String g_id);

	
	//회원가입
	@Insert("insert into guest values(#{g_id},#{g_pass},#{g_name}, #{zipcode}, #{g_address}, #{g_phone}, #{g_mail})")
	public boolean joinok(GuestBean bean);
	
	//로그인 확인
	@Select("select * from guest where g_id = #{g_id} and g_pass = #{g_pass}")
	public ArrayList<GuestBean> logincheck(Map<String, String> map);
	
	//나의정보 얻기
	@Select("select * from guest where g_id = #{g_id}")
	public GuestDto myinfo(String g_id);
	
	//update
	@Update("update guest set g_pass = #{g_pass}, zipcode = #{zipcode}, g_address = #{g_address}, g_phone = #{g_phone}, g_mail = #{g_mail} where g_id = #{g_id}")
	public int update(Map<String, String> map);
	
	//delete
	@Delete("delete from guest where g_id = #{g_id}")
	public boolean delete(String g_id);
	
	//listall	
	@Select("select p_name, p_size, p_price, o_sdate, o_edate, o_state from orderlist left outer join product on p_no = o_pno where o_gid = #{g_id}")
	public ArrayList<OrderDto> listall(String g_id);
	
	//saleschart
	@Select("select p_price, o_sdate, o_edate from product inner join orderlist on p_no = o_pno")
	public ArrayList<OrderDto> salesChart();
	
	//rentalChart
	@Select("select p_name, count(p_name) as total from orderlist inner join product on p_no = o_pno group by p_name order by total desc limit 0,5")
	public ArrayList<OrderDto> rentalChart();
}
