package pack.business;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface SqlMapperInter { //SQL을 method에 맵핑
	@Select("select * from membertab")
	public List<DataDto> selectDataAll();
	
	@Select("select * from membertab where id=#{id}")
	public DataDto selectDataById(String id);
	
	@Insert("insert into membertab values(#{id},#{name},#{password},now())")
	public int insertData(DataDto dto);
	
	@Update("update membertab set name=#{name} where id=#{id}")
	public int updateData(DataDto dto);
	
	@Delete("delete from membertab where id=#{id}")
	public int deleteData(String id);
	
	
	
}
