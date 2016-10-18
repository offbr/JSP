package mono.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import board.business.QnaBean;
import board.business.QnaDto;
import mypage.business.MemberBean;
import mypage.business.MemberDto;
import product.business.ProductBean;
import product.business.ProductDto;

public interface SqlMapperInter {
	// --------- login 관련
	//Email 중복확인.
	@Select("select * from member where m_email = #{m_email}")
	public ArrayList<MemberBean> emailCheck(String m_email);

	//회원가입.
	@Insert("insert into member values(#{m_email}, #{m_name}, #{m_pass}, #{m_postcode}, #{m_address}, #{m_tel})")
	public boolean register(MemberBean bean);
	
	//로그인확인.
	@Select("select * from member where m_email = #{m_email} and m_pass= #{m_pass}")
	public ArrayList<MemberBean> loginCheck(Map<String, String> map);

	//정보수정 및 글등록시 / 정보값 가져오기;
	@Select("select * from member where m_email = #{m_email}")
	public MemberDto myinfo(String m_email);
	
	//update
	@Update("update member set m_name = #{m_name}, m_pass = #{m_pass}, m_postcode = #{m_postcode}, m_address = #{m_address}, m_tel = #{m_tel} where m_email = #{m_email}")
	public int updateInfo(MemberBean bean);
	
	// --------- board 관련
	//qna 리스트(페이지수)
	@Select("select * from board order by b_no desc limit #{pageChoice}, 10")
	public ArrayList<QnaBean> qnaList(int pageChoice);
	
	//qna 전체 게시글 수
	@Select("select count(b_no) from board")
	public int qnaCount();
	
	//qna 검색
	@Select("select * from board where ${stype} like '%' #{sword} '%' order by b_no desc")
	public ArrayList<QnaBean> qnaSearch(Map<String, String> map);
	
	//qna 비밀번호 확인
	@Select("select count(*) from board where b_no=#{b_no} and b_pass=#{b_pass}")
	public boolean qnaCheckPass(Map<String, String> map);
	
	//qna 비밀번호 확인 후 읽기 및 글 수정시 정보.
	@Select("select * from board where b_no=#{b_no}")
	public QnaDto qnaView(String b_no);
	
	//새글 등록시 번호값
	@Select("select max(b_no) from board")
	public int max_b_no();
	
	//새글 등록
	@Insert("insert into board values(#{b_no},#{b_name},#{b_pass},#{b_email},#{b_tel},#{b_title},#{b_content},now(),0)")
	public boolean qnaInsert(QnaBean bean);
	
	//글 삭제시
	@Delete("delete from board where b_no=#{b_no}")
	public boolean qnaDelete(String b_no);
	
	//글 수정시
	@Update("update board set b_pass=#{b_pass}, b_title=#{b_title}, b_content=#{b_content}, b_date=now() where b_no=#{b_no}")
	public boolean qnaUpdate(QnaBean bean);
	
	//------product관련
	//제품 전체자료 보기
	@Select("select * from product order by p_no desc")
	public ArrayList<ProductBean> productList();
	
	//제품 상세페이지 보기
	@Select("select * from product where p_no=#{p_no}")
	public ProductDto productView(String p_no);
	
	
}










